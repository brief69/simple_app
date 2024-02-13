# Flutter Firebase Riverpod MVVM App

This project is a sample application built using Flutter, Firebase, Riverpod, and the MVVM architecture. It allows users to create posts, and view their posts on their profile page.

## Key Features

- Create and view posts
- User profile page
- Data persistence with Firebase Firestore
- State management with Riverpod
- MVVM architecture

## Setup

To run this project locally, follow these steps:

1. Set up your Flutter environment.
2. Clone this repository.
3. Navigate to the project directory in the command line and run `flutter pub get` to install dependencies.
4. Set up a Firebase project and add `google-services.json` (for Android) or `GoogleService-Info.plist` (for iOS) to your project.
5. Run `flutter run` to start the app.

## App Structure

- `lib/main.dart`: The entry point of the application.
- `lib/app.dart`: The root widget of the application.
- `lib/views/`: Directory containing widgets for each screen.
- `lib/models/`: Directory containing the model classes for the application.
- `lib/view_models/`: Directory containing the view models for the application.
- `lib/services/`: Directory containing classes that communicate with external services (e.g., Firebase Firestore).
- `lib/widgets/`: Directory containing reusable widgets.

## Notes

- Obtain your Firebase project settings from the Firebase console.
- If you make changes to the app's structure or dependencies, ensure to test appropriately.

This project is intended as a learning tool for app development with Flutter and Firebase. Further considerations, such as security and performance optimizations, are necessary before using it in a production environment.
