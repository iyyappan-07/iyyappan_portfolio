import 'package:flutter/material.dart';
import 'model/protifolio_model.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  final bool showDemo;
  const ProjectCard({super.key, required this.project, required this.showDemo});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            // ✅ Left Column → Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: 160, // Image width
                height: 120, // Image height
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/placeholder.png',
                  image: project.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),

            // ✅ Right Column → Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1976D2),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    project.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Technologies: ${project.technologies}',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 10),

                  // ✅ Buttons Row
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text('View Code'),
                      ),
                      if (showDemo)
                        TextButton(
                          onPressed: () {},
                          child: const Text('Demo'),
                        ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
