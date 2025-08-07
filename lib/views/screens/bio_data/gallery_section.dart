import 'package:flutter/material.dart';

class GallerySection extends StatelessWidget {
  const GallerySection({super.key});

  // Gallery Section
  Widget buildGallerySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gallery photo',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12,),
        Row(
          children: [
            buildGalleryImage('https://tenfoldsmedia.com/wp-content/uploads/2023/02/OMS-Photo-lifestyle-photography-Mat-Witherspoon-010.jpg'),
                const SizedBox(width: 8,),

            buildGalleryImage('https://tenfoldsmedia.com/wp-content/uploads/2023/02/OMS-Photo-lifestyle-photography-Mat-Witherspoon-010.jpg'),
          ],
        ),
        const SizedBox(height: 8,),
        Row(
          children: [
            buildGalleryImage('https://images.squarespace-cdn.com/content/v1/6182eea76b4e961f6d1ad7f1/09109ef9-f43b-4cba-8d9c-cb89ca800d0a/lifestyle+family+photography.jpg'),
            const SizedBox(width: 8,),
            buildGalleryImage('https://images.squarespace-cdn.com/content/v1/6182eea76b4e961f6d1ad7f1/09109ef9-f43b-4cba-8d9c-cb89ca800d0a/lifestyle+family+photography.jpg'),
          ],
        ),
      ],
    );
  }

  // Helper function to build gallery image
  Widget buildGalleryImage(String imageUrl) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          imageUrl,
          width: 120,
          height: 120,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildGallerySection();
  }
}
