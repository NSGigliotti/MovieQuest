public class LoginUserPayload
{

    public LoginUserPayload()
    {
    }

    public LoginUserPayload(string email, string name, string token)
    {
        Name = name;
        Email = email;
        Token = token;
    }

    public string Email { get; set; }
    public string Name { get; set; }
    public string Token { get; set; }
}