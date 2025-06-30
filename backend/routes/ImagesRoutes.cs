namespace Images.Routes;

public static class ImagesRoutes
{
    public static void ImageRoutes(this WebApplication app)
    {
        app.MapGet(
            "/Imagem/{fileName}",
            static (string fileName, HttpContext context) =>
            {
                string uploadDirectory = Path.Combine(
                    Directory.GetCurrentDirectory(),
                    "Public/Images/"
                );

                var filePath = Path.Combine(uploadDirectory, fileName);

                if (File.Exists(filePath))
                {
                    var fileBytes = File.ReadAllBytes(filePath);
                    var fileExtension = Path.GetExtension(filePath).ToLower();

                    var mimeType = fileExtension switch
                    {
                        ".jpg" => "image/jpeg",
                        ".jpeg" => "image/jpeg",
                        ".png" => "image/png",
                        ".gif" => "image/gif",
                        ".bmp" => "image/bmp",
                        _ => "application/octet-stream",
                    };

                    var imageFile = System.IO.File.OpenRead(filePath);

                    return Results.File(imageFile);
                }
                else
                {
                    return Results.NotFound("Imagem não encontrada.");
                }
            }
        );
    }
}
