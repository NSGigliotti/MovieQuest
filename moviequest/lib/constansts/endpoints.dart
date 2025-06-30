const String baseUrl = "http://10.0.2.2:5020";

abstract class Endpoints {
  static const String login = "$baseUrl/login";
  static const String validateToken = "$baseUrl/validatetoken";
  static const String userRegister = "$baseUrl/userRegister";
  static const String changepassword = "$baseUrl/changepassword";
  static const String deleteUser = "$baseUrl/deletUser";
  static const String getQuestions = "$baseUrl/GetQuestions";
  static const String correctquestions = "$baseUrl/correctquestions";
  static const String getlist = "$baseUrl/getlist";
}
