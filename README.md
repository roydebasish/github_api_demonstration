# 🧩 GitHub API Demonstration (Flutter + Clean Architecture)

A **GitHub API Demonstration** showcasing a production-level clean architecture setup.  
It fetches and displays **top starred Flutter repositories** from the **GitHub API**,  
supports **offline caching (SQLite)**, **theme persistence (light/dark)**, and  
**sorting/filtering** options for repositories.


## 🚀 Project Overview

This app demonstrates a scalable and testable Flutter architecture:
- Built with **Clean Architecture** and **Feature-First structure**
- Uses **BLoC (Business Logic Component)** for state management
- Integrates **Dio** for API calls with error handling & logging
- Persists repositories in **SQLite (sqflite)** for offline access
- Supports **dynamic theme switching** with **SharedPreferences** persistence
- Provides **sorting and filtering** (by stars or last updated)
- Demonstrates **environment-based configuration** (Dev, Staging, Prod)


## ⚙️ How to Run the App

## 1️⃣ Clone the Repository
git clone https://github.com/roydebasish/github_api_demonstration
cd github_api_demonstration

## 2️⃣ Install Dependencies
flutter pub get

## 3️⃣ Run the App
flutter run

You can specify the environment from main.dart:
AppConfig.initialize("dev"); // or "staging" / "prod"

## 🧩 Key Dependencies
| Package                           | Purpose                                 |
| --------------------------------- | --------------------------------------- |
| **flutter_bloc**                  | State management using BLoC pattern     |
| **dio**                           | HTTP client for API communication       |
| **sqflite**                       | Local SQLite database storage           |
| **path_provider**                 | File system paths for database          |
| **shared_preferences**            | Persist theme mode selection            |
| **intl**                          | Date formatting for repository updates  |
| **equatable**                     | Simplified equality for states/entities |

## 💡 Features
- ✅ Fetch top 50 Flutter repositories from GitHub
- ✅ Cache data locally for offline use
- ✅ Sort repositories by stars or last updated
- ✅ Light/Dark theme toggle with persistence
- ✅ Clean layered architecture for scalability
- ✅ Responsive, theme-aware UI

## 🧠 Architecture Overview
Clean Architecture Layers:
  - Domain Layer → Entities, UseCases, Abstract Repositories
  - Data Layer → Models, Local/Remote DataSources, Repository Implementation
  - Presentation Layer → BLoC + UI



