namespace CorrectionQuest.model;

public class CorrectionQuestModel
{
    public CorrectionQuestModel()
    {
    }

    public CorrectionQuestModel(string id, string answers)
    {
        Id = id;
        Answers = answers;
    }

    [Key]
    public string Id { get; set; }
    [Required]
    public string Answers { get; set; }
}