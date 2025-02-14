using System.Text.RegularExpressions;
using MySql.Data.MySqlClient;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using MySqlX.XDevAPI.Common;
using Org.BouncyCastle.Security;
using System;
using System.Text.Json;





namespace User.Routes;

public static class UserRoute
{

    public static bool ValidateEmail(string email)
    {
        var regex = new Regex(@"^[^@\s]+@[^@\s]+\.[^@\s]+$");
        return regex.IsMatch(email);
    }


    public async static Task<bool> EmailExist(string? connectionString, string email)
    {
        try
        {
            using var connection = new MySqlConnection(connectionString);

            string query = "SELECT COUNT(*) FROM users WHERE Email = @Email";

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

        app.MapPost(pattern: "userRegister", async ([FromBody] UserRegister userRegister, ApplicationDbContext db, TokenService _tokenService) =>
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
                Token = token
            };

            var loginUserPayloadJSON = JsonSerializer.SerializeToNode(loginUserPayload);

            map.Add("results", loginUserPayloadJSON);

            return Results.Ok(map);
        });


        app.MapPost(pattern: "login", async ([FromBody] LoginRequest request, TokenService _tokenService) =>
        {
            Dictionary<string, object> map = new Dictionary<string, object>();

            if (!await EmailExist(connectionString, request.Email))
            {
                return Results.Problem("INVALID_CREDENTIALS");
            }

            using var connection = new MySqlConnection(connectionString);
            connection.Open();

            string query = "SELECT * FROM users WHERE Email = @Email";

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
                Password = userLogin["Password"].ToString()
            };

            var passwordHasher = new PasswordHasher<object>();

            var result = passwordHasher.VerifyHashedPassword(null, user.Password, request.Password);

            if (result == PasswordVerificationResult.Failed)
            {
                return Results.Problem("INVALID_CREDENTIALS");
            }

            var token = _tokenService.GenerationToken(user);

            LoginUserPayload loginUserPayload = new LoginUserPayload
            {
                Name = userLogin["Name"].ToString(),
                Email = userLogin["Email"].ToString(),
                Token = token
            };

            var loginUserPayloadJSON = JsonSerializer.SerializeToNode(loginUserPayload);

            map.Add("results", loginUserPayloadJSON);

            return Results.Ok(map);

        });

        app.MapPost(pattern: "validatetoken", async (HttpRequest request, TokenService _tokenService, ApplicationDbContext db) =>
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
                Token = token
            };

            var loginUserPayloadJSON = JsonSerializer.SerializeToNode(loginUserPayload);

            map.Add("results", loginUserPayloadJSON);

            return Results.Ok(map);

        });

        app.MapPost(pattern: "changepassword", async ([FromBody] ChangePassword password, HttpRequest request, TokenService _tokenService, ApplicationDbContext db) =>
        {

            var token = request.Headers["Authorization"].FirstOrDefault()?.Split(" ").Last();

            UserModel userToken = _tokenService.DecodeAndValidateToken(token);

            if (userToken == null)
            {
                return Results.Problem("Invalid session token");
            }

            using var connection = new MySqlConnection(connectionString);
            connection.Open();

            string query = "SELECT * FROM users WHERE Email = @Email";

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
                Password = userLoading["Password"].ToString()
            };

            if (password.NewPassword != password.ConfirmNewPassword)
            {
                return Results.Problem("Senhas diferentes");
            }

            var passwordHasher = new PasswordHasher<object>();

            var result = passwordHasher.VerifyHashedPassword(null, user.Password, password.Oldassword);

            if (result == PasswordVerificationResult.Success)
            {
                return Results.Problem("A senha nova nao pode ser igual a anterior ");
            }

            user.Password = passwordHasher.HashPassword(null, password.NewPassword);

            db.Users.Update(user);
            await db.SaveChangesAsync();
            return Results.Ok("Senha alterada com sucesso");
        });


        app.MapPost(pattern: "deletUser", async (HttpRequest request, TokenService _tokenService, ApplicationDbContext db) =>
        {


            var token = request.Headers["Authorization"].FirstOrDefault()?.Split(" ").Last();

            UserModel userToken = _tokenService.DecodeAndValidateToken(token);

            if (userToken == null)
            {
                return Results.Problem("Invalid session token");
            }

            try
            {
                using var connection = new MySqlConnection(connectionString);
                connection.Open();

                string query = "DELETE FROM users WHERE Id = @Id";

                await using var command = new MySqlCommand(query, connection);

                command.Parameters.AddWithValue("@Id", userToken.Id);

                int result = command.ExecuteNonQuery();

                return Results.Ok("Usuario deletado com sucesso!");
            }
            catch (Exception ex)
            {
                return Results.Problem("Ocorreu um erro: " + ex.Message);
                throw;
            }

        });
    }

}