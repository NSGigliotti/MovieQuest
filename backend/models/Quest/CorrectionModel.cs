using CorrectionQuest.model;

namespace Correction.Models;

public class CorrectionModel
{
    public CorrectionModel()
    {
    }

    public CorrectionModel( TimeSpan time, List<CorrectionQuestModel> quests) 
    {
        Time = time;
        Quests = quests;
    }

    public TimeSpan Time { get; set; }
    public List<CorrectionQuestModel> Quests { get; set; }
}