import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
const SkillsSection({super.key});

@override
Widget build(BuildContext context) {
final screenWidth = MediaQuery.of(context).size.width;
final isMobile = screenWidth < 700;

final skills = [
{
'name': 'Flutter',
'icon': Icons.phone_android,
'level': 'Application Development',
},
{
'name': 'Dart',
'icon': Icons.code,
'level': 'Programming',
},
{
'name': 'REST APIs',
'icon': Icons.api,
'level': 'API Integration',
},
{
'name': 'UI Development',
'icon': Icons.design_services,
'level': 'Responsive Interfaces',
},
{
'name': 'Git & GitHub',
'icon': Icons.source,
'level': 'Version Control',
},
{
'name': 'Firebase',
'icon': Icons.cloud_outlined,
'level': 'Backend Services',
},
{
'name': 'State Management',
'icon': Icons.account_tree_outlined,
'level': 'Application State',
},
{
'name': 'Android Studio',
'icon': Icons.laptop_mac,
'level': 'Development Environment',
},
];

return Container(
width: double.infinity,
padding: EdgeInsets.symmetric(
horizontal: isMobile ? 24 : 80,
vertical: 100,
),
child: Column(
children: [
Text(
'Skills',
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
constraints: const BoxConstraints(maxWidth: 1100),
child: LayoutBuilder(
builder: (context, constraints) {
final crossAxisCount = constraints.maxWidth >= 950
? 4
    : constraints.maxWidth >= 600
? 2
    : 1;

return GridView.builder(
shrinkWrap: true,
physics: const NeverScrollableScrollPhysics(),
itemCount: skills.length,
gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
crossAxisCount: crossAxisCount,
crossAxisSpacing: 20,
mainAxisSpacing: 20,
childAspectRatio: 1.45,
),
itemBuilder: (context, index) {
final skill = skills[index];

return _SkillCard(
name: skill['name'] as String,
level: skill['level'] as String,
icon: skill['icon'] as IconData,
);
},
);
},
),
),
],
),
);
}
}

class _SkillCard extends StatefulWidget {
final String name;
final String level;
final IconData icon;

const _SkillCard({
required this.name,
required this.level,
required this.icon,
});

@override
State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
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
child: AnimatedContainer(
duration: const Duration(milliseconds: 200),
transform: Matrix4.translationValues(
0,
_isHovered ? -6 : 0,
0,
),
child: Card(
elevation: _isHovered ? 10 : 3,
child: Padding(
padding: const EdgeInsets.all(20),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
AnimatedScale(
scale: _isHovered ? 1.12 : 1,
duration: const Duration(milliseconds: 200),
child: Icon(
widget.icon,
size: 42,
color: Colors.blueAccent,
),
),
const SizedBox(height: 14),
Text(
widget.name,
textAlign: TextAlign.center,
style: Theme.of(context).textTheme.titleMedium?.copyWith(
fontWeight: FontWeight.bold,
),
),
const SizedBox(height: 6),
Text(
widget.level,
textAlign: TextAlign.center,
style: Theme.of(context).textTheme.bodySmall,
),
],
),
),
),
),
);
}
}