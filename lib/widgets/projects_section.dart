import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/projects.dart';
import '../models/project.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
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
            'My Projects',
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

          const SizedBox(height: 20),

          Text(
            'Projects I have built while learning and developing my Flutter skills.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              height: 1.6,
            ),
          ),

          const SizedBox(height: 50),

          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1150),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final crossAxisCount = constraints.maxWidth >= 950
                    ? 3
                    : constraints.maxWidth >= 600
                    ? 2
                    : 1;

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: projects.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                    childAspectRatio: 0.78,
                  ),
                  itemBuilder: (context, index) {
                    return ProjectCard(
                      project: projects[index],
                      onGithub: () =>
                          _openUrl(projects[index].githubUrl),
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

class ProjectCard extends StatefulWidget {
  final Project project;
  final VoidCallback onGithub;

  const ProjectCard({
    super.key,
    required this.project,
    required this.onGithub,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
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
        duration: const Duration(milliseconds: 250),
        transform: Matrix4.translationValues(
          0,
          _isHovered ? -8 : 0,
          0,
        ),
        child: Card(
          elevation: _isHovered ? 12 : 4,
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _projectImage(context),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.project.title,
                        style:
                        Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 12),

                      Expanded(
                        child: Text(
                          widget.project.description,
                          style:
                          Theme.of(context).textTheme.bodyMedium?.copyWith(
                            height: 1.5,
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: widget.project.technologies
                            .map(
                              (technology) => Chip(
                            label: Text(
                              technology,
                              style: const TextStyle(fontSize: 11),
                            ),
                            visualDensity: VisualDensity.compact,
                          ),
                        )
                            .toList(),
                      ),

                      const SizedBox(height: 14),

                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: widget.onGithub,
                          icon: const Icon(Icons.code),
                          label: const Text('View on GitHub'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _projectImage(BuildContext context) {
    return SizedBox(
      height: 170,
      width: double.infinity,
      child: Image.asset(
        widget.project.image,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Theme.of(context)
                .colorScheme
                .primary
                .withValues(alpha: 0.08),
            child: Center(
              child: Icon(
                _getProjectIcon(),
                size: 70,
                color: Colors.blueAccent,
              ),
            ),
          );
        },
      ),
    );
  }

  IconData _getProjectIcon() {
    switch (widget.project.title) {
      case 'Weather App':
        return Icons.cloud_outlined;
      case 'Expense Tracker':
        return Icons.account_balance_wallet_outlined;
      case 'Dicee':
        return Icons.casino_outlined;
      default:
        return Icons.apps;
    }
  }
}