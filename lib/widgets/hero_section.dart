import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
final VoidCallback onViewProjects;
final VoidCallback onContactMe;

const HeroSection({
super.key,
required this.onViewProjects,
required this.onContactMe,
});

Future<void> _openResume() async {
  final uri = Uri.parse('vijay_resume.pdf');

  if (await canLaunchUrl(uri)) {
    await launchUrl(
      uri,
      webOnlyWindowName: '_blank',
    );
  }
}

@override
Widget build(BuildContext context) {
final screenWidth = MediaQuery.of(context).size.width;
final isMobile = screenWidth < 700;

return Container(
width: double.infinity,
constraints: const BoxConstraints(minHeight: 720),
padding: EdgeInsets.symmetric(
horizontal: isMobile ? 24 : 80,
vertical: 140,
),
child: isMobile
? Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
_profileImage(),
const SizedBox(height: 40),
_content(context, isMobile),
],
)
    : Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Expanded(
flex: 3,
child: _content(context, isMobile),
),
const SizedBox(width: 60),
Expanded(
flex: 2,
child: _profileImage(),
),
],
),
);
}

Widget _profileImage() {
return Container(
width: 260,
height: 260,
decoration: BoxDecoration(
shape: BoxShape.circle,
border: Border.all(
color: Colors.blueAccent,
width: 5,
),
boxShadow: [
BoxShadow(
color: Colors.blueAccent.withValues(alpha: 0.25),
blurRadius: 30,
spreadRadius: 5,
),
],
),
child: ClipOval(
child: Image.asset(
'assets/images/profilepic.jpeg',
fit: BoxFit.cover,
errorBuilder: (context, error, stackTrace) {
return const Icon(
Icons.person,
size: 120,
);
},
),
),
);
}

Widget _content(BuildContext context, bool isMobile) {
return Column(
crossAxisAlignment:
isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
children: [
Text(
'Hello, I am',
style: Theme.of(context).textTheme.titleLarge,
textAlign: isMobile ? TextAlign.center : TextAlign.left,
),

const SizedBox(height: 12),

Text(
'Vijay Raju Pokala',
style: Theme.of(context).textTheme.displaySmall?.copyWith(
fontWeight: FontWeight.bold,
),
textAlign: isMobile ? TextAlign.center : TextAlign.left,
),

const SizedBox(height: 12),

Text(
'Flutter Developer',
style: Theme.of(context).textTheme.headlineMedium?.copyWith(
color: Colors.blueAccent,
fontWeight: FontWeight.w600,
),
textAlign: isMobile ? TextAlign.center : TextAlign.left,
),

const SizedBox(height: 24),

ConstrainedBox(
constraints: const BoxConstraints(maxWidth: 650),
child: Text(
'I build practical, responsive and user-friendly mobile '
'applications using Flutter and Dart. I enjoy turning ideas '
'into clean and functional applications while continuously '
'improving my development skills.',
style: Theme.of(context).textTheme.bodyLarge?.copyWith(
height: 1.7,
),
textAlign: isMobile ? TextAlign.center : TextAlign.left,
),
),

const SizedBox(height: 35),

Wrap(
spacing: 14,
runSpacing: 14,
alignment:
isMobile ? WrapAlignment.center : WrapAlignment.start,
children: [
ElevatedButton.icon(
onPressed: onViewProjects,
icon: const Icon(Icons.work_outline),
label: const Text('View Projects'),
),

OutlinedButton.icon(
onPressed: onContactMe,
icon: const Icon(Icons.email_outlined),
label: const Text('Contact Me'),
),

OutlinedButton.icon(
onPressed: _openResume,
icon: const Icon(Icons.description_outlined),
label: const Text('Resume'),
),
],
),
],
);
}
}