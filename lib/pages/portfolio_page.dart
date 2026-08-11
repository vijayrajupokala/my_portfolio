import 'package:flutter/material.dart';

import '../widgets/about_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/hero_section.dart';
import '../widgets/navbar.dart';
import '../widgets/projects_section.dart';
import '../widgets/skills_section.dart';

class PortfolioPage extends StatefulWidget {
final VoidCallback onToggleTheme;
final bool isDarkMode;

const PortfolioPage({
super.key,
required this.onToggleTheme,
required this.isDarkMode,
});

@override
State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
final GlobalKey _homeKey = GlobalKey();
final GlobalKey _aboutKey = GlobalKey();
final GlobalKey _skillsKey = GlobalKey();
final GlobalKey _projectsKey = GlobalKey();
final GlobalKey _contactKey = GlobalKey();

void scrollTo(GlobalKey key) {
final context = key.currentContext;

if (context == null) return;

Scrollable.ensureVisible(
context,
duration: const Duration(milliseconds: 700),
curve: Curves.easeInOut,
);
}

@override
Widget build(BuildContext context) {
return Scaffold(
body: Stack(
children: [
SingleChildScrollView(
child: Column(
children: [
Container(
key: _homeKey,
child: HeroSection(
onViewProjects: () => scrollTo(_projectsKey),
onContactMe: () => scrollTo(_contactKey),
),
),

Container(
key: _aboutKey,
child: const AboutSection(),
),

Container(
key: _skillsKey,
child: const SkillsSection(),
),

Container(
key: _projectsKey,
child: const ProjectsSection(),
),

Container(
key: _contactKey,
child: const ContactSection(),
),
],
),
),

Navbar(
onHome: () => scrollTo(_homeKey),
onAbout: () => scrollTo(_aboutKey),
onSkills: () => scrollTo(_skillsKey),
onProjects: () => scrollTo(_projectsKey),
onContact: () => scrollTo(_contactKey),
onToggleTheme: widget.onToggleTheme,
isDarkMode: widget.isDarkMode,
),
],
),
);
}
}