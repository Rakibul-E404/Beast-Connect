import 'package:beast_connect/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AudioFileSelectedScreen extends StatefulWidget {
  const AudioFileSelectedScreen({Key? key}) : super(key: key);

  @override
  State<AudioFileSelectedScreen> createState() => _AudioFileSelectedScreenState();
}

class _AudioFileSelectedScreenState extends State<AudioFileSelectedScreen> {
  int selectedSong = 0; // Index of the selected song

  final List<SongModel> songs = [
    SongModel(
      title: "Electric Feel",
      artist: "MGMT",
      imageUrl: "https://upload.wikimedia.org/wikipedia/en/7/7f/MGMT_-_Oracular_Spectacular.png",
    ),
    SongModel(
      title: "Sweetener",
      artist: "By Ariana Grande",
      imageUrl: "https://upload.wikimedia.org/wikipedia/en/a/a0/Ariana_Grande_-_Sweetener.png",
    ),
    SongModel(
      title: "Lemonade",
      artist: "Callum Scott",
      imageUrl: "https://images-na.ssl-images-amazon.com/images/I/81mZROD8g1L._SL1500_.jpg",
    ),
    SongModel(
      title: "Sunset",
      artist: "Maggie Rogers",
      imageUrl: "https://images.unsplash.com/photo-1506744038136-46273834b3fb",
    ),
    SongModel(
      title: "Ocean Eyes",
      artist: "Billie Eilish",
      imageUrl: "https://upload.wikimedia.org/wikipedia/en/f/f4/Billie_Eilish_-_Ocean_Eyes.png",
    ),
    SongModel(
      title: "Shape Of You",
      artist: "Ed Sheeran",
      imageUrl: "https://upload.wikimedia.org/wikipedia/en/4/45/Divide_cover.png",
    ),
    SongModel(
      title: "Blinding Lights",
      artist: "The Weeknd",
      imageUrl: "https://upload.wikimedia.org/wikipedia/en/0/09/The_Weeknd_-_After_Hours.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Match black background of image
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(right: 32),
          child: Text(
            'Song list',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: ListView.separated(
        itemCount: songs.length,
        separatorBuilder: (_, __) => SizedBox(height: 6),
        itemBuilder: (context, index) {
          final song = songs[index];
          return ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                song.imageUrl,
                width: 54,
                height: 54,
                fit: BoxFit.cover,
                errorBuilder: (context, _, __) => Container(
                  color: Colors.grey[700],
                  width: 54,
                  height: 54,
                  child: Icon(Icons.music_note, color: Colors.white70),
                ),
              ),
            ),
            title: Text(
              song.title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            subtitle: Text(
              song.artist,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 13,
              ),
            ),
            trailing: Radio<int>(
              value: index,
              groupValue: selectedSong,
              activeColor: AppColors.primaryColor,
              onChanged: (int? value) {
                setState(() {
                  selectedSong = value!;
                });
              },
            ),
            onTap: () {
              setState(() {
                selectedSong = index;
              });
            },
          );
        },
      ),
    );
  }
}

class SongModel {
  final String title;
  final String artist;
  final String imageUrl;

  SongModel({
    required this.title,
    required this.artist,
    required this.imageUrl,
  });
}
