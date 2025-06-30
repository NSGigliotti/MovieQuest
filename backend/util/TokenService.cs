using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

public class TokenService
{
    private readonly string _secretKey;
    private readonly string _issuer;
    private readonly string _audience;

    public TokenService(IConfiguration configuration)
    {
        _secretKey = configuration["Jwt:SecretKey"];
        _issuer = configuration["Jwt:Issuer"];
        _audience = configuration["Jwt:Audience"];

        if (string.IsNullOrEmpty(_secretKey))
            throw new ArgumentNullException("Jwt:SecretKey is not set in configuration.");
        if (string.IsNullOrEmpty(_issuer))
            throw new ArgumentNullException("Jwt:Issuer is not set in configuration.");
        if (string.IsNullOrEmpty(_audience))
            throw new ArgumentNullException("Jwt:Audience is not set in configuration.");
    }

    public string GenerationToken(UserModel user)
    {

        var claims = new[]
        {

            new Claim(ClaimTypes.NameIdentifier, user.Id.ToString()),
            new Claim(ClaimTypes.Name, user.Name),
            new Claim(ClaimTypes.Email, user.Email),
            new Claim(ClaimTypes.Role, user.Id.ToString())
        };

        var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_secretKey));

        var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

        var token = new JwtSecurityToken(
            issuer: _issuer,
            audience: _audience,
            claims: claims,
            expires: DateTime.Now.AddDays(30),
            signingCredentials: creds
        );

        return new JwtSecurityTokenHandler().WriteToken(token);
    }

    public UserModel DecodeAndValidateToken(string token)
    {

        try
        {
            var key = Encoding.ASCII.GetBytes(_secretKey);

            var tokenHeadler = new JwtSecurityTokenHandler();

            var validadteParameters = new TokenValidationParameters
            {
                ValidateIssuer = true,
                ValidateAudience = true,
                ValidateLifetime = true,
                IssuerSigningKey = new SymmetricSecurityKey(key),
                ValidIssuer = _issuer,
                ValidAudience = _audience,
                ClockSkew = TimeSpan.Zero
            };

            var tokenValidate = tokenHeadler.ValidateToken(token, validadteParameters, out var validatedToken);

            if (tokenValidate != null)
            {
                var userID = tokenValidate.Claims.FirstOrDefault(c => c.Type == ClaimTypes.NameIdentifier)?.Value;
                var name = tokenValidate.Claims.FirstOrDefault(c => c.Type == ClaimTypes.Name)?.Value;
                var email = tokenValidate.Claims.FirstOrDefault(c => c.Type == ClaimTypes.Email)?.Value;


                if (Guid.TryParse(userID, out var userIdGuid))
                {
                    return new UserModel
                    {
                        Id = Guid.Parse(userID),
                        Name = name,
                        Email = email
                    };
                }
                else
                {
                    throw new SecurityTokenException("ID do usuário não é um GUID válido.");

                }

            }
            else
            {
                throw new SecurityTokenException("Token inválido.");
            }

        }
        catch (SecurityTokenException ex)
        {
            Console.WriteLine("Erro na validação do token: " + ex.Message);
        }
        catch (Exception ex)
        {
            Console.WriteLine("Erro: " + ex.Message);
        }

        return null;

    }
}