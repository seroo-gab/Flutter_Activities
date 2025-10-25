import 'package:flutter/material.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      ProjectData(
        title: 'Line Following Robot',
        description:
            'Autonomous robot that follows a predefined path using sensors and esp32 microcontroller.',
        icon: Icons.flash_on,
        tags: ['Arduino', 'Sensors', 'ESP32', 'Robotics'],
        gradientColors: [Colors.blue[400]!, Colors.cyan[400]!],
        imagePath: 'assets/linefollowbot.png',
      ),
      ProjectData(
        title: 'Sumobot',
        description:
            'Combat robot designed for sumo wrestling competitions with advanced motor control and strategy.',
        icon: Icons.smart_toy,
        tags: ['Arduino', 'Sensors','Robotics'],
        gradientColors: [Colors.green[400]!, Colors.teal[400]!],
        imagePath: 'assets/sumobot.png',
      ),
      ProjectData(
        title: 'Wireless Switch Button',
        description:
            'IoT prototype enabling remote control of devices through wireless communication protocols.',
        icon: Icons.sensors,
        tags: ['IoT', 'Wireless', 'Bluetooth', 'Prototype'],
        gradientColors: [Colors.orange[400]!, Colors.amber[400]!],
        imagePath: null, // No image for this one
      ),
    ];

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1F2121),
            Color(0xFF262828),
          ],
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              
              // Header
              const Text(
                'Featured Projects',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Things I\'ve built and tinkered with',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[400],
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Projects
              ...projects.map((project) => Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: _buildProjectCard(project),
                  )),
              
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectCard(ProjectData project) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: project.gradientColors[0].withOpacity(0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Project Image
          Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: project.imagePath != null
                ? ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    child: Image.asset(
                      project.imagePath!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: project.gradientColors,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        project.icon,
                        size: 80,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                  ),
          ),
          
          // Content
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: project.gradientColors),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        project.icon,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        project.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  project.description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[300],
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: project.tags.map((tag) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: project.gradientColors[0].withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: project.gradientColors[0].withOpacity(0.4),
                        ),
                      ),
                      child: Text(
                        tag,
                        style: TextStyle(
                          fontSize: 12,
                          color: project.gradientColors[0],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectData {
  final String title;
  final String description;
  final IconData icon;
  final List<String> tags;
  final List<Color> gradientColors;
  final String? imagePath; // Add image path

  ProjectData({
    required this.title,
    required this.description,
    required this.icon,
    required this.tags,
    required this.gradientColors,
    this.imagePath, // Optional image path
  });
}