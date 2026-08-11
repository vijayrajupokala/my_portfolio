import '../models/project.dart';

const List<Project> projects = [
Project(
title: 'Weather App',
description:
'A Flutter weather application that detects the user location '
'and displays current weather information using a weather API.',
image: 'assets/images/weather_app.png',
technologies: [
'Flutter',
'Dart',
'REST API',
'Geolocation',
],
githubUrl:
'https://github.com/vijayrajupokala/flutter_weather_app',
),

Project(
title: 'Expense Tracker',
description:
'A personal expense management application for adding, '
'editing, deleting and managing daily expenses.',
image: 'assets/images/expense_tracker.png',
technologies: [
'Flutter',
'Dart',
'Material 3',
'State Management',
],
githubUrl:
'https://github.com/vijayrajupokala',
),

Project(
title: 'Dicee',
description:
'An interactive Flutter dice application that generates '
'random dice values when the user rolls the dice.',
image: 'assets/images/dicee.png',
technologies: [
'Flutter',
'Dart',
'Random',
'setState',
],
githubUrl:
'https://github.com/vijayrajupokala',
),
];