using System;
using System.Collections.Generic;
using System.Text.Json;
using Correction.Models;
using CorrectionQuest.model;
using MySql.Data.MySqlClient;
using Questions.Models;
using QuestionsSend.Model;
using QuestRank.Models;
using QuestSavePintDb.Models;

namespace Questions.Routes;

public static class QuestionsRoute
{
    public static void QuestionsRoutes(this WebApplication app, string? connectionString)
    {
        app.MapGet(
            pattern: "GetQuestions",
            () =>
            {
                string query = "SELECT * FROM Questions";

                List<QuestionsModel> questions = [];
                List<QuestionsModel> randomItens = [];
                List<QuestionsSendModel> questionsSend = [];

                var connection = new MySqlConnection(connectionString);

                Dictionary<string, object> map = new Dictionary<string, object>();

                try
                {
                    connection.Open();

                    var command = new MySqlCommand(query, connection);

                    var reader = command.ExecuteReader();

                    while (reader.Read())
                    {
                        QuestionsModel quest = new QuestionsModel(
                            id: reader.GetString("Id"),
                            name: reader.GetString("Name"),
                            movieImages: reader.GetString("MovieImages").Split(',').ToList(),
                            correctAnswer: reader.GetString("CorrectAnswer"),
                            answers: reader.GetString("Answers").Split(',').ToList(),
                            difficulty: reader.GetString("Difficulty")
                        );

                        questions.Add(quest);
                    }

                    Random random = new Random();
                    randomItens = questions.OrderBy(x => random.Next()).Take(10).ToList();

                    foreach (var item in randomItens)
                    {
                        List<String> alternatives = [];
                        alternatives = item.Answers.OrderBy(x => random.Next()).Take(3).ToList();
                        alternatives.Add(item.CorrectAnswer);
                        alternatives.OrderBy(x => random.Next());

                        int indexImage = random.Next(item.MovieImages.Count);
                        string idImage = item.MovieImages[indexImage];
                        string imageURL =
                            "https://flim-1-0-2.s3.eu-central-1.amazonaws.com/thumbs/hd_720px/"
                            + idImage
                            + ".jpeg";

                        QuestionsSendModel sendItem = new QuestionsSendModel(
                            id: item.Id,
                            image: imageURL,
                            answrs: alternatives,
                            difficulty: item.Difficulty
                        );

                        questionsSend.Add(sendItem);
                    }

                    var questionsSendJSON = JsonSerializer.Serialize(questionsSend);

                    map.Add("results", questionsSendJSON);

                    return Results.Ok(map);
                }
                catch (System.Exception)
                {
                    throw;
                }
            }
        );

        app.MapPost(
            pattern: "correctquestions",
            async (
                HttpRequest request,
                TokenService _tokenService,
                ApplicationDbContext db,
                CorrectionModel answers
            ) =>
            {
                var token = request.Headers["Authorization"].FirstOrDefault()?.Split(" ").Last();
                UserModel userToken = null;

                if (!string.IsNullOrEmpty(token))
                {
                    try
                    {
                        userToken = _tokenService.DecodeAndValidateToken(token);
                    }
                    catch (Exception ex)
                    {
                        userToken = null;
                    }
                }

                List<CorrectionQuestModel> quests = answers.Quests;
                int totalPoints = 0;
                int correctQuestionsCount = 0;
                int consecutiveCorrectAnswers = 0;

                string correctAnswer = "";

                foreach (var item in quests)
                {
                    using var connection = new MySqlConnection(connectionString);
                    connection.Open();
                    string query = "SELECT * FROM moviequest.Questions WHERE id = @id";
                    using var cmd = new MySqlCommand(query, connection);
                    cmd.Parameters.AddWithValue("@id", item.Id);

                    using var reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        correctAnswer = reader["CorrectAnswer"].ToString();
                    }

                    if (correctAnswer == item.Answers)
                    {
                        correctQuestionsCount++;
                        consecutiveCorrectAnswers++;

                        int questionPoints = 100;

                        double multiplier = 1.0 + (consecutiveCorrectAnswers - 1) * 0.1;

                        totalPoints += (int)(questionPoints * multiplier);
                    }
                    else
                    {
                        consecutiveCorrectAnswers = 0;
                    }
                }

                int elapsedTime = (int)answers.Time.TotalSeconds;

                if (correctQuestionsCount > 0)
                {
                    int timeBonus = Math.Max(0, 100 - elapsedTime);
                    totalPoints += (timeBonus * 2);
                }
                else
                {
                    totalPoints = 0;
                }

                if (userToken != null)
                {
                    if (userToken.Id != null && userToken.Name != null)
                    {
                        QuestSavePintDbModel userPoints = new QuestSavePintDbModel(
                            userId: userToken.Id,
                            userName: userToken.Name,
                            correctQuestions: correctQuestionsCount,
                            time: answers.Time.ToString(),
                            points: totalPoints
                        );

                        db.Points.Add(userPoints);
                        await db.SaveChangesAsync();
                    }
                }

                Dictionary<string, object> map = new Dictionary<string, object>();
                Object result = new
                {
                    points = totalPoints,
                    correctQuestions = correctQuestionsCount,
                };
                map.Add("results", result);

                return Results.Ok(map);
            }
        );

        app.MapGet(
            pattern: "getlist",
            () =>
            {
                List<QuestRankModel> ranks = [];

                using var connection = new MySqlConnection(connectionString);

                connection.Open();

                string query = "SELECT * FROM Points";

                using var cmd = new MySqlCommand(query, connection);

                using var reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    QuestRankModel rank = new QuestRankModel(
                        userId: reader.GetGuid("UserId").ToString(),
                        userName: reader.GetString("UserName"),
                        points: reader.GetInt32("Points"),
                        correctQuestions: reader.GetInt32("CorrectQuestions"),
                        time: reader.GetString("Time")
                    );

                    ranks.Add(rank);
                }

                ranks.Sort(
                    (p1, p2) =>
                    {
                        int comparacaoPontos = p2.Points.CompareTo(p1.Points);

                        if (comparacaoPontos == 0)
                        {
                            return p1.Time.CompareTo(p2.Time);
                        }

                        return comparacaoPontos;
                    }
                );

                Dictionary<string, object> map = new Dictionary<string, object>();

                map.Add("results", ranks);

                return Results.Ok(map);
            }
        );
    }
}
