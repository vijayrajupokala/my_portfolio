import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
const AboutSection({super.key});

@override
Widget build(BuildContext context) {
final screenWidth = MediaQuery.of(context).size.width;
final isMobile = screenWidth < 800;

return Container(
width: double.infinity,
padding: EdgeInsets.symmetric(
horizontal: isMobile ? 24 : 80,
vertical: 100,
),
child: Column(
children: [
Text(
'About Me',
style: Theme.of(context).textTheme.headlineMedium?.copyWith(
fontWeight: FontWeight.bold,
),
),

const SizedBox(height: 12),

Container(
width: 60,
height: 4,
decoration: BoxDecoration(
color: Colors.blueAccent,
borderRadius: BorderRadius.circular(10),
),
),

const SizedBox(height: 45),

ConstrainedBox(
constraints: const BoxConstraints(maxWidth: 950),
child: isMobile
? Column(
children: [
_aboutCard(context),
const SizedBox(height: 24),
_educationCard(context),
],
)
    : Row(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Expanded(
child: _aboutCard(context),
),
const SizedBox(width: 30),
Expanded(
child: _educationCard(context),
),
],
),
),
],
),
);
}

Widget _aboutCard(BuildContext context) {
return Card(
elevation: 4,
child: Padding(
padding: const EdgeInsets.all(28),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Icon(
Icons.person_outline,
size: 42,
color: Colors.blueAccent,
),

const SizedBox(height: 20),

Text(
'Who I Am',
style: Theme.of(context).textTheme.titleLarge?.copyWith(
fontWeight: FontWeight.bold,
),
),

const SizedBox(height: 16),

Text(
'I am Vijay Raju Pokala, a B.Tech Information Technology '
'graduate with a strong interest in application development. '
'I enjoy learning new technologies and turning ideas into '
'functional, user-friendly applications.',
style: Theme.of(context).textTheme.bodyLarge?.copyWith(
height: 1.7,
),
),

const SizedBox(height: 16),

Text(
'My current focus is Flutter and Dart development. I am '
'building practical projects to strengthen my understanding '
'of UI development, state management, APIs, device features '
'and application architecture.',
style: Theme.of(context).textTheme.bodyLarge?.copyWith(
height: 1.7,
),
),
],
),
),
);
}

Widget _educationCard(BuildContext context) {
return Card(
elevation: 4,
child: Padding(
padding: const EdgeInsets.all(28),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Icon(
Icons.school_outlined,
size: 42,
color: Colors.blueAccent,
),

const SizedBox(height: 20),

Text(
'Education',
style: Theme.of(context).textTheme.titleLarge?.copyWith(
fontWeight: FontWeight.bold,
),
),

const SizedBox(height: 20),

Text(
'B.Tech – Information Technology',
style: Theme.of(context).textTheme.titleMedium?.copyWith(
fontWeight: FontWeight.w600,
),
),

const SizedBox(height: 8),

Text(
'CMR Technical Campus, Hyderabad',
style: Theme.of(context).textTheme.bodyLarge,
),

const SizedBox(height: 8),

Text(
'2022 – 2026',
style: Theme.of(context).textTheme.bodyMedium?.copyWith(
color: Colors.blueAccent,
),
),

const SizedBox(height: 24),

const Divider(),

const SizedBox(height: 20),

Text(
'Career Goal',
style: Theme.of(context).textTheme.titleMedium?.copyWith(
fontWeight: FontWeight.w600,
),
),

const SizedBox(height: 10),

Text(
'To grow as a Flutter Developer by building high-quality '
'applications and gaining practical industry experience.',
style: Theme.of(context).textTheme.bodyLarge?.copyWith(
height: 1.6,
),
),
],
),
),
);
}
}