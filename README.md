# Cooksy: A Flutter Recipe Guide

https://play.google.com/store/apps/details?id=com.ocdev.cuban.engineers.recipe.cuban_engineers_recipe_challenge

Cooksy is a Flutter recipe app that offers a wide range of features for culinary enthusiasts. This project incorporates Clean Architecture, integration with the Spoonacular API using Dio and Retrofit, offline persistence with Hive, unit and widget testing, animations with the Lottie library, and more.

## Key Features

- **Clean Architecture**: The project follows clean architecture principles to maintain code scalability and maintainability.

- **Spoonacular API**: We use the Spoonacular API to fetch information about recipes, ingredients, and more.

- **Offline Persistence with Hive**: Recipes and essential data are stored locally, allowing users to access them even without an internet connection.

- **Unit, Widget and integration Testing**: We ensure application stability through automated testing.

- **Lottie Animations**: Lottie animations are added to enhance the user experience.

## Video 
[![Vídeo de Receita](https://i9.ytimg.com/vi_webp/e1JJc8hKfLI/mqdefault.webp?v=653f4b75&sqp=CJCW_akG&rs=AOn4CLBm7lKR9bkzerTuCM4zC2PzVK-v3A)](https://www.youtube.com/watch?v=e1JJc8hKfLI)

## Screenshots

<a href="https://drive.google.com/uc?id=1MU62FsKLCOiJgYTvFK62CErYRNt1v8Fn"><img src="https://drive.google.com/uc?id=1MU62FsKLCOiJgYTvFK62CErYRNt1v8Fn" style="width: 200px; max-width: 100%; height: auto" title="Click to enlarge picture" /></a>
*Introduction Screen*

<a href="https://drive.google.com/uc?id=1zL-aDdhgjj6uF7atE4ukNc6kRgkPyrGS"><img src="https://drive.google.com/uc?id=1zL-aDdhgjj6uF7atE4ukNc6kRgkPyrGS" style="width: 200px; max-width: 100%; height: auto" title="Click to enlarge picture" /></a>
*Inspiration screen*

<a href="https://drive.google.com/uc?id=13f46YcYb_7ugXZ3vd2Pb4vTPVbBGsNak"><img src="https://drive.google.com/uc?id=13f46YcYb_7ugXZ3vd2Pb4vTPVbBGsNak" style="width: 200px; max-width: 100%; height: auto" title="Click to enlarge picture" /></a>
*Latest*

<a href="https://drive.google.com/uc?id=1kC5asc04KL0nKYnpbpZcl2fZwM7QSZef"><img src="https://drive.google.com/uc?id=1kC5asc04KL0nKYnpbpZcl2fZwM7QSZef" style="width: 200px; max-width: 100%; height: auto" title="Click to enlarge picture" /></a>
*detail*

## Enviroment
Flutter:3.10.6
Gradle:7.5


## Setup

Follow the steps below to set up the development environment and run the project locally:

1. **Clone the repository**:

   ```bash
   git clone https://github.com/otocampos/cuban-engineers-recipe-challenge.git
   cd cooksy
   flutter pub get
   flutter run --dart-define=spoon-api=YOU_API_KEY
   obs: dont use fvm,problems with --dart-define
