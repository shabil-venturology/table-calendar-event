import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class MyHomePageMusic extends StatefulWidget {
  const MyHomePageMusic({super.key});

  @override
  State<MyHomePageMusic> createState() => _MyHomePageMusicState();
}

class _MyHomePageMusicState extends State<MyHomePageMusic> {
  /// Initial Vairable
  final player1 = AudioPlayer();
  String urlPlayer1 =
      'https://storage.googleapis.com/venturo-server/QOIN/PUSAKA/bab-1-sloka.wav';
  final player2 = AudioPlayer();
  String urlPlayer2 =
      'https://storage.googleapis.com/venturo-server/QOIN/PUSAKA/bab-1-sloka-2.wav';

  /// Play Sound Setup
  Future playSound1() async {
    await player1.setAudioSource(AudioSource.uri(Uri.parse(urlPlayer1)));
    await player1.play();
  }

  Future playSound2() async {
    await player2.setAudioSource(AudioSource.uri(Uri.parse(urlPlayer1)));
    await player2.play();
  }

  /// Pause Sound Setup
  Future pause1() async {
    await player1.stop();
  }

  Future pause2() async {
    await player2.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Just Audio Example"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 10),

          /// View sound 1
          const Text("Music 1, Pusaka"),
          const SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: playSound1,
                icon: const Icon(Icons.play_circle),
              ),
              IconButton(
                onPressed: pause1,
                icon: const Icon(Icons.stop_circle),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),

          /// View sound 2
          const Text("Music 2, Pusaka"),
          const SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: playSound2,
                icon: const Icon(Icons.play_circle),
              ),
              IconButton(
                onPressed: pause2,
                icon: const Icon(Icons.stop_circle),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
