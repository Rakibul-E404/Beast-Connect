// import 'package:flutter/material.dart';
//
// class MusicSection extends StatelessWidget {
//    MusicSection({super.key});
//
//   // Music Section
//   Widget buildMusicSection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Music',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         const SizedBox(height: 12),
//         // GridView for two music items per row
//         GridView.builder(
//           shrinkWrap: true,
//           physics: NeverScrollableScrollPhysics(), // Disable scrolling inside GridView
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2, // Two items per row
//             crossAxisSpacing: 16, // Horizontal spacing between items
//             mainAxisSpacing: 16, // Vertical spacing between items
//             childAspectRatio: 0.8, // Aspect ratio of each item (controls width/height ratio)
//           ),
//           itemCount: 4, // We have 4 songs in this example
//           itemBuilder: (context, index) {
//             return buildMusicTile(
//               _songData[index]['title']!,
//               _songData[index]['artist']!,
//               _songData[index]['imageUrl']!,
//             );
//           },
//         ),
//       ],
//     );
//   }
//
//   // Helper function to build music tile
//   Widget buildMusicTile(String title, String artist, String imageUrl) {
//     return Column(
//       children: [
//         ClipRRect(
//           borderRadius: BorderRadius.circular(8),
//           child: Image.network(imageUrl, width: 100, height: 100, fit: BoxFit.cover),
//         ),
//         const SizedBox(height: 6),
//         Text(
//           title,
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 14,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         Text(
//           artist,
//           style: TextStyle(
//             color: Colors.white70,
//             fontSize: 12,
//           ),
//         ),
//       ],
//     );
//   }
//
//   final List<Map<String, String>> _songData = [
//     {
//       'title': 'Electric Feel',
//       'artist': 'MGMT',
//       'imageUrl': 'https://images.macrumors.com/t/MKlRm9rIBpfcGnjTpf6ZxgpFTUg=/1600x1200/smart/article-new/2018/05/apple-music-note.jpg',
//     },
//     {
//       'title': 'Sweetener',
//       'artist': 'Ariana Grande',
//       'imageUrl': 'https://live-production.wcms.abc-cdn.net.au/a362273509f7eccdcf362bb73b3b006d?impolicy=wcms_crop_resize&cropH=788&cropW=1400&xPos=0&yPos=0&width=862&height=485',
//     },
//     {
//       'title': 'Sunset',
//       'artist': 'Maggie Rogers',
//       'imageUrl': 'https://live-production.wcms.abc-cdn.net.au/a362273509f7eccdcf362bb73b3b006d?impolicy=wcms_crop_resize&cropH=788&cropW=1400&xPos=0&yPos=0&width=862&height=485',
//     },
//     {
//       'title': 'Lemonade',
//       'artist': 'Calum Scott',
//       'imageUrl': 'https://images.macrumors.com/t/MKlRm9rIBpfcGnjTpf6ZxgpFTUg=/1600x1200/smart/article-new/2018/05/apple-music-note.jpg',
//     },
//
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return buildMusicSection();
//   }
// }



import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicSection extends StatelessWidget {
  MusicSection({super.key});

  // Helper function to build music tile
  Widget buildMusicTile(
      String title, String artist, String imageUrl, String audioAssetPath, BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => _showMusicPopup(context, title, artist, imageUrl, audioAssetPath),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(imageUrl, width: 100, height: 100, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          artist,
          style: TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  // Function to show the music popup
  void _showMusicPopup(BuildContext context, String title, String artist, String imageUrl, String audioAssetPath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(imageUrl, width: 200, height: 200, fit: BoxFit.cover),
              ),
              const SizedBox(height: 16),
              Text(
                artist,
                style: TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 16),
              IconButton(
                icon: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 40,
                ),
                onPressed: () {
                  _playMusic(audioAssetPath);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Function to play the music
  void _playMusic(String audioAssetPath) {
    final AudioPlayer player = AudioPlayer();
    player.play(AssetSource(audioAssetPath));  // Correcting the play function
  }

  // Music data (with audio paths)
  final List<Map<String, String>> _songData = [
    {
      'title': 'Electric Feel',
      'artist': 'MGMT',
      'imageUrl': 'https://images.macrumors.com/t/MKlRm9rIBpfcGnjTpf6ZxgpFTUg=/1600x1200/smart/article-new/2018/05/apple-music-note.jpg',
      'audioAssetPath': 'assets/audio/electric_feel.mp3',
    },
    {
      'title': 'Sweetener',
      'artist': 'Ariana Grande',
      'imageUrl': 'https://live-production.wcms.abc-cdn.net.au/a362273509f7eccdcf362bb73b3b006d?impolicy=wcms_crop_resize&cropH=788&cropW=1400&xPos=0&yPos=0&width=862&height=485',
      'audioAssetPath': 'assets/audio/sweetener.mp3',
    },
    {
      'title': 'Sunset',
      'artist': 'Maggie Rogers',
      'imageUrl': 'https://live-production.wcms.abc-cdn.net.au/a362273509f7eccdcf362bb73b3b006d?impolicy=wcms_crop_resize&cropH=788&cropW=1400&xPos=0&yPos=0&width=862&height=485',
      'audioAssetPath': 'assets/audio/sunset.mp3',
    },
    {
      'title': 'Lemonade',
      'artist': 'Calum Scott',
      'imageUrl': 'https://images.macrumors.com/t/MKlRm9rIBpfcGnjTpf6ZxgpFTUg=/1600x1200/smart/article-new/2018/05/apple-music-note.jpg',
      'audioAssetPath': 'assets/audio/lemonade.mp3',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Music',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        // GridView for two music items per row
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(), // Disable scrolling inside GridView
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two items per row
            crossAxisSpacing: 16, // Horizontal spacing between items
            mainAxisSpacing: 16, // Vertical spacing between items
            childAspectRatio: 0.8, // Aspect ratio of each item (controls width/height ratio)
          ),
          itemCount: 4, // We have 4 songs in this example
          itemBuilder: (context, index) {
            return buildMusicTile(
              _songData[index]['title']!,
              _songData[index]['artist']!,
              _songData[index]['imageUrl']!,
              _songData[index]['audioAssetPath']!,
              context,
            );
          },
        ),
      ],
    );
  }
}
