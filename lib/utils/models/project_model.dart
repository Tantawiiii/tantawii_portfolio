/// Data model for a featured project. Add new projects by appending to [allProjects].
class ProjectModel {
  final String title;
  final String subtitle;
  final String description;
  final String imagePath;
  final List<String> techStack;
  final String? link;

  const ProjectModel({
    required this.title,
    this.subtitle = 'Featured Project',
    required this.description,
    required this.imagePath,
    this.techStack = const [],
    this.link,
  });

  /// Master list of projects — add or remove entries here to scale.
  static const List<ProjectModel> allProjects = [
    ProjectModel(
      title: 'Example Project',
      subtitle: 'Featured Project',
      description:
          'A web app for visualizing personalized Spotify data. View your '
          'top artists, top tracks, recently played tracks, and detailed audio '
          'information about each track. Create and save new playlists of '
          'recommended tracks based on your existing playlists and more.',
      imagePath: 'assets/images/d3_img.png',
      techStack: ['Flutter', 'Firebase', 'REST API'],
      link: 'https://github.com',
    ),
    ProjectModel(
      title: 'Example Project',
      subtitle: 'Featured Project',
      description:
          'A web app for visualizing personalized Spotify data. View your '
          'top artists, top tracks, recently played tracks, and detailed audio '
          'information about each track. Create and save new playlists of '
          'recommended tracks based on your existing playlists and more.',
      imagePath: 'assets/images/d3_img.png',
      techStack: ['React', 'Node.js', 'MongoDB'],
      link: 'https://github.com',
    ),
  ];
}
