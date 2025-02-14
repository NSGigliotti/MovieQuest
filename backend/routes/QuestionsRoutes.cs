using Questions.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using QuestionsSend.Model;
using CorrectionQuest.model;
using Correction.Models;
using QuestSavePintDb.Models;
using QuestRank.Models;
using System.Text.Json;



namespace Questions.Routes;

public static class QuestionsRoute
{
    public static void QuestionsRoutes(this WebApplication app, string? connectionString)
    {

        app.MapGet(pattern: "GetQuestions", () =>
        {
            string query = "SELECT * FROM questions";

            List<QuestionsModel> questions = [];
            List<QuestionsModel> randomItens = [];
            List<QuestionsSendModel> questionsSend = [];

            var connection = new MySqlConnection(connectionString);

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
                    string imageURL = "https://flim-1-0-2.s3.eu-central-1.amazonaws.com/thumbs/hd_720px/" + idImage + ".jpeg";

                    QuestionsSendModel sendItem = new QuestionsSendModel(
                        id: item.Id,
                        image: imageURL,
                        answrs: alternatives,
                        difficulty: item.Difficulty
                    );

                    questionsSend.Add(sendItem);
                }

                QuestionsModel itemJsonTest = randomItens[1];


                var questionsSendJSON = JsonSerializer.Serialize(itemJsonTest);

                return Results.Ok(questionsSend);
            }
            catch (System.Exception)
            {
                throw;
            }

        });

        app.MapPost(pattern: "correctquestions", async (HttpRequest request, TokenService _tokenService, ApplicationDbContext db, CorrectionModel answers) =>
        {
            var token = request.Headers["Authorization"].FirstOrDefault()?.Split(" ").Last();

            UserModel userToken = _tokenService.DecodeAndValidateToken(token);

            List<CorrectionQuestModel> quests = answers.Quests;

            int points = 0;

            int correctQuestions = 0;


            string correctAnswer = "";


            foreach (var item in quests)
            {

                using var connection = new MySqlConnection(connectionString);

                connection.Open();

                string query = "SELECT * FROM moviequest.questions WHERE id = @id";

                using var cmd = new MySqlCommand(query, connection);
                cmd.Parameters.AddWithValue("@id", item.Id);

                using var reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    correctAnswer = reader["CorrectAnswer"].ToString();
                }

                if (correctAnswer == item.Answers)
                {
                    correctQuestions++;
                }
            }

            int elapsedTime = (int)answers.Time.TotalSeconds;

            if (correctQuestions == 0)
            {
                points = 0;
            }
            else
            {
                int bonusTempo = Math.Max(0, 100 - elapsedTime);

                points = ((correctQuestions * 10) + (2 * bonusTempo)) * 100;
            }



            if (token != null)
            {
                QuestSavePintDbModel userPoints = new QuestSavePintDbModel(
                    userId: userToken.Id,
                    userName: userToken.Name,
                    correctQuestions: correctQuestions,
                    time: answers.Time.ToString(),
                    points: points
                );

                db.Points.Add(userPoints);
                await db.SaveChangesAsync();
            }


            return Results.Ok("Pontos : " + points + ", respostas  corretas :" + correctQuestions);

        });

        app.MapGet(pattern: "getlist", () =>
        {
            List<QuestRankModel> ranks = [];

            using var connection = new MySqlConnection(connectionString);

            connection.Open();

            string query = "SELECT * FROM points";

            using var cmd = new MySqlCommand(query, connection);

            using var reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                QuestRankModel rank = new QuestRankModel(
                  userName: reader.GetString("UserName"),
                  points: reader.GetInt32("Points"),
                  correctQuestions: reader.GetInt32("CorrectQuestions"),
                  time: reader.GetString("Time")
                );

                ranks.Add(rank);
            }

            ranks.Sort((p1, p2) => p2.Points.CompareTo(p1.Points));

            return Results.Ok(ranks);
        });


    }
}
