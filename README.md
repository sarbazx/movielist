# MovieList App

A Flutter application for browsing movies.

## Features

- Browse movies
- Search movies
- View movie details
- Toggle theme

## Setup

1. Clone the repository
2. Create a `.env` file in the root of the project with the following variables:
   - `MOVIES_API_KEY`: your API key for the OMDBAPI API
   - `MOVIES_API_URL`: the URL for the OMDBAPI API
3. Run `flutter pub get`
4. Run `flutter run`

## Testing

To run the tests, run `flutter test`

## Linting

To run the linting, run `flutter analyze`

## Architecture

The app is built using the Bloc pattern. App is divided in following way:

- `lib/app.dart`: contains the main app file
- `lib/movie`: contains the movie related files
- `lib/movies`: contains the movies related files
- `lib/theme`: contains the theme related files
- `lib/router.dart`: contains the router for the app
