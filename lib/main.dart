import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';



void main() => runApp( MaterialApp(
  home: const MyMusic(),
  theme: ThemeData(primaryColor: Colors.orange),
));

class MyMusic extends StatefulWidget {
  const MyMusic({Key? key}) : super(key: key);

  @override
  State<MyMusic> createState() => _MyMusicState();
}

class _MyMusicState extends State<MyMusic> {
  AudioPlayer _audioPlayer = AudioPlayer();
  AudioPlayerState _audioPlayerState = AudioPlayerState.STOPPED;

  String _audioUrl = 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3';

  @override
  void initState() {
    super.initState();
    _audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        _audioPlayerState = state;
      });
    });
  }
  Future<void> _play() async {
    await _audioPlayer.play(UrlSource(_audioUrl));
  }

  Future<void> _pause() async {
    await _audioPlayer.pause();
  }

  Future<void> _stop() async {
    await _audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.orange,
        title: const Text('My Music Player',
        style: TextStyle(
          letterSpacing: 2.0,
        ),),
          centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(padding: EdgeInsets.all(44.0)),
                ElevatedButton(
                    onPressed: _play,
                    child: const Text('Play')
                ),

                const SizedBox(width: 16),

                ElevatedButton(
                    onPressed: _pause,
                    child: const Text('Pause')
                ),

                const SizedBox(width: 16),

                ElevatedButton(
                    onPressed: _stop,
                    child: const Text('Stop')
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
