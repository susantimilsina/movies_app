# Movies App

![Coverage](coverage_badge.svg)
[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)

A Flutter app that uses the "[The Movie DB](https://www.themoviedb.org/)" api to fetch popular people and their info (their movies, images, ..etc). [(API version 3 is used)](https://developers.themoviedb.org/3/people/get-popular-people)


🎨 [Design inspiration](https://dribbble.com/shots/18460389-Mova-Movie-Streaming-App-UI-Kit)

### Content

* [Previews](#previews)
* [App Architecture & Folder Structure](#app-architecture-and-folder-structure)
* [Http Caching](#http-caching)
* [Testing with Riverpod](#testing-with-riverpod)
    1. [Dart-only testing](#1-dart-only-testing) 
    2. [Flutter Widget Tests](#2-flutter-widget-tests)


## Previews



## App Architecture and Folder Structure

The code of the app implements clean architecture to separate the UI, domain and data layers with a feature-first approach for folder structure.

#### Folder Structure

```
lib
├── core
│   ├── configs
│   ├── exceptions
│   ├── models
│   ├── services
│   │   ├── http
│   │   └── storage
│   ├── utils
│   └── widgets
├── features
│   ├── movies
│   │   ├── models
│   │   ├── providers
│   │   ├── repositories
│   │   └── views
│   │       ├── pages
│   │       └── widgets
│   ├── tv_series
│       ├── models
│       ├── providers
│       ├── repositories
│       └── views
│           ├── pages
│           └── widgets
├── main.dart
├── movies_app.dart
├── splash.dart
└── navigation_home_page.dart
```
    