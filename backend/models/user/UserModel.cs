namespace User.Models;

public class UserModel
{
    public UserModel()
    {
    }

    public UserModel(string name, string email, string password)
    {
        Name = name;
        Email = email;
        Password = password;
        Id = Guid.NewGuid();
    }

    [Key]
    public Guid Id { get; init; }

    [Required]
    public string Name { get; set; }
    public string Email { get; set; }
    public string Password { get; set; }

}