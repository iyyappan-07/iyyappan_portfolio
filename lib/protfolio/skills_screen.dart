import 'package:flutter/material.dart';

class SkillsCard extends StatelessWidget {
  const SkillsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: const Color(0xFF26A69A),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Skills',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18)),
            SizedBox(height: 8),
            Text('Flutter, Dart', style: TextStyle(color: Colors.white)),
            Text('Firebase, REST API', style: TextStyle(color: Colors.white)),
            Text('Provider, Riverpod, Bloc', style: TextStyle(color: Colors.white)),
            Text('SQLite, MySQL', style: TextStyle(color: Colors.white)),
            Text('Android Studio, VS Code', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
