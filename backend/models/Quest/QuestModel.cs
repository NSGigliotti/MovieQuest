namespace Questions.Models;

public class QuestionsModel
{
    public QuestionsModel()
    {
    }

    public QuestionsModel(string id, string name, List<string> movieImages, string correctAnswer, List<string> answers, string difficulty)
    {
        Id = id;
        Name = name;
        MovieImages = movieImages;
        CorrectAnswer = correctAnswer;
        Answers = answers;
        Difficulty = difficulty;
    }

    [Key]
    public string Id { get; set; }
    [Required]
    public string Name { get; set; }
    public List<string> MovieImages { get; set; }
    public string CorrectAnswer { get; set; }
    public List<string> Answers { get; set; }
    public string Difficulty { get; set; }
}