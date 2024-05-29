# visit_nepal

# Flutter Application

This Flutter application demonstrates best practices in Flutter development, featuring clean architecture, responsive design, and integrations with REST APIs, Cubit for state management, and Firebase for authentication.

## Features

- **HTTP REST API Integration:** Connects to a RESTful API to fetch and display data.
- **Cubit State Management:** Manages the state of the application using Cubit for predictable and scalable state management.
- **Firebase Authentication:** Provides user authentication (login and registration) using Firebase.
- **Responsive Design:** Ensures the application looks great on devices of all sizes.
## Project Structure
The project follows a feature-based folder structure for better scalability and maintainability.
- lib/
- ├── cubit/                # Contains Cubit classes for state management
- ├── models/               # Data models
- ├── repository/           # Repository classes for API calls
- ├── screens/              # UI screens of the app
- ├── services/             # Services such as API service and Firebase service
- ├── widgets/              # Reusable UI components
- └── main.dart             # Entry point of the application

