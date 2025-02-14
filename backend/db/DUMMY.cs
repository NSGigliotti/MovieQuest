using Questions.Models;


public class DUMMY
{
    static void Main()
    {
        var questionsList = new List<QuestionsModel>{
        new QuestionsModel(
        id: "c7z5w3a9r8f5p6g2",
        name: "O Senhor dos Anéis: A Sociedade do Anel",
        movieImages: new List<string>{
            "7db2bd5ae6a711eb9f1710ddb1aba44f",
            "e625cda6e6a611eb9f1710ddb1aba44f",
            "e41cda3ce6aa11eb9f1710ddb1aba44f",
            "157462f8e6a611eb9f1710ddb1aba44f",
            "8f65389ee6a611eb9f1710ddb1aba44f",
            "777ea710e6ab11eb9f1710ddb1aba44f",
            "68eb99cee6a611eb9f1710ddb1aba44f",
            "06723bbae6a411eb9f1710ddb1aba44f",
            "898bfbaae6a711eb9f1710ddb1aba44f"
        },
        correctAnswer: "O Senhor dos Anéis: A Sociedade do Anel",
        answers: new List<string>{
        "Harry Potter e a Pedra Filosofal",
        "A Crônica de Nárnia",
        "Conan, O Bárbaro ",
        "Excalibur",
        "O Labirinto do Fauno",
        "O Hobbit",
        "A Bússola de Ouro",
        "Furia de Titãs"
        },
        difficulty: "Médio"
    ),
        new QuestionsModel(
            id: "m1j2h8a4r9b3s7g0",
            name: "Titanic",
            movieImages: new List<string>{
                "747645b852f411ec9f0310ddb1aba44f",
                "44495fae52ec11ec9f0310ddb1aba44f",
                "bbb168e252f211ec9f0310ddb1aba44f",
                "31f11c10559a11ec977d10ddb1aba44f",
                "597d258a52f211ec9f0310ddb1aba44f",
                "2d4019b052ec11ec9f0310ddb1aba44f",
                "ac1097f052f211ec9f0310ddb1aba44f",
                "96b2bc2452ef11ec9f0310ddb1aba44f",
                "f10e7ab252f111ec9f0310ddb1aba44f",
                "ffe8400e52f111ec9f0310ddb1aba44f"
                },
            correctAnswer: "Titanic",
            answers: new List<string>{ "O Grande Gatsby",
                "Pearl Harbor",
                "A Outra História Americana",
                "A Tempestade",
                "O Navio Fantasma",
                "Gladiador",
                "Drácula de Bram Stoker",
                "O Mundo Perdido: Jurassic Park",
                "As Aventuras de Poseidon",
                "Cavalo de Guerra"
                },
            difficulty: "Fácil"
        ),
        new QuestionsModel(
            id: "s2h3y9l8d4v1a7o0",
            name: "O Poderoso Chefão",
            movieImages: new List<string> {
                "15b0c68a128011eb890f10ddb1aba44f",
                "963030c4127c11eb890f10ddb1aba44f",
                "45b8be88128411eb890f10ddb1aba44f",
                "c3ba6ab6127f11eb890f10ddb1aba44f",
                "0cb2130a127f11eb890f10ddb1aba44f",
                "e99a6844128411eb890f10ddb1aba44f",
                "da9e49ac128211eb890f10ddb1aba44f",
                "0f483b20128511eb890f10ddb1aba44f",
                "69585208128011eb890f10ddb1aba44f",
                "66f6d5de128511eb890f10ddb1aba44f"
                },
            correctAnswer: "O Poderoso Chefão",
            answers: new List<string> {
                "Os Bons Companheiros",
                "Scarface",
                "O Rei da Comédia",
                "Donnie Brasco",
                "Os Infiltrados",
                "Cassino",
                "Os Intocáveis",
                "O Ultimato Bourne",
                "Cidade de Deus"
            },
            difficulty: "Médio"
        ),
        new QuestionsModel(
    id: "t4u7g5f9x2v3m7c0",
    name: "Star Wars: O Império Contra-Ataca",
    movieImages: new List<string> {
        "e51ef6209e5311ecb5bb10ddb1aba44f",
        "862da60c9e5811ecb5bb10ddb1aba44f",
        "94e09f909e5011ecb5bb10ddb1aba44f",
        "b72a85489e4b11ecb5bb10ddb1aba44f",
        "8315a8e69e5511ecb5bb10ddb1aba44f",
        "d3e60ee89e5311ecb5bb10ddb1aba44f",
        "80ee2af89e4f11ecb5bb10ddb1aba44f",
        "fa59855e9e5411ecb5bb10ddb1aba44f",
        "ebac9e6e9e6411eca1ec10ddb1aba44f",
        "11c7bd369e6511eca1ec10ddb1aba44f"
    },
    correctAnswer: "Star Wars: O Império Contra-Ataca",
    answers: new List<string> {
        "Star Wars: Uma Nova Esperança",
        "Star Wars: O Retorno de Jedi",
        "Star Wars: A Ameaça Fantasma",
        "O Senhor dos Anéis: A Sociedade do Anel",
        "Guardians of the Galaxy",
        "O Hobbit: A Desolação de Smaug",
        "Star Wars: Os Últimos Jedi",
        "Star Wars: A Ascensão Skywalker",
        "Vingadores: Ultimato",
        "Matrix"
        },
    difficulty: "Médio"
),
        new QuestionsModel(
    id: "e6r1v9i3h5p8w4m2",
    name: "Vingadores: Ultimato",
    movieImages: new List<string> {
        "e2705ec24f9e11ec9f0310ddb1aba44f",
        "3a7cf3ce4f9e11ec9f0310ddb1aba44f",
        "e53721244fa611ec9f0310ddb1aba44f",
        "aebfc2804fa211ec9f0310ddb1aba44f",
        "bf677f964fa311ec9f0310ddb1aba44f",
        "ba0e782c4f9b11ec9f0310ddb1aba44f",
        "4aed25064f9b11ec9f0310ddb1aba44f",
        "7f9bb5384fa511ec9f0310ddb1aba44f",
        "3bc952d04f9f11ec9f0310ddb1aba44f",
        "d1de46044fa411ec9f0310ddb1aba44f"
    },
    correctAnswer: "Vingadores: Ultimato",
    answers: new List<string> {
        "Vingadores: Guerra Infinita",
        "Vingadores: A Era de Ultron",
        "Vingadores",
        "Homem de Ferro",
        "Thor: Ragnarok",
        "Pantera Negra",
        "Capitão Marvel",
        "Homem-Aranha: Longe de Casa",
        "Guardiões da Galáxia",
        "X-Men: Dias de um Futuro Esquecido",
        },
    difficulty: "Fácil"
),
        new QuestionsModel(
    id: "r7f9a1b3g2m5w8e0",
    name: "A Origem",
    movieImages: new List<string> {
        "c6a87226e69711eb9f1710ddb1aba44f",
        "9018bbb2e69711eb9f1710ddb1aba44f",
        "c48b5cc2e69911eb9f1710ddb1aba44f",
        "7f6e17fee69b11eb9f1710ddb1aba44f",
        "9460eb28e69611eb9f1710ddb1aba44f",
        "478dd9f8e69d11eb9f1710ddb1aba44f",
        "51f49cdce69911eb9f1710ddb1aba44f",
        "ce387474e69b11eb9f1710ddb1aba44f",
        "9741756ee69c11eb9f1710ddb1aba44f",
        "73417a3ae69a11eb9f1710ddb1aba44f"
    },
    correctAnswer: "A Origem",
    answers: new List<string> {
        "Interstellar",
        "Matrix",
        "Efeito Borboleta",
        "A Ilha",
        "Vanilla Sky",
        "O Show de Truman",
        "O Máximo",
        "A Janela Secreta",
        "O Cubo",
        "O Predestinado"
         },
    difficulty: "Difícil"
),
        new QuestionsModel(
    id: "x4h7v1i9k2a5n8b0",
    name: "Jurassic Park",
    movieImages: new List<string> {
        "67428a56f47b11eab5c010ddb1aba44f",
        "ac8b346ef47b11eab5c010ddb1aba44f",
        "1627232af48011eab5c010ddb1aba44f",
        "9f1fcca4f47b11eab5c010ddb1aba44f",
        "cb64237ef47f11eab5c010ddb1aba44f",
        "2813c9d0f47b11eab5c010ddb1aba44f",
        "7dba3f5af47a11eab5c010ddb1aba44f",
        "ce58b74ef47911eab5c010ddb1aba44f",
        "6cc3f5fef47c11eab5c010ddb1aba44f",
        "0aa3b69ef47b11eab5c010ddb1aba44f"
    },
    correctAnswer: "Jurassic Park",
    answers: new List<string> { "O Mundo Perdido: Jurassic Park", "Jurassic World", "Jurassic Park III", "King Kong", "O Retorno da Múmia", "O Exterminador do Futuro", "Transformers", "Planet of the Apes", "Titanic", "Madagascar" },
    difficulty: "Médio"
),
        new QuestionsModel(
    id: "d1j6n8z4p3k0r9w7",
    name: "Matrix",
    movieImages: new List<string> {
        "98428df453de11ec9f0310ddb1aba44f",
        "7348484453df11ec9f0310ddb1aba44f",
        "360e541053de11ec9f0310ddb1aba44f",
        "89124ec053dc11ec9f0310ddb1aba44f",
        "42b7327853dd11ec9f0310ddb1aba44f",
        "34ff489e53df11ec9f0310ddb1aba44f",
        "49c68fea53de11ec9f0310ddb1aba44f",
        "a5d96b8453db11ec9f0310ddb1aba44f",
        "6c625f4253df11ec9f0310ddb1aba44f",
        "f709bd5653db11ec9f0310ddb1aba44f"
    },
    correctAnswer: "Matrix",
    answers: new List<string> { "Matrix Reloaded", "Matrix Revolutions", "Inception", "O Quinto Elemento", "Total Recall", "Minority Report", "O Vingador do Futuro", "Tron", "Dark City", "Blade Runner" },
    difficulty: "Médio"
),
        new QuestionsModel(
    id: "o2r1g7p9w3a5s0u1",
    name: "O Rei Leão",
    movieImages: new List<string> {
        "456b89f22e0b11edb27610ddb1aba44f",
        "6238373c2e0c11edb27610ddb1aba44f",
        "da95c0702e0511edb27610ddb1aba44f",
        "18a1c8b82e0711edb27610ddb1aba44f",
        "989778282e0811edb27610ddb1aba44f",
        "7e6709382e0c11edb27610ddb1aba44f",
        "b5e6cdac2e0811edb27610ddb1aba44f",
        "138d5d4e2e0a11edb27610ddb1aba44f",
        "b320139a2e0711edb27610ddb1aba44f",
        "a7658d742e0b11edb27610ddb1aba44f"
    },
    correctAnswer: "O Rei Leão",
    answers: new List<string> { "O Rei Leão 2: O Tesouro de Simba", "Aladdin", "A Bela e a Fera", "Mulan", "A Pequena Sereia", "Cinderela", "Hércules", "O Livro da Selva", "Zootopia", "Frozen - Uma Aventura Congelante" },
    difficulty: "Fácil"
),
        new QuestionsModel(
    id: "k3j6t4m7a8s2b5n0",
    name: "Os Infiltrados",
    movieImages: new List<string> {
        "d8503f60186911ebb16110ddb1aba44f",
        "9e4948ca186911ebb16110ddb1aba44f",
        "697a819a186911ebb16110ddb1aba44f",
        "4c08efc4186a11ebb16110ddb1aba44f",
        "a94ffeb2186911ebb16110ddb1aba44f",
        "551aca34186911ebb16110ddb1aba44f",
        "794c678c186911ebb16110ddb1aba44f",
        "378ea404186911ebb16110ddb1aba44f",
        "17a64aec186a11ebb16110ddb1aba44f",
        "1cc166e2186a11ebb16110ddb1aba44f"
    },
    correctAnswer: "Os Infiltrados",
    answers: new List<string> { "Os Bons Companheiros", "Clube da Luta", "O Lobo de Wall Street", "Os Intocáveis", "Scarface", "O Poderoso Chefão", "O Silêncio dos Inocentes", "Inimigos Públicos", "Era uma vez em... Hollywood", "O Vingador do Futuro" },
    difficulty: "Médio"
),
        new QuestionsModel(
    id: "h8s9r3v2i0c6n1b0",
    name: "A Bela e a Fera",
    movieImages: new List<string> {
        "0250d53053b811ee91f80612238522d6",
        "591588a753b911ee91f80612238522d6",
        "788a0bba53b411ee91f80612238522d6",
        "cd734cc553b511ee91f80612238522d6",
        "4d91a40953ba11ee91f80612238522d6",
        "1006662753b111ee91f80612238522d6",
        "8b6ce9c853b311ee91f80612238522d6",
        "5e8e43b453af11ee91f80612238522d6",
        "7acfcb8353b711ee91f80612238522d6",
        "627e96b353af11ee91f80612238522d6"
    },
    correctAnswer: "A Bela e a Fera",
    answers: new List<string> { "Cinderela", "A Pequena Sereia", "Aladdin", "Mulan", "A Princesa e o Sapo", "A Bela Adormecida", "Frozen", "Moana", "Rapunzel", "O Rei Leão" },
    difficulty: "Fácil"
),
        new QuestionsModel(
        id: "v5i4r9h1c8g2d0b7",
        name: "Gladiador",
        movieImages: new List<string> {
            "61a892da116211eb9aae10ddb1aba44f",
            "cba9e0ea116111eb9aae10ddb1aba44f",
            "00ded248116211eb9aae10ddb1aba44f",
            "5ed398fa116411eb9aae10ddb1aba44f",
            "2ad8b490116411eb9aae10ddb1aba44f",
            "57b3332a116211eb9aae10ddb1aba44f",
            "642a10b4116311eb9aae10ddb1aba44f",
            "fc092fc0116111eb9aae10ddb1aba44f",
            "9da06c58116311eb9aae10ddb1aba44f",
            "90e840e0116211eb9aae10ddb1aba44f"
        },
        correctAnswer: "Gladiador",
        answers: new List<string> { "300", "Coração Valente", "Rei Arthur", "O Último Samurai", "Alexander", "Ben-Hur", "Spartacus", "O Regresso", "O Hobbit: A Desolação de Smaug", "O Senhor dos Anéis: As Duas Torres" },
        difficulty: "Médio"
    ),
        new QuestionsModel(
        id: "l3p5s8k2a0t7r4v1",
        name: "Clube da Luta",
        movieImages: new List<string> {
            "031992ba5ebd11ec8f3010ddb1aba44f",
            "2a4aab6a5eb511ec8f3010ddb1aba44f",
            "94d66d825eb711ec8f3010ddb1aba44f",
            "3bc19d045eb511ec8f3010ddb1aba44f",
            "d57990825eba11ec8f3010ddb1aba44f",
            "3472621e5ebe11ec8f3010ddb1aba44f",
            "451425585ebe11ec8f3010ddb1aba44f",
            "b382b3525eb811ec8f3010ddb1aba44f",
            "cf58e0225ebf11ec8f3010ddb1aba44f",
            "a6a213f65f2311eca43910ddb1aba44f"
        },
        correctAnswer: "Clube da Luta",
        answers: new List<string> { "Requiem for a Dream", "O Grande Lebowski", "Donnie Darko", "Pulp Fiction", "American History X", "Trainspotting", "Dr. Estranho", "O Clube dos Cinco", "Seven - Os Sete Crimes Capitais", "Fight Club" },
        difficulty: "Difícil"
    ),
        new QuestionsModel(
        id: "g8p7d9r6m5o3v1k0",
        name: "O Grande Lebowski",
        movieImages: new List<string> {
            "62797df7b69711edb9090612238522d6",
            "1514b2c9b69711edb9090612238522d6",
            "89895f67b69711edb9090612238522d6",
            "4601c0b0b69911edb9090612238522d6",
            "e2a62313b69711edb9090612238522d6",
            "e7f62ffcb69611edb9090612238522d6",
            "a057830fb69811edb9090612238522d6",
            "2e22041ab69911edb9090612238522d6",
            "0918fc9eb69711edb9090612238522d6",
            "f61ee297b69811edb9090612238522d6",
        },
        correctAnswer: "O Grande Lebowski",
        answers: new List<string> { "Clube da Luta", "Pulp Fiction", "Fargo", "Os Irmãos Coen", "O Rei do Show", "Barton Fink", "Música, Amigos e Tiro", "Donnie Brasco", "O Lado Bom da Vida", "O Show de Truman" },
        difficulty: "Difícil"
    ),
        new QuestionsModel(
        id: "t3w2r6e8h4o7u9p1",
        name: "Harry Potter e a Pedra Filosofal",
        movieImages: new List<string> {
            "c2747b70e82f11eb9e4310ddb1aba44f",
            "db4d6b54e83211eb9e4310ddb1aba44f",
            "29a3efc2e83711eb9e4310ddb1aba44f",
            "1a0a4d9ee83811eb9e4310ddb1aba44f",
            "a79dc044e83511eb9e4310ddb1aba44f",
            "7fa8f7e2e83611eb9e4310ddb1aba44f",
            "ca6563c8e83711eb9e4310ddb1aba44f",
            "e04c93c0e88511eba74510ddb1aba44f",
            "126662f4e83711eb9e4310ddb1aba44f",
            "8e223b30e83b11eb9e4310ddb1aba44f",
        },
        correctAnswer: "Harry Potter e a Pedra Filosofal",
        answers: new List<string> { "Harry Potter e a Câmara Secreta", "Harry Potter e o Prisioneiro de Azkaban", "Harry Potter e as Relíquias da Morte", "O Senhor dos Anéis", "O Hobbit", "Percy Jackson e os Olimpianos", "As Crônicas de Nárnia", "Beetlejuice", "Fantastic Beasts", "O Labirinto do Fauno" },
        difficulty: "Médio"
    ),
        new QuestionsModel(
        id: "w9d1j5t7b2k6n8s0",
        name: "Mad Max: Estrada da Fúria",
        movieImages: new List<string> {
            "fa41ce524ab011ec9f0310ddb1aba44f",
            "c338e5884aa811ec9f0310ddb1aba44f",
            "bde6f6324abd11ec9f0310ddb1aba44f",
            "89e866de4aba11ec9f0310ddb1aba44f",
            "715cdf344ab311ec9f0310ddb1aba44f",
            "f4f7956c4aba11ec9f0310ddb1aba44f",
            "d3271df04ab911ec9f0310ddb1aba44f",
            "80ed03524ab311ec9f0310ddb1aba44f",
            "bd4ea2b64aa811ec9f0310ddb1aba44f",
            "8394f6f64aa811ec9f0310ddb1aba44f",
        },
        correctAnswer: "Mad Max: Estrada da Fúria",
        answers: new List<string> { "Mad Max: A Caçada Continua", "O Livro de Eli", "Divergente", "Matrix", "Os Vingadores: Guerra Infinita", "O Senhor dos Anéis", "300", "O Vingador do Futuro", "A Estrada", "The Road Warrior" },
        difficulty: "Médio"
    ),
        new QuestionsModel(
        id: "a4t7k2j1s6v8g0r3",
        name: "Pulp Fiction",
        movieImages: new List<string> {
            "bffc6e30333d11ec840e10ddb1aba44f",
            "02eb19ae333d11ec840e10ddb1aba44f",
            "5c9b164e333c11ec840e10ddb1aba44f",
            "174db782334011ec840e10ddb1aba44f",
            "d317871c333c11ec840e10ddb1aba44f",
            "b5201ed8333f11ec840e10ddb1aba44f",
            "e3541322333f11ec840e10ddb1aba44f",
            "b29bb764333d11ec840e10ddb1aba44f",
            "4c73c80c333b11ec840e10ddb1aba44f",
            "4bc70ba2334111ec840e10ddb1aba44f",
        },
        correctAnswer: "Pulp Fiction",
        answers: new List<string> { "Cães de Aluguel", "Kill Bill", "Bastardos Inglórios", "Clube da Luta", "A Noviça Rebelde", "O Grande Lebowski", "O Último Magnata", "O Labirinto do Fauno", "Donnie Brasco", "Reservoir Dogs" },
        difficulty: "Difícil"
    ),
        new QuestionsModel(
        id: "c2p6j3y5f8s9v4t0",
        name: "A Fantástica Fábrica de Chocolate",
        movieImages: new List<string> {
            "50078042e6d511eb9f1710ddb1aba44f",
            "ef0b2caae6d711eb9f1710ddb1aba44f",
            "a229e502e6d711eb9f1710ddb1aba44f",
            "c8ebcea4e6d611eb9f1710ddb1aba44f",
            "8745fd74e6d811eb9f1710ddb1aba44f",
            "40a2458ce6d611eb9f1710ddb1aba44f",
            "ab18ee1ee6d311eb9f1710ddb1aba44f",
            "9638843ee6d611eb9f1710ddb1aba44f",
            "4ec81aa6e6d111eb9f1710ddb1aba44f",
            "2ea25d30e6d711eb9f1710ddb1aba44f",
        },
        correctAnswer: "A Fantástica Fábrica de Chocolate",
        answers: new List<string> { "Matilda", "A Princesa Prometida", "O Mágico de Oz", "Charlie e o Chocolate", "O Rei Leão", "Peter Pan", "A Viagem de Chihiro", "Coraline", "James e o Pêssego Gigante", "O Hobbit" },
        difficulty: "Fácil"
    ),
        new QuestionsModel(
        id: "x6e3w9r7b1v4g0s2",
        name: "O Labirinto do Fauno",
        movieImages: new List<string> {
            "193ad7daf77011ea98f310ddb1aba44f",
            "5c39a318f77011ea98f310ddb1aba44f",
            "6320ed14f76e11ea98f310ddb1aba44f",
            "7dd976ecf77011ea98f310ddb1aba44f",
            "36a5506cf76f11ea98f310ddb1aba44f",
            "242bae76f77011ea98f310ddb1aba44f",
            "42c3bc0cf77011ea98f310ddb1aba44f",
            "f67b1b20f76e11ea98f310ddb1aba44f",
            "a358a7c2f76f11ea98f310ddb1aba44f",
            "b21c3878f76f11ea98f310ddb1aba44f",
        },
        correctAnswer: "O Labirinto do Fauno",
        answers: new List<string> { "A Forma da Água", "A Caverna", "O Mundo Imaginário de Guillermo del Toro", "Harry Potter", "O Senhor dos Anéis", "Pan's Labyrinth", "Coração Valente", "O Labirinto de Pi", "A Viagem de Chihiro", "A Noiva Cadáver" },
        difficulty: "Difícil"
    ),
        new QuestionsModel(
        id: "a1n9f5r7g3u0k2h8",
        name: "O Silêncio dos Inocentes",
        movieImages: new List<string> {
            "92805ec6e6cb11eb9f1710ddb1aba44f",
            "9890bccae6cb11eb9f1710ddb1aba44f",
            "c2777abae6cb11eb9f1710ddb1aba44f",
            "62e7272ce6ca11eb9f1710ddb1aba44f",
            "0b3fb544e6ce11eb9f1710ddb1aba44f",
            "b69f370ae6cb11eb9f1710ddb1aba44f",
            "780ea5aee6ce11eb9f1710ddb1aba44f",
            "8554713ae6c911eb9f1710ddb1aba44f",
            "29cf311ce6cc11eb9f1710ddb1aba44f",
            "ff0e6a62e6c911eb9f1710ddb1aba44f",
         },
        correctAnswer: "O Silêncio dos Inocentes",
        answers: new List<string> { "Hannibal", "Zodíaco", "O Nevoeiro", "Seven", "Memórias de um Assassino", "Garota Exemplar", "O Colecionador de Ossos", "A Pele que Habito", "O Quarto do Pânico", "A Origem" },
        difficulty: "Difícil"
    ),
        new QuestionsModel(
    id: "k1l3v9w8z5u0i2b4",
    name: "O Lobo de Wall Street",
    movieImages: new List<string>
    {
        "144296cc85c811ecad0710ddb1aba44f",
        "a81ced0885cc11ecad0710ddb1aba44f",
        "d8601b1685cc11ecad0710ddb1aba44f",
        "76e50b3085c711ecad0710ddb1aba44f",
        "eb1e2d2485c211ecad0710ddb1aba44f",
        "a7f8be4285c211ecad0710ddb1aba44f",
        "597e182285c511ecad0710ddb1aba44f",
        "a708894085c711ecad0710ddb1aba44f",
        "2dc1e10285cd11ecad0710ddb1aba44f",
        "59bf43de869b11ec886710ddb1aba44f",
    },
    correctAnswer: "O Lobo de Wall Street",
    answers: new List<string>
    {
        "A Grande Aposta",
        "O Lobo do Mercado Financeiro",
        "Requiem for a Dream",
        "Coringa",
        "Os Vingadores",
        "O Lado Bom da Vida",
        "O Poderoso Chefão",
        "O Rei do Show",
        "A Rede Social",
        "O Homem que Mudou o Jogo"
    },
    difficulty: "Médio"
),
        new QuestionsModel(
    id: "f4b6p2m1z7g9a0r3",
    name: "A Viagem de Chihiro",
    movieImages: new List<string>
    {
        "d72b59e4041411ebb38910ddb1aba44f",
        "cafb141e041b11ebb38910ddb1aba44f",
        "95b96c6a041b11ebb38910ddb1aba44f",
        "34184248041f11ebb38910ddb1aba44f",
        "c3903508041911ebb38910ddb1aba44f",
        "5683cb86041511ebb38910ddb1aba44f",
        "31d672ea041311ebb38910ddb1aba44f",
        "e1780d3e041e11ebb38910ddb1aba44f",
        "2aad069a041411ebb38910ddb1aba44f",
        "ddf159d8041211ebb38910ddb1aba44f",
    },
    correctAnswer: "A Viagem de Chihiro",
    answers: new List<string>
    {
        "Princesa Mononoke",
        "O Castelo Animado",
        "Ponyo - Uma Amizade que Veio do Mar",
        "Kiki - Entregas Mágicas",
        "O Conto da Princesa Kaguya",
        "A Viagem de Arlo",
        "A Viagem de Nausicaä",
        "O Castelo no Céu",
        "Meu Amigo Totoro",
        "A Princesa e o Cavaleiro"
    },
    difficulty: "Difícil"
),
        new QuestionsModel(
    id: "w2m9j3g1h6s8b7p0",
    name: "Os Vingadoros",
    movieImages: new List<string>
    {
        "7019d1ca506911ec9f0310ddb1aba44f",
        "efe0a098506711ec9f0310ddb1aba44f",
        "a72565a4506811ec9f0310ddb1aba44f",
        "fbd857f0506811ec9f0310ddb1aba44f",
        "d7fad240506811ec9f0310ddb1aba44f",
        "01c4140e506b11ec9f0310ddb1aba44f",
        "14da80be506b11ec9f0310ddb1aba44f",
        "be33eace506b11ec9f0310ddb1aba44f",
        "7dd44566506911ec9f0310ddb1aba44f",
        "2b5dcfcc506a11ec9f0310ddb1aba44f",
    },
    correctAnswer: "Os Vingadoros",
    answers: new List<string>
    {
        "Vingadores: A Era de Ultron",
        "Vingadores: Guerra Infinita",
        "Vingadores: Ultimato",
        "Homem de Ferro",
        "Capitão Marvel",
        "Thor",
        "Pantera Negra",
        "Capitão América: Guerra Civil",
        "Homem-Aranha: De Volta ao Lar",
        "X-Men: Apocalipse"
    },
    difficulty: "Fácil"
),
        new QuestionsModel(
    id: "t5k7r3a2m1o6s8b0",
    name: "O Diário de uma Paixão",
    movieImages: new List<string>
    {
        "31abbf1448a511eca41b10ddb1aba44f",
        "9c25a96048a311eca41b10ddb1aba44f",
        "6341393e48a311eca41b10ddb1aba44f",
        "d1c2391848a211eca41b10ddb1aba44f",
        "076add5a48a211eca41b10ddb1aba44f",
        "0271a50248a411eca41b10ddb1aba44f",
        "4bc99ab648a411eca41b10ddb1aba44f",
        "23ebe73c48a511eca41b10ddb1aba44f",
        "1429c23648a211eca41b10ddb1aba44f",
        "08bb962a48a411eca41b10ddb1aba44f",
    },
    correctAnswer: "O Diário de uma Paixão",
    answers: new List<string>
    {
        "O Casamento do Meu Melhor Amigo",
        "P.S. Eu Te Amo",
        "Querido John",
        "Como Eu Era Antes de Você",
        "A Culpa é das Estrelas",
        "Noivas em Guerra",
        "O Amor Não Tira Férias",
        "A Proposta",
        "Um Lugar Chamado Notting Hill",
        "Os Vingadores"
    },
    difficulty: "Médio"
),
        new QuestionsModel(
    id: "d9h7v2b3n1r6s4p0",
    name: "O Rei do Show",
    movieImages: new List<string>
    {
        "fa43f3292bb811eebd860612238522d6",
        "82fcd3602bba11eebd860612238522d6",
        "ee83d49c2bb611eebd860612238522d6",
        "86967a402bb511eebd860612238522d6",
        "ccddc6132bb311eebd860612238522d6",
        "537199492bb411eebd860612238522d6",
        "0e53677d2bb811eebd860612238522d6",
        "dfea07d32bb811eebd860612238522d6",
        "537cc3d32bb811eebd860612238522d6",
        "432689932bb611eebd860612238522d6",
    },
    correctAnswer: "O Rei do Show",
    answers: new List<string>
    {
        "La La Land: Cantando Estações",
        "Os Miseráveis",
        "Mamma Mia!",
        "O Fantasma da Ópera",
        "Chicago",
        "Rocketman",
        "A Noviça Rebelde",
        "O Show Must Go On",
        "Les Misérables",
        "A Star is Born"
    },
    difficulty: "Difícil"
),
        new QuestionsModel(
    id: "n1r8d6j5a7s3v0p9",
    name: "O Hobbit: Uma Jornada Inesperada",
    movieImages: new List<string>
    {
        "e3ba90bc090f11ee98b00612238522d6",
        "d9b1dd26091011ee98b00612238522d6",
        "18eeb402091011ee98b00612238522d6",
        "3fc401df091311ee98b00612238522d6",
        "928ea1cd091311ee98b00612238522d6",
        "180de27e090f11ee98b00612238522d6",
        "58df1d33091111ee98b00612238522d6",
        "03cbe6d5091011ee98b00612238522d6",
        "7238a481091011ee98b00612238522d6",
        "b210492d091311ee98b00612238522d6",
    },
    correctAnswer: "O Hobbit: Uma Jornada Inesperada",
    answers: new List<string>
    {
        "O Senhor dos Anéis: A Sociedade do Anel",
        "O Senhor dos Anéis: As Duas Torres",
        "O Senhor dos Anéis: O Retorno do Rei",
        "O Hobbit: A Desolação de Smaug",
        "As Crônicas de Nárnia: O Leão, a Feiticeira e o Guarda-Roupa",
        "Harry Potter e a Pedra Filosofal",
        "Harry Potter e as Relíquias da Morte",
        "Percy Jackson e o Ladrão de Raios",
        "O Senhor dos Anéis: O Retorno do Rei",
        "Eragon"
    },
    difficulty: "Médio"
),
        new QuestionsModel(
    id: "e2s9v3k1g5o7j6h0",
    name: "Shrek",
    movieImages: new List<string>
    {
        "20e9aa55af0711eeb80b0612238522d6",
        "b67b5ef2af0811eeb80b0612238522d6",
        "4cdbdba8af0011eeb80b0612238522d6",
        "6fba7ac7af0811eeb80b0612238522d6",
        "1ea8e2cdaf0011eeb80b0612238522d6",
        "6adda5adaf0011eeb80b0612238522d6",
        "fe42c962af0311eeb80b0612238522d6",
        "cb4451b5aeff11eeb80b0612238522d6",
        "270a6616af0211eeb80b0612238522d6",
        "324e80b2af0311eeb80b0612238522d6",
    },
    correctAnswer: "Shrek",
    answers: new List<string>
    {
        "Shrek 2",
        "Madagascar",
        "Kung Fu Panda",
        "Como Treinar o Seu Dragão",
        "O Gato de Botas",
        "Hotel Transilvânia",
        "A Era do Gelo",
        "A Família Addams",
        "O Rei Leão",
        "Monstros S.A."
    },
    difficulty: "Fácil"
),
        new QuestionsModel(
    id: "p9g2b4v3y8s7n1w0",
    name: "O Homem-Aranha",
    movieImages: new List<string>
    {
        "60f4ea30f5e911eab5c010ddb1aba44f",
        "3fc08d26f5e711eab5c010ddb1aba44f",
        "37e407eef5e811eab5c010ddb1aba44f",
        "9037aaeaf5e811eab5c010ddb1aba44f",
        "9f7e0278f5e911eab5c010ddb1aba44f",
        "5fcebd6cf5e811eab5c010ddb1aba44f",
        "f76a4764f5e711eab5c010ddb1aba44f",
        "70bb8570f5e711eab5c010ddb1aba44f",
        "21e62480f5e911eab5c010ddb1aba44f",
        "b79a080ef5e711eab5c010ddb1aba44f",
    },
    correctAnswer: "O Homem-Aranha",
    answers: new List<string>
    {
        "O Homem-Aranha 2",
        "Homem-Aranha: De Volta ao Lar",
        "Homem-Aranha: Longe de Casa",
        "Homem-Aranha: Sem Volta para Casa",
        "Venom",
        "X-Men: O Filme",
        "Vingadores: Guerra Infinita",
        "Capitão Marvel",
        "Deadpool",
        "Thor: Ragnarok"
    },
    difficulty: "Fácil"
),
        new QuestionsModel(
    id: "y3w5g1d7f8v4s0k2",
    name: "O Grande Gatsby",
    movieImages: new List<string>
    {
        "68f7db884c6f11ec9f0310ddb1aba44f",
        "874ee3f84c6d11ec9f0310ddb1aba44f",
        "a42a91584c6c11ec9f0310ddb1aba44f",
        "d12cf0864c6e11ec9f0310ddb1aba44f",
        "081097264c6d11ec9f0310ddb1aba44f",
        "f357572e4c6d11ec9f0310ddb1aba44f",
        "c1a2f5844c6e11ec9f0310ddb1aba44f",
        "3e83a5224c6e11ec9f0310ddb1aba44f",
        "0fe5ee1e4c6e11ec9f0310ddb1aba44f",
        "8dba97784c6d11ec9f0310ddb1aba44f",
    },
    correctAnswer: "O Grande Gatsby",
    answers: new List<string>
    {
        "O Grande Gatsby (1974)",
        "O Lobo de Wall Street",
        "Cidadão Kane",
        "A Rede Social",
        "O Rei do Show",
        "Moulin Rouge",
        "O Artista",
        "O Poderoso Chefão",
        "O Homem que Mudou o Jogo"
    },
    difficulty: "Difícil"
),
        new QuestionsModel(
    id: "z8d2e1g9h5w4i7m0",
    name: "Mulher-Maravilha",
    movieImages: new List<string>
    {
        "0e260a7052ac11ec9f0310ddb1aba44f",
        "486f8fb852ab11ec9f0310ddb1aba44f   ",
        "41d844ac52aa11ec9f0310ddb1aba44f",
        "b4f4712852a911ec9f0310ddb1aba44f",
        "88b465da52ab11ec9f0310ddb1aba44f",
        "77d0881a52ac11ec9f0310ddb1aba44f",
        "fbb89eac52ab11ec9f0310ddb1aba44f",
        "4d86fa8052ac11ec9f0310ddb1aba44f",
        "25c8f36452ab11ec9f0310ddb1aba44f",
        "eb2f7d6452a911ec9f0310ddb1aba44f",
    },
    correctAnswer: "Mulher-Maravilha",
    answers: new List<string>
    {
        "Mulher-Maravilha 1984",
        "Liga da Justiça",
        "Batman v Superman: A Origem da Justiça",
        "Vingadores: Ultimato",
        "Capitão Marvel",
        "Thor: Ragnarok",
        "Viúva Negra",
        "Homem de Ferro",
        "Aquaman"
    },
    difficulty: "Médio"
),
        new QuestionsModel(
    id: "v1b4d6j3p2r7m8s0",
    name: "A Rede Social",
    movieImages: new List<string>
    {
        "f9b383de527811ec9f0310ddb1aba44f",
        "c86eca7c527811ec9f0310ddb1aba44f",
        "56fe81d2527a11ec9f0310ddb1aba44f",
        "35bb1ffc527611ec9f0310ddb1aba44f",
        "588eb1b4527711ec9f0310ddb1aba44f",
        "0e48f71c527811ec9f0310ddb1aba44f",
        "dde79f8c527811ec9f0310ddb1aba44f",
        "14b5708a527811ec9f0310ddb1aba44f",
        "a10d0b9e527611ec9f0310ddb1aba44f",
        "ceede966527611ec9f0310ddb1aba44f",
    },
    correctAnswer: "A Rede Social",
    answers: new List<string>
    {
        "O Lobo de Wall Street",
        "A Grande Aposta",
        "Coringa",
        "O Lado Bom da Vida",
        "O Poderoso Chefão",
        "O Homem que Mudou o Jogo",
        "O Grande Gatsby",
        "A Hora do Show",
        "O Jogo da Imitação"
    },
    difficulty: "Difícil"
),

// new QuestionsModel(
//     id: "k2l9a3j5o1n6v8b0",
//     name: "Um Lugar Silencioso",
//     movieImages: new List<string>
//     {
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//     },
//     correctAnswer: "Um Lugar Silencioso",
//     answers: new List<string>
//     {
//         "O Hospedeiro",
//         "Bird Box",
//         "O Sexto Sentido",
//         "A Cabana",
//         "O Mistério das Duas Irmãs",
//         "Não Fale com Estranhos",
//         "Em Cabine Secreta",
//         "O Corpo",
//         "O Homem Invisível"
//     },
//     difficulty: "Difícil"
// ),

// new QuestionsModel(
//     id: "t9m4d3h1w6b0r8g2",
//     name: "Os Vingadores: Guerra Infinita",
//     movieImages: new List<string>
//     {
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//     },
//     correctAnswer: "Os Vingadores: Guerra Infinita",
//     answers: new List<string>
//     {
//         "Vingadores: Ultimato",
//         "Vingadores: A Era de Ultron",
//         "Vingadores: A Guerra Civil",
//         "Homem de Ferro",
//         "Thor: Ragnarok",
//         "Pantera Negra",
//         "Capitão Marvel",
//         "Homem-Aranha: De Volta ao Lar",
//         "Viúva Negra"
//     },
//     difficulty: "Médio"
// ),

// new QuestionsModel(
//     id: "o2f3e6k8j9t5v0r7",
//     name: "Jurassic World",
//     movieImages: new List<string>
//     {
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//     },
//     correctAnswer: "Jurassic World",
//     answers: new List<string>
//     {
//         "Jurassic World",
//         "Jurassic Park",
//         "Jurassic World: O Mundo Perdido",
//         "Jurassic World: Reino Ameaçado",
//         "O Mundo Perdido: Jurassic Park",
//         "O Parque dos Dinossauros",
//         "O Rei Leão",
//         "Transformers: O Último Cavaleiro",
//         "King Kong",
//         "Godzilla"
//     },
//     difficulty: "Médio"
// ),

// new QuestionsModel(
//     id: "f4h2g1j8b7v3s9d0",
//     name: "A Hora do Pesadelo",
//     movieImages: new List<string>
//     {
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//     },
//     correctAnswer: "A Hora do Pesadelo",
//     answers: new List<string>
//     {
//         "A Hora do Pesadelo",
//         "A Noite dos Mortos Vivos",
//         "O Exorcista",
//         "Halloween",
//         "O Iluminado",
//         "Pesadelo em Elm Street",
//         "O Chamado",
//         "Atividade Paranormal",
//         "Hereditary",
//         "Invocação do Mal"
//     },
//     difficulty: "Difícil"
// ),

// new QuestionsModel(
//     id: "y7r4p5j9h8s2v0b1",
//     name: "O Resgate do Soldado Ryan",
//     movieImages: new List<string>
//     {
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//     },
//     correctAnswer: "O Resgate do Soldado Ryan",
//     answers: new List<string>
//     {
//         "O Resgate do Soldado Ryan",
//         "Coração Valente",
//         "O Grande Herói",
//         "Soldado Anônimo",
//         "Platoon",
//         "O Franco Atirador",
//         "Até o Último Homem",
//         "Gladiador",
//         "O Pianista",
//         "A Ponte do Rio Kwai"
//     },
//     difficulty: "Médio"
// ),

// new QuestionsModel(
//     id: "s3v1t5m9r2j4w0g8",
//     name: "A Bela Adormecida",
//     movieImages: new List<string>
//     {
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//     },
//     correctAnswer: "A Bela Adormecida",
//     answers: new List<string>
//     {
//         "A Bela Adormecida",
//         "Branca de Neve e os Sete Anões",
//         "Cinderela",
//         "A Pequena Sereia",
//         "A Bela e a Fera",
//         "Aladdin",
//         "Frozen: Uma Aventura Congelante",
//         "Rapunzel: Enrolados",
//         "A Princesa e o Sapo",
//         "Mulan"
//     },
//     difficulty: "Fácil"
// ),

// new QuestionsModel(
//     id: "o3b5a6t9p2y1k0r8",
//     name: "Mulan",
//     movieImages: new List<string>
//     {
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//     },
//     correctAnswer: "Mulan",
//     answers: new List<string>
//     {
//         "Mulan",
//         "Mulan (2020)",
//         "O Rei Leão",
//         "A Pequena Sereia",
//         "Cinderela",
//         "Branca de Neve e os Sete Anões",
//         "A Bela Adormecida",
//         "Rapunzel: Enrolados",
//         "A Princesa e o Sapo",
//         "Frozen: Uma Aventura Congelante"
//     },
//     difficulty: "Fácil"
// ),

// new QuestionsModel(
//     id: "v2f3j8y1d7b9p0n4",
//     name: "Cidadão Kane",
//     movieImages: new List<string>
//     {
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//     },
//     correctAnswer: "Cidadão Kane",
//     answers: new List<string>
//     {
//         "Cidadão Kane",
//         "O Poderoso Chefão",
//         "Casablanca",
//         "O Grande Gatsby",
//         "O Filho de Saul",
//         "Lawrence da Arábia",
//         "O Iluminado",
//         "Pulp Fiction",
//         "O Nascimento de uma Nação",
//         "A Noviça Rebelde"
//     },
//     difficulty: "Difícil"
// ),

// new QuestionsModel(
//     id: "s9y1h3p5o6f7m0c4",
//     name: "Encontros e Desencontros",
//     movieImages: new List<string>
//     {
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//     },
//     correctAnswer: "Encontros e Desencontros",
//     answers: new List<string>
//     {
//         "Encontros e Desencontros",
//         "Antes do Amanhecer",
//         "O Lado Bom da Vida",
//         "Meia-Noite em Paris",
//         "O Fabuloso Destino de Amélie Poulain",
//         "Legalmente Loira",
//         "A Primeira Noite de um Homem",
//         "O Diário de uma Paixão",
//         "500 Dias com Ela",
//         "A Rede Social"
//     },
//     difficulty: "Difícil"
// ),

// new QuestionsModel(
//     id: "k1t3d9m5y7s0b4p0",
//     name: "O Náufrago",
//     movieImages: new List<string>
//     {
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//     },
//     correctAnswer: "O Náufrago",
//     answers: new List<string>
//     {
//         "O Náufrago",
//         "O Passageiro",
//         "O Segredo de Brokeback Mountain",
//         "Perdido em Marte",
//         "A Procura da Felicidade",
//         "Into the Wild",
//         "A Praia",
//         "O Livro de Eli",
//         "Na Natureza Selvagem",
//         "A Viagem"
//     },
//     difficulty: "Médio"
// ),

// new QuestionsModel(
//     id: "t8v1r2a7p6o9m3c0",
//     name: "Avatar",
//     movieImages: new List<string>
//     {
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//     },
//     correctAnswer: "Avatar",
//     answers: new List<string>
//     {
//         "Avatar",
//         "Avatar 2",
//         "O Senhor dos Anéis",
//         "O Hobbit",
//         "Jurassic World",
//         "Star Wars: O Império Contra-Ataca",
//         "Matrix",
//         "Transformers",
//         "O Rei Leão",
//         "Valente"
//     },
//     difficulty: "Fácil"
// ),

// new QuestionsModel(
//     id: "w4c1v5k3z0s8p9o2",
//     name: "A Hora do Rush",
//     movieImages: new List<string>
//     {
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//     },
//     correctAnswer: "A Hora do Rush",
//     answers: new List<string>
//     {
//         "A Hora do Rush",
//         "A Hora do Rush 2",
//         "A Hora do Rush 3",
//         "O Protetor",
//         "Máquina Mortífera",
//         "Vingadores: A Era de Ultron",
//         "Missão: Impossível",
//         "John Wick",
//         "Rush: No Limite da Emoção",
//         "Duro de Matar"
//     },
//     difficulty: "Médio"
// ),

// new QuestionsModel(
//     id: "o2z7y1d9v3h5s4g0",
//     name: "Laranja Mecânica",
//     movieImages: new List<string>
//     {
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//     },
//     correctAnswer: "Laranja Mecânica",
//     answers: new List<string>
//     {
//         "Laranja Mecânica",
//         "Laranja Mecânica 2",
//         "O Iluminado",
//         "A Clockwork Orange",
//         "O Show de Truman",
//         "O Menino do Pijama Listrado",
//         "Dr. Fantástico",
//         "Requiem for a Dream",
//         "Naked Lunch",
//         "Trainspotting"
//     },
//     difficulty: "Difícil"
// ),

// new QuestionsModel(
//     id: "x8w4m2r1y7v9t5p0",
//     name: "O Clube dos Cinco",
//     movieImages: new List<string>
//     {
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//     },
//     correctAnswer: "O Clube dos Cinco",
//     answers: new List<string>
//     {
//         "O Clube dos Cinco",
//         "Curtindo a Vida Adoidado",
//         "A Garota dos Seus Sonhos",
//         "As Patricinhas de Beverly Hills",
//         "Clueless",
//         "10 Coisas que Eu Odeio em Você",
//         "Mean Girls",
//         "Fast Times at Ridgemont High",
//         "American Pie",
//         "A Vingança"
//     },
//     difficulty: "Médio"
// ),

// new QuestionsModel(
//     id: "m4o9e3g5y2w7j0k8",
//     name: "Uma Mente Brilhante",
//     movieImages: new List<string>
//     {
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//         "",
//     },
//     correctAnswer: "Uma Mente Brilhante",
//     answers: new List<string>
//     {
//         "Uma Mente Brilhante",
//         "O Jogo da Imitação",
//         "A Teoria de Tudo",
//         "O Grande Mestre",
//         "O Pianista",
//         "A Rede Social",
//         "Homem de Ferro",
//         "A Dama de Ferro",
//         "O Exótico Hotel Marigold",
//         "A Procura da Felicidade"
//     },
//     difficulty: "Difícil"
// ),

        };

    }

}
