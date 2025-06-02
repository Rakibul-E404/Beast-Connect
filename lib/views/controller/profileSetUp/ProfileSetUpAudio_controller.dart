import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../screens/profileSetUp/ProfileSetUpVideo/ProfileSetUpVideo_ui.dart';

class Song {
  final String title;
  final String artist;
  final String imageUrl; // asset path
  final String audioAssetPath; // asset path

  Song({
    required this.title,
    required this.artist,
    required this.imageUrl,
    required this.audioAssetPath,
  });
}

class ProfileSetUpAudioController extends GetxController {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final RxInt selectedIndex = (-1).obs;

  final List<Song> songs = [
    Song(
      title: 'Electric Feel',
      artist: 'MGMT',
      imageUrl: 'assets/image/music.png',
      audioAssetPath: 'assets/audio/electric_feel.mp3',
    ),
    Song(
      title: 'Sweetener',
      artist: 'Ariana Grande',
      imageUrl: 'assets/image/music.png',
      audioAssetPath: 'assets/audio/sweetener.mp3',
    ),
    Song(
      title: 'Lemonade',
      artist: 'Calum Scott',
      imageUrl: 'assets/image/music.png',
      audioAssetPath: 'assets/audio/lemonade.mp3',
    ),
    Song(
      title: 'Sunset',
      artist: 'Maggie Rogers',
      imageUrl: 'assets/image/music.png',
      audioAssetPath: 'assets/audio/sunset.mp3',
    ),
    Song(
      title: 'Ocean Eyes',
      artist: 'Billie Eilish',
      imageUrl: 'assets/image/music.png',
      audioAssetPath: 'assets/audio/ocean_eyes.mp3',
    ),
    Song(
      title: 'Shape Of You',
      artist: 'Ed Sheeran',
      imageUrl: 'assets/image/music.png',
      audioAssetPath: 'assets/audio/shape_of_you.mp3',
    ),
    Song(
      title: 'Blinding Lights',
      artist: 'The Weeknd',
      imageUrl: 'assets/image/music.png',
      audioAssetPath: 'assets/audio/blinding_lights.mp3',
    ),
  ];

  Future<void> playSong(int index) async {
    if (index < 0 || index >= songs.length) return;

    final song = songs[index];
    try {
      await _audioPlayer.stop();
      await _audioPlayer.play(AssetSource(song.audioAssetPath.replaceFirst('assets/', '')));
      selectedIndex.value = index;
    } catch (e) {
      print('Error playing song: $e');
    }
  }

  Future<void> goToProfileSetUpVideoScreen() async {
    await _audioPlayer.stop();
    Get.to(() => ProfileSetUpVideoUi());
  }

  @override
  void onClose() {
    _audioPlayer.dispose();
    super.onClose();
  }
}


