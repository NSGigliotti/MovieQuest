using System.Text.RegularExpressions;
using MySql.Data.MySqlClient;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
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


    public async static Task<bool> EmailExist(string? connectionString, string email)
    {
        try
        {
            using var connection = new MySqlConnection(connectionString);

            string query = "SELECT COUNT(*) FROM users WHERE Email = @Email";  // Corrigido

            await connection.OpenAsync();  // Abertura assíncrona da conexão

            using var command = new MySqlCommand(query, connection);
            command.Parameters.AddWithValue("@Email", email);

            // Executando a consulta de forma assíncrona
            long count = (long)await command.ExecuteScalarAsync();  // Usando ExecuteScalarAsync

            return count > 0;
        }
        catch (System.Exception)
        {
            // Em caso de erro, retorna false
            return false;
        }
    }


    public static void UserRoutes(this WebApplication app, string? connectionString)
    {

        app.MapPost(pattern: "userRegister", async ([FromBody] UserRegister userRegister, ApplicationDbContext db) =>
        {
            if (userRegister.Name == "")
            {
                return Results.Problem("Nome necessario");
            }

            if (!ValidateEmail(userRegister.Email))
            {
                return Results.Problem("Email invalido");
            }

            Console.Write("Teste de Usuario :" + EmailExist(connectionString, userRegister.Email));

            if (await EmailExist(connectionString, userRegister.Email))
            {
                return Results.Problem("Email ja utiliusado");
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
            return Results.Ok("Usuario criado com susseço");
        });


        app.MapPost(pattern: "login", async ([FromBody] LoginRequest request, TokenService _tokenService) =>
        {

            if (await EmailExist(connectionString, request.Email))
            {
                return Results.Problem("Email não encontrado");
            }

            using var connection = new MySqlConnection(connectionString);
            connection.Open();

            string query = "SELECT * FROM users WHERE Email = @Email";

            await using var command = new MySqlCommand(query, connection);

            command.Parameters.AddWithValue("@Email", request.Email);

            await using var userLogin = command.ExecuteReader();

            // if (!userLogin.Read())
            // {
            //     return Results.Problem("Erro de leitura");
            // }

            // UserModel user = new UserModel
            // {
            //     Id = Guid.Parse(userLogin["id"].ToString()),
            //     Name = userLogin["Name"].ToString(),
            //     Email = userLogin["Email"].ToString(),
            //     Password = userLogin["Password"].ToString()
            // };

            // var passwordHasher = new PasswordHasher<object>();

            // var result = passwordHasher.VerifyHashedPassword(null, user.Password, request.Password);

            // if (result == PasswordVerificationResult.Failed)
            // {
            //     return Results.Problem("Senha Invalida");
            // }

            // var token = _tokenService.GenerationToken(user);

            return Results.Ok(userLogin);

        });

        app.MapPost(pattern: "changepassword", async ([FromBody] ChangePassword password, HttpRequest request, TokenService _tokenService, ApplicationDbContext db) =>
        {

            var token = request.Headers["Authorization"].FirstOrDefault()?.Split(" ").Last();

            UserModel userToken = _tokenService.DecodeAndValidateToken(token);

            if (userToken == null)
            {
                return Results.Problem("Token Invalido");
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
                return Results.Problem("Token Invalido");
            }

            using var connection = new MySqlConnection(connectionString);
            connection.Open();

            string query = "DELETE * FROM users WHERE Id = @Id";

            await using var command = new MySqlCommand(query, connection);

            command.Parameters.AddWithValue("@Id", userToken.Id);

            await using var userLoading = command.ExecuteReader();

            MySqlCommand cmd = new MySqlCommand(query, connection);

            cmd.Parameters.AddWithValue("@Id", userToken.Id);

            int result = cmd.ExecuteNonQuery();

            return Results.Ok("Usuario deletado com sucesso!");

        });
    }

}