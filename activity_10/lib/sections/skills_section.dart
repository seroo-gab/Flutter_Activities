import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
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
                'Technical Skills',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Technologies I\'m confident with',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[400],
                ),
              ),
              
              const SizedBox(height: 40),
              
              // Programming Languages
              _buildSkillCategory(
                'Programming Languages',
                Icons.code,
                [
                  SkillData('C++', 90),
                  SkillData('C', 85),
                  SkillData('Java', 80),
                  SkillData('C#', 75),
                  SkillData('HTML', 90),
                  SkillData('CSS', 85),
                ],
                [Colors.blue[400]!, Colors.cyan[400]!],
              ),
              
              const SizedBox(height: 24),
              
              // Hardware & IoT
              _buildSkillCategory(
                'Hardware & IoT',
                Icons.settings,
                [
                  SkillData('Arduino Prototyping', 95),
                ],
                [Colors.green[400]!, Colors.teal[400]!],
              ),
              
              const SizedBox(height: 24),
              
              // Design Tools
              _buildSkillCategory(
                'Design Tools',
                Icons.palette,
                [
                  SkillData('UX/UI', 80),
                  SkillData('Figma', 85),
                  SkillData('Photoshop', 75),
                ],
                [Colors.orange[400]!, Colors.amber[400]!],
              ),
              
              const SizedBox(height: 40),
              
              // Stats
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStat('10+', 'Skills'),
                  _buildStat('3+', 'Projects'),
                  _buildStat('4th', 'Year'),
                ],
              ),
              
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkillCategory(
    String title,
    IconData icon,
    List<SkillData> skills,
    List<Color> gradientColors,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: gradientColors[0].withOpacity(0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: gradientColors),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: Colors.white, size: 24),
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ...skills.map((skill) => _buildSkillBar(skill, gradientColors)),
        ],
      ),
    );
  }

  Widget _buildSkillBar(SkillData skill, List<Color> gradientColors) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                skill.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              Text(
                '${skill.level}%',
                style: TextStyle(
                  color: gradientColors[0],
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: skill.level / 100,
              backgroundColor: Colors.white.withOpacity(0.1),
              valueColor: AlwaysStoppedAnimation<Color>(gradientColors[0]),
              minHeight: 8,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF32B8C6),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[400],
          ),
        ),
      ],
    );
  }
}

class SkillData {
  final String name;
  final int level;

  SkillData(this.name, this.level);
}
