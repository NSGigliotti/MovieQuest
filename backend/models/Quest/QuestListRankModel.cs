namespace QuestRank.Models;

public class QuestRankModel
{
    public QuestRankModel()
    {
    }

    public QuestRankModel(int points, string userName, int correctQuestions, string time)
    {
        UserName = userName;
        Points = points;
        CorrectQuestions = correctQuestions;
        Time = time;

    }

    public string UserName { get; set; }
    public int Points { get; set; }
    public int CorrectQuestions { get; set; }
    public string Time { get; set; }

}