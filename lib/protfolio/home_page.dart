import 'package:flutter/material.dart';
import 'package:iyyappan_portfolio/protfolio/screens/animated_widget.dart';
import 'package:iyyappan_portfolio/protfolio/screens/data_screen.dart';
import 'package:iyyappan_portfolio/protfolio/section_screen.dart';
import 'package:iyyappan_portfolio/protfolio/skills_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'card_widget.dart';
import 'info_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Animated Gradient Background
        const AnimatedBackground(),

        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text('Iyyappan M • Flutter Developer', style: TextStyle(color: Colors.white),),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // HEADER
                AnimatedSlideFade(
                  delay: const Duration(milliseconds: 200),
                  child: Card(
                    color: Colors.white.withOpacity(0.9),
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('IYYAPPAN M',
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF1976D2))),
                                const SizedBox(height: 6),
                                Text('Flutter Developer • 2.5 years experience',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[800])),
                                const SizedBox(height: 12),
                                Wrap(
                                  spacing: 12,
                                  runSpacing: 8,
                                  children: [
                                    _iconLink(Icons.email,
                                        'mailto:iyyappanjayasri456@gmail.com'),
                                    _iconLink(Icons.phone, 'tel:+917339191575'),
                                    _iconLink(Icons.code,
                                        'https://github.com/iyyappan-07'),
                                    _iconLink(Icons.business,
                                        'https://www.linkedin.com/in/iyyappan-m-907283248/'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          const Expanded(flex: 1, child: SkillsCard()),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),
                const SectionTitle(title: 'About Me'),
                const Text(
                  'Motivated and results-driven Flutter Developer with 2.5 years of experience designing, developing, and deploying high-performance mobile applications.', style: TextStyle(color: Colors.white),
                ),

                const SizedBox(height: 30),
                const SectionTitle(title: 'Projects'),
                ...projects.asMap().entries.map((entry) {
                  final index = entry.key;
                  final project = entry.value;
                  return AnimatedSlideFade(
                    delay: Duration(milliseconds: 200 * index),
                    child: ProjectCard(
                      project: project,
                      showDemo: false, // Hide Demo button
                    ),
                  );
                }),

                const SizedBox(height: 30),
                const SectionTitle(title: 'Education'),
                const InfoCard(
                  icon: Icons.school,
                  title: 'BBA, Muthurangam Government Arts and Science College',
                  subtitle: '2019-2022 • 74%',
                ),

                const SizedBox(height: 20),
                const SectionTitle(title: 'Certifications'),
                const InfoCard(
                  icon: Icons.workspace_premium,
                  title: 'Frontend Developer – Fita Academy',
                  subtitle: '07/2022 – 12/2022',
                ),

                const SizedBox(height: 30),
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () => launchUrl(Uri.parse(
                        'mailto:iyyappanjayasri456@gmail.com')),
                    icon: const Icon(Icons.mail, color: Colors.white),
                    label: const Text('Contact Me',
                        style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1976D2),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),

              ],
            ),
          ),
        ),
      ],
    );
  }

  static Widget _iconLink(IconData icon, String url) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(url)),
      child: CircleAvatar(
        radius: 18,
        backgroundColor: const Color(0xFF1976D2),
        child: Icon(icon, size: 18, color: Colors.white),
      ),
    );
  }
}

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
    AnimationController(vsync: this, duration: const Duration(seconds: 6))
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFF0F2027), // Deep navy
                const Color(0xFF203A43), // Dark teal-blue
                const Color(0xFF2C5364), // Cool cyan blend
              ],



              stops: [
                0.2 + (_controller.value * 0.1),
                0.5,
                0.8 - (_controller.value * 0.1)
              ],
            ),
          ),
        );
      },
    );
  }
}
