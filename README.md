# Campus Platform 🎓: University Management App in Flutter

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter)
![Architecture](https://img.shields.io/badge/architecture-Clean-success)
![State](https://img.shields.io/badge/state-Bloc-1E88E5)

> One app for campus events, courses and student information, built with **Clean Architecture** and **Bloc**.
> Team project at NCTU. I was the lead Flutter developer.

## ✨ Features
- **Authentication**: multi-step sign-up, JWT tokens kept in secure storage, protected routes with route guards
- **Courses & profiles**: browse courses and student info with offline caching (Hive)
- **Events**: campus events and activities
- **Real-time updates**: Socket.IO connection to the backend
- **File handling**: pick images/files and **export data to Excel**
- **Arabic / English**: easy_localization with generated keys
- **Light & dark themes**, responsive layouts (sizer, device_preview)

## 🏗 Architecture

```
lib/
├── app/
│   ├── data/          # datasources (Dio), models (freezed/json_serializable), repositories
│   ├── domain/        # entities, repository contracts, use cases
│   └── presentation/  # bloc, screens, widgets
└── core/
    ├── cache/         # Hive caches (auth, user, profile, course)
    ├── di/            # get_it + injectable
    ├── error/         # Failure types + centralized Dio error handler
    ├── localization/
    ├── router/        # auto_route + guards
    ├── services/      # Dio client, Hive, secure storage, Socket.IO
    └── themes/        # light / dark
```

```
Screen → Bloc → UseCase → Repository → RemoteDataSource (Dio) / Local cache (Hive)
```

**Why Bloc?** Clear events and states for multi-step flows like sign-up, and business logic is separated from the UI.
**Errors:** `fpdart` `Either<Failure, T>` plus one `DioErrorHandler` that maps network errors to user-friendly failures.

## 🧰 Tech stack
flutter_bloc · get_it · injectable · auto_route · dio · pretty_dio_logger · freezed · json_serializable · fpdart · equatable · hive_flutter · flutter_secure_storage · jwt_decoder · socket_io_client · easy_localization · cached_network_image · excel · file_picker · image_picker

## 🚀 Getting started
```bash
git clone https://github.com/ramynabilmahmoud/campus-platform.git
cd campus-platform
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```
The app talks to a REST API. Set the base URL in `lib/core/constants/api_constants.dart`.

## 🗺 Roadmap
- [ ] Bloc unit tests
- [ ] Push notifications
- [ ] Web build

## 👤 Author
**Ramy Nabil Mahran**, Lead Flutter Developer · [LinkedIn](https://www.linkedin.com/in/ramynabilmahran/) · ramynabilmahran@gmail.com
