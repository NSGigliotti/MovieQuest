using System;
using System.Text.Json;
using System.Text.RegularExpressions;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using MySqlX.XDevAPI.Common;
using Org.BouncyCastle.Security;

namespace User.Routes;

public static class UserRoute
{
    public static bool ValidateEmail(string email)
    {
        var regex = new Regex(@"^[^@\s]+@[^@\s]+\.[^@\s]+$");
        return regex.IsMatch(email);
    }

    public static async Task<bool> EmailExist(string? connectionString, string email)
    {
        try
        {
            using var connection = new MySqlConnection(connectionString);

            string query = "SELECT COUNT(*) FROM Users WHERE Email = @Email";

            await connection.OpenAsync();

            using var command = new MySqlCommand(query, connection);
            command.Parameters.AddWithValue("@Email", email);

            long count = (long)await command.ExecuteScalarAsync();

            return count > 0;
        }
        catch (System.Exception)
        {
            return false;
        }
    }

    public static void UserRoutes(this WebApplication app, string? connectionString)
    {
        app.MapPost(
            pattern: "userRegister",
            async (
                [FromBody] UserRegister userRegister,
                ApplicationDbContext db,
                TokenService _tokenService
            ) =>
            {
                Dictionary<string, object> map = new Dictionary<string, object>();

                if (userRegister.Name == "")
                {
                    return Results.Problem("Nome necessario");
                }

                if (!ValidateEmail(userRegister.Email))
                {
                    return Results.Problem("INVALID_CREDENTIALS");
                }

                if (await EmailExist(connectionString, userRegister.Email))
                {
                    return Results.Problem("EMAIL_ALREADY");
                }

                if (userRegister.Password != userRegister.CheckPassword)
                {
                    return Results.Problem("Senhas nao correspondem");
                }

                var passwordHasher = new PasswordHasher<Object>();

                string hashPassword = passwordHasher.HashPassword(null, userRegister.Password);

                UserModel user = new(
                    name: userRegister.Name,
                    email: userRegister.Email,
                    password: hashPassword
                );

                db.Users.Add(user);
                await db.SaveChangesAsync();

                var token = _tokenService.GenerationToken(user);

                LoginUserPayload loginUserPayload = new LoginUserPayload
                {
                    Name = userRegister.Name,
                    Email = userRegister.Email,
                    Token = token,
                };

                var loginUserPayloadJSON = JsonSerializer.SerializeToNode(loginUserPayload);

                map.Add("results", loginUserPayloadJSON);

                return Results.Ok(map);
            }
        );

        app.MapPost(
            pattern: "login",
            async ([FromBody] LoginRequest request, TokenService _tokenService) =>
            {
                Dictionary<string, object> map = new Dictionary<string, object>();

                if (!await EmailExist(connectionString, request.Email))
                {
                    return Results.Problem("INVALID_CREDENTIALS");
                }

                using var connection = new MySqlConnection(connectionString);
                connection.Open();

                string query = "SELECT * FROM Users WHERE Email = @Email";

                await using var command = new MySqlCommand(query, connection);

                command.Parameters.AddWithValue("@Email", request.Email);

                await using var userLogin = command.ExecuteReader();

                if (!userLogin.Read())
                {
                    return Results.Problem("Erro de leitura");
                }

                UserModel user = new UserModel
                {
                    Id = Guid.Parse(userLogin["id"].ToString()),
                    Name = userLogin["Name"].ToString(),
                    Email = userLogin["Email"].ToString(),
                    Password = userLogin["Password"].ToString(),
                };

                var passwordHasher = new PasswordHasher<object>();

                var result = passwordHasher.VerifyHashedPassword(
                    null,
                    user.Password,
                    request.Password
                );

                if (result == PasswordVerificationResult.Failed)
                {
                    return Results.Problem("INVALID_CREDENTIALS");
                }

                var token = _tokenService.GenerationToken(user);

                LoginUserPayload loginUserPayload = new LoginUserPayload
                {
                    Name = userLogin["Name"].ToString(),
                    Email = userLogin["Email"].ToString(),
                    Token = token,
                };

                var loginUserPayloadJSON = JsonSerializer.SerializeToNode(loginUserPayload);

                map.Add("results", loginUserPayloadJSON);

                return Results.Ok(map);
            }
        );

        app.MapPost(
            pattern: "validatetoken",
            async (HttpRequest request, TokenService _tokenService, ApplicationDbContext db) =>
            {
                var token = request.Headers["Authorization"].FirstOrDefault()?.Split(" ").Last();

                UserModel userToken = _tokenService.DecodeAndValidateToken(token);

                if (userToken == null)
                {
                    return Results.Problem("Invalid session token");
                }

                Dictionary<string, object> map = new Dictionary<string, object>();

                LoginUserPayload loginUserPayload = new LoginUserPayload
                {
                    Name = userToken.Name,
                    Email = userToken.Email,
                    Token = token,
                };

                var loginUserPayloadJSON = JsonSerializer.SerializeToNode(loginUserPayload);

                map.Add("results", loginUserPayloadJSON);

                return Results.Ok(map);
            }
        );

        app.MapPost(
            pattern: "changepassword",
            async (
                ChangePassword password,
                HttpRequest request,
                TokenService _tokenService,
                ApplicationDbContext db
            ) =>
            {
                Dictionary<string, object> map = new Dictionary<string, object>();

                //   var token = request.Headers["Authorization"].FirstOrDefault()?.Split(" ").Last();

                var authHeader = request.Headers["Authorization"].FirstOrDefault();

                var token = authHeader?.Split(" ").Last();

                UserModel userToken = null;

                if (!string.IsNullOrEmpty(token))
                {
                    try
                    {
                        userToken = _tokenService.DecodeAndValidateToken(token);
                    }
                    catch (Exception ex)
                    {
                        userToken = null;
                    }
                }

                if (userToken == null)
                {
                    map.Add("result", "Invalid session token");
                    return Results.Problem(System.Text.Json.JsonSerializer.Serialize(map));
                }

                using var connection = new MySqlConnection(connectionString);
                connection.Open();

                string query = "SELECT * FROM Users WHERE Email = @Email";

                await using var command = new MySqlCommand(query, connection);

                command.Parameters.AddWithValue("@Email", userToken.Email);

                await using var userLoading = command.ExecuteReader();

                if (!userLoading.Read())
                {
                    return Results.Problem("Erro de leitura");
                }

                UserModel user = new UserModel
                {
                    Id = Guid.Parse(userLoading["id"].ToString()),
                    Name = userLoading["Name"].ToString(),
                    Email = userLoading["Email"].ToString(),
                    Password = userLoading["Password"].ToString(),
                };

                if (password.NewPassword != password.ConfirmNewPassword)
                {
                    map.Add("result", "Senhas diferentes");
                    return Results.Problem(System.Text.Json.JsonSerializer.Serialize(map));
                }

                var passwordHasher = new PasswordHasher<object>();

                var result = passwordHasher.VerifyHashedPassword(
                    null,
                    user.Password,
                    password.Oldpassword
                );

                if (result == PasswordVerificationResult.Failed)
                {
                    map.Add("result", "A senha nova nao pode ser igual a anterior ");
                    return Results.Problem(System.Text.Json.JsonSerializer.Serialize(map));
                }

                user.Password = passwordHasher.HashPassword(null, password.NewPassword);

                db.Users.Update(user);
                await db.SaveChangesAsync();

                map.Add("result", "Senha alterada com sucesso");

                return Results.Ok(map);
            }
        );

        app.MapPost(
            pattern: "deletUser",
            async (
                HttpRequest request,
                TokenService _tokenService,
                [FromBody] DeleteUserRequest deleteRequest,
                ApplicationDbContext db
            ) =>
            {
                var authHeader = request.Headers["Authorization"].FirstOrDefault();
                var token = authHeader?.Split(" ").Last();
                UserModel userToken = null;

                if (!string.IsNullOrEmpty(token))
                {
                    try
                    {
                        userToken = _tokenService.DecodeAndValidateToken(token);
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine($"Token validation error: {ex.Message}");
                        userToken = null;
                    }
                }

                if (userToken == null)
                {
                    return Results.Problem("Invalid session token");
                }

                using var connection = new MySqlConnection(connectionString);
                connection.Open();

                string queryGetUser = "SELECT * FROM Users WHERE Email = @Email";

                await using var commandGetUser = new MySqlCommand(queryGetUser, connection);

                commandGetUser.Parameters.AddWithValue("@Email", userToken.Email);

                await using var userLoading = commandGetUser.ExecuteReader();

                if (!userLoading.Read())
                {
                    connection.Close();
                    return Results.Problem("Erro de leitura");
                }

                UserModel user = new UserModel
                {
                    Id = Guid.Parse(userLoading["id"].ToString()),
                    Name = userLoading["Name"].ToString(),
                    Email = userLoading["Email"].ToString(),
                    Password = userLoading["Password"].ToString(),
                };

                connection.Close();

                if (user == null)
                {
                    return Results.Problem("Invalid session token");
                }

                if (deleteRequest == null || string.IsNullOrEmpty(deleteRequest.Password))
                {
                    return Results.BadRequest("A senha é obrigatória.");
                }

                var passwordHasher = new PasswordHasher<object>();

                var resultPassword = passwordHasher.VerifyHashedPassword(
                    null,
                    user.Password,
                    deleteRequest.Password
                );

                if (resultPassword == PasswordVerificationResult.Failed)
                {
                    return Results.Problem("Senha invalida.");
                }

                try
                {
                    connection.Open();

                    string deletQuery =
                        "DELETE FROM Points WHERE UserId = @Id; DELETE FROM Users WHERE Id = @Id;";

                    await using var command = new MySqlCommand(deletQuery, connection);

                    command.Parameters.AddWithValue("@Id", user.Id);

                    int result = command.ExecuteNonQuery();

                    Dictionary<string, object> map = new Dictionary<string, object>();

                    map.Add("result", "Usuario deletado com sucesso!");

                    return Results.Ok(map);
                }
                catch (Exception ex)
                {
                    return Results.Problem("Ocorreu um erro: " + ex.Message);
                    throw;
                }
                finally
                {
                    if (connection.State == System.Data.ConnectionState.Open)
                    {
                        connection.Close(); 
                    }
                }
            }
        );
    }
}
