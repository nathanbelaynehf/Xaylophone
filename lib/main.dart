import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  final List<AudioPlayer> players = List.generate(7, (_) => AudioPlayer());

  Future<void> playSound(int soundNumber) async {
    try {
      await players[soundNumber - 1].setAsset('assets/note$soundNumber.wav');
      players[soundNumber - 1].play();
    } catch (e) {
      print("Error playing sound: $e");
    }
  }

  Expanded buildkey(Color color, int soundNumber) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color, // Set your desired color here
          padding: EdgeInsets.all(16.0),
          minimumSize: Size(double.infinity, 0), // Optional: Add padding
        ),
        onPressed: () async {
          playSound(soundNumber);
        },
        child: Text(''),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 16.0),
                buildkey(Colors.red, 1),
                SizedBox(height: 16.0),
                buildkey(Colors.orange, 2),
                SizedBox(height: 16.0),
                buildkey(Colors.yellow, 3),
                SizedBox(height: 16.0),
                buildkey(Colors.green, 4),
                SizedBox(height: 16.0),
                buildkey(Colors.teal, 5),
                SizedBox(height: 16.0),
                buildkey(Colors.blue, 6),
                SizedBox(height: 16.0),
                buildkey(Colors.purple, 7),
                SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
