namespace QuestSavePintDb.Models;

public class QuestSavePintDbModel
{
    public QuestSavePintDbModel()
    {
    }

    public QuestSavePintDbModel(Guid userId, int points, string userName, int correctQuestions, string time)
    {
        UserId = userId;
        UserName = userName;
        Points = points;
        CorrectQuestions = correctQuestions;
        Time = time;
        Id = Guid.NewGuid();
    }

    [Key]
    public Guid Id { get; init; }

    [Required]
    public Guid UserId { get; set; }
    public string UserName { get; set; }
    public int Points { get; set; }
    public int CorrectQuestions { get; set; }
    public string Time { get; set; }
}