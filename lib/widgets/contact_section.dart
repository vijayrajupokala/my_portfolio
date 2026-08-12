import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
const ContactSection({super.key});

Future<void> _openUrl(String url) async {
final uri = Uri.parse(url);

if (await canLaunchUrl(uri)) {
await launchUrl(
uri,
mode: LaunchMode.externalApplication,
);
}
}

Future<void> _sendEmail() async {
final uri = Uri(
scheme: 'mailto',
path: 'vijayrajupokala@gmail.com',
queryParameters: {
'subject': 'Flutter Developer Opportunity',
},
);

if (await canLaunchUrl(uri)) {
await launchUrl(uri);
}
}

@override
Widget build(BuildContext context) {
final screenWidth = MediaQuery.of(context).size.width;
final isMobile = screenWidth < 700;

return Container(
width: double.infinity,
padding: EdgeInsets.symmetric(
horizontal: isMobile ? 24 : 80,
vertical: 100,
),
child: Column(
children: [
Text(
'Let\'s Connect',
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

const SizedBox(height: 24),

ConstrainedBox(
constraints: const BoxConstraints(maxWidth: 700),
child: Text(
'I am open to opportunities where I can learn, contribute '
'and grow as a Flutter Developer. Feel free to connect with me.',
textAlign: TextAlign.center,
style: Theme.of(context).textTheme.bodyLarge?.copyWith(
height: 1.7,
),
),
),

const SizedBox(height: 45),

ConstrainedBox(
constraints: const BoxConstraints(maxWidth: 800),
child: Wrap(
alignment: WrapAlignment.center,
spacing: 16,
runSpacing: 16,
children: [
_ContactCard(
icon: Icons.email_outlined,
title: 'Email',
value: 'vijayrajupokala@gmail.com',
onTap: _sendEmail,
),
_ContactCard(
icon: Icons.work_outline,
title: 'LinkedIn',
value: 'Connect with me',onTap: () => _openUrl(
  'https://www.linkedin.com/in/vijay-raju-pokala/',
),  
),
_ContactCard(
icon: Icons.code,
title: 'GitHub',
value: 'View my projects',
onTap: () => _openUrl(
'https://github.com/vijayrajupokala',
),
),
],
),
),

const SizedBox(height: 70),

const Divider(),

const SizedBox(height: 25),

Text(
'© 2026 Vijay Raju Pokala',
style: Theme.of(context).textTheme.bodyMedium,
),

const SizedBox(height: 8),

Text(
'Built with Flutter & Dart',
style: Theme.of(context).textTheme.bodySmall?.copyWith(
color: Colors.blueAccent,
),
),
],
),
);
}
}

class _ContactCard extends StatefulWidget {
final IconData icon;
final String title;
final String value;
final VoidCallback onTap;

const _ContactCard({
required this.icon,
required this.title,
required this.value,
required this.onTap,
});

@override
State<_ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<_ContactCard> {
bool _isHovered = false;

@override
Widget build(BuildContext context) {
return MouseRegion(
cursor: SystemMouseCursors.click,
onEnter: (_) {
setState(() {
_isHovered = true;
});
},
onExit: (_) {
setState(() {
_isHovered = false;
});
},
child: GestureDetector(
onTap: widget.onTap,
child: AnimatedContainer(
duration: const Duration(milliseconds: 200),
width: 230,
padding: const EdgeInsets.all(22),
transform: Matrix4.translationValues(
0,
_isHovered ? -5 : 0,
0,
),
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(16),
border: Border.all(
color: Colors.blueAccent.withValues(
alpha: _isHovered ? 0.7 : 0.2,
),
),
boxShadow: [
if (_isHovered)
BoxShadow(
blurRadius: 15,
spreadRadius: 1,
color: Colors.blueAccent.withValues(alpha: 0.15),
),
],
),
child: Column(
children: [
Icon(
widget.icon,
size: 36,
color: Colors.blueAccent,
),
const SizedBox(height: 12),
Text(
widget.title,
style: Theme.of(context).textTheme.titleMedium?.copyWith(
fontWeight: FontWeight.bold,
),
),
const SizedBox(height: 6),
Text(
widget.value,
textAlign: TextAlign.center,
style: Theme.of(context).textTheme.bodySmall,
),
],
),
),
),
);
}
}