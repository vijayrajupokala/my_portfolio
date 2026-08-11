import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
final VoidCallback onHome;
final VoidCallback onAbout;
final VoidCallback onSkills;
final VoidCallback onProjects;
final VoidCallback onContact;
final VoidCallback onToggleTheme;
final bool isDarkMode;

const Navbar({
super.key,
required this.onHome,
required this.onAbout,
required this.onSkills,
required this.onProjects,
required this.onContact,
required this.onToggleTheme,
required this.isDarkMode,
});

@override
Widget build(BuildContext context) {
final isMobile = MediaQuery.of(context).size.width < 800;

return SafeArea(
child: Padding(
padding: const EdgeInsets.all(16),
child: Align(
alignment: Alignment.topCenter,
child: Material(
elevation: 8,
borderRadius: BorderRadius.circular(18),
color: Theme.of(context).colorScheme.surface.withValues(
alpha: 0.95,
),
child: Padding(
padding: const EdgeInsets.symmetric(
horizontal: 20,
vertical: 12,
),
child: isMobile
? _mobileMenu(context)
    : _desktopMenu(context),
),
),
),
),
);
}

Widget _desktopMenu(BuildContext context) {
return Row(
mainAxisSize: MainAxisSize.min,
children: [
_logo(context),
const SizedBox(width: 25),
_navButton('Home', onHome),
_navButton('About', onAbout),
_navButton('Skills', onSkills),
_navButton('Projects', onProjects),
_navButton('Contact', onContact),
const SizedBox(width: 8),
IconButton(
tooltip: isDarkMode ? 'Light mode' : 'Dark mode',
onPressed: onToggleTheme,
icon: Icon(
isDarkMode
? Icons.light_mode_outlined
    : Icons.dark_mode_outlined,
),
),
],
);
}

Widget _mobileMenu(BuildContext context) {
return Row(
mainAxisSize: MainAxisSize.min,
children: [
_logo(context),
const SizedBox(width: 10),
PopupMenuButton<String>(
icon: const Icon(Icons.menu),
onSelected: (value) {
switch (value) {
case 'home':
onHome();
break;
case 'about':
onAbout();
break;
case 'skills':
onSkills();
break;
case 'projects':
onProjects();
break;
case 'contact':
onContact();
break;
}
},
itemBuilder: (context) => const [
PopupMenuItem(value: 'home', child: Text('Home')),
PopupMenuItem(value: 'about', child: Text('About')),
PopupMenuItem(value: 'skills', child: Text('Skills')),
PopupMenuItem(value: 'projects', child: Text('Projects')),
PopupMenuItem(value: 'contact', child: Text('Contact')),
],
),
IconButton(
tooltip: isDarkMode ? 'Light mode' : 'Dark mode',
onPressed: onToggleTheme,
icon: Icon(
isDarkMode
? Icons.light_mode_outlined
    : Icons.dark_mode_outlined,
),
),
],
);
}

Widget _logo(BuildContext context) {
return Text(
'VR',
style: Theme.of(context).textTheme.titleLarge?.copyWith(
fontWeight: FontWeight.bold,
color: Colors.blueAccent,
),
);
}

Widget _navButton(String title, VoidCallback onPressed) {
return Padding(
padding: const EdgeInsets.symmetric(horizontal: 3),
child: TextButton(
onPressed: onPressed,
child: Text(title),
),
);
}
}