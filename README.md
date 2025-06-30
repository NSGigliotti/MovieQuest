# 🎬 MovieQuest

**MovieQuest** é um jogo divertido onde o jogador deve adivinhar o nome do filme a partir de uma única imagem. Para cada imagem apresentada, quatro opções de filmes são exibidas, e apenas uma está correta.

---

## 📱 Tecnologias Utilizadas

### Frontend (Flutter)
- **Flutter**: UI moderna e reativa
- **Provider**: Gerenciamento de estado simples
- **MobX**: Programação reativa com observables
- **Freezed**: Geração de classes imutáveis com suporte a union types

### Backend (C#)
- **ASP.NET Core**: API para gerenciamento das imagens, opções de filmes e lógica do jogo
- **Docker**: Containerização da aplicação para facilitar o deploy
- **MySQL**: Banco de dados relacional para armazenar as informações dos filmes e estatísticas de jogo

---

## 🧩 Como Funciona

1. O backend retorna uma imagem com 4 opções de filmes.
2. O usuário escolhe a resposta correta.
3. A API avalia a resposta e retorna se está certa ou errada, além de seguir para a próxima pergunta.
4. O front mantém o estado do jogo com Provider e MobX e usa classes `Freezed` para modelar os dados.

---

## 🚀 Como Rodar o Projeto

### Pré-requisitos

- Docker e Docker Compose instalados
- Flutter instalado ([guia oficial](https://flutter.dev/docs/get-started/install))

---

### 🔧 Backend (C# + Docker + MySQL)

1. Navegue até o diretório `backend/` (ajuste conforme sua estrutura).
2. Execute o Docker Compose:

```bash
docker-compose up --build
```

---

### 📱 Frontend (Flutter)

Navegue até o diretório frontend/

Instale as dependências:
```bash
flutter pub get
```
Execute o app:
```bash
flutter run
```

## 🛠 Estrutura dos Diretórios

```bash
moviequest/
├── backend/               # API em ASP.NET Core
│   ├── Dockerfile
│   ├── docker-compose.yml
│   └── ...
├── frontend/              # App Flutter
│   ├── lib/
│   │   ├── models/        # Modelos com Freezed
│   │   ├── stores/        # MobX Stores
│   │   └── screens/
│   └── pubspec.yaml
└── README.md
```
## 🧪 Testes
Flutter: use flutter test para testes de unidade e widget.

C#: use dotnet test nos projetos de teste.

## 📸 Exemplo de Tela
```bash
[Imagem do filme]

1️⃣ Matrix  
2️⃣ Inception  
3️⃣ Interstellar  
4️⃣ Blade Runn
```
