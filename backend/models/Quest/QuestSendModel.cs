namespace QuestionsSend.Model;

public class QuestionsSendModel
{
    public QuestionsSendModel()
    {
    }

    public QuestionsSendModel(string id, string image, List<string> answrs, string difficulty)
    {
        Id = id;
        ImageURL = image;
        Answers = answrs;
        Difficulty = difficulty;
    }

    [Key]
    public string Id { get; set; }
    [Required]
    public string ImageURL { get; set; }
    public List<string> Answers { get; set; }
    public string Difficulty { get; set; }

}