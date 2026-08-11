class Project {
  final String title;
  final String description;
  final String image;
  final List<String> technologies;
  final String githubUrl;

  const Project({
    required this.title,
    required this.description,
    required this.image,
    required this.technologies,
    required this.githubUrl,
  });
}