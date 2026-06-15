import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SongsScreen extends StatelessWidget {
  final String mood;

  SongsScreen({required this.mood});

  final Map<String, List<Map<String, String>>> songs = {
    "Happy": [
      {
        "title": "Happy ",
        "url": "https://www.youtube.com/watch?v=oLgzs8nut3A",
        "image": "https://www.tamil2lyrics.com/wp-content/uploads/2018/12/petta-ullaallaa.jpg"
      },
      {
        "title": "joy",
        "url": "https://www.youtube.com/watch?v=gSp-4Nrzkbw",
        "image": "https://pbs.twimg.com/media/FYWsW6BaUAAzDbo.jpg"
      }
    ],
    "Sad": [
      {
        "title": "sorrow",
        "url": "https://www.youtube.com/watch?v=5yjy7djTUDc",
        "image": "https://tamillyrics143.com/wp-content/uploads/2021/02/Ava-Enna-Enna-Song-Lyrics.jpg"
      }
    ],
    "Relax": [
      {
        "title": "Relaxing ",
        "url": "https://www.youtube.com/watch?v=6LD30ChPsSs",
        "image": "https://i.pinimg.com/564x/35/1f/8c/351f8c36be63028b281349cc93616c21.jpg"
      }
    ],
    "Angry": [
      {
        "title": "Stronger",
        "url": "https://www.youtube.com/watch?v=MISaKqu8rbg",
        "image": "https://upload.wikimedia.org/wikipedia/en/7/75/Leo_%282023_Indian_film%29.jpg"
      }
    ],
  };

  void openSong(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      print("Could not launch $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    final moodSongs = songs[mood] ?? [];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("$mood Songs 🎵"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: moodSongs.length,
        itemBuilder: (context, index) {
          final song = moodSongs[index];

          return GestureDetector(
            onTap: () => openSong(song["url"]!),
            child: Container(
              margin: EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(2, 2),
                  )
                ],
              ),
              child: Row(
                children: [
                  // Thumbnail
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      song["image"]!,
                      width: 100,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),

                  SizedBox(width: 10),

                  // Title
                  Expanded(
                    child: Text(
                      song["title"]!,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  // Play icon
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.play_circle_fill,
                      color: Colors.deepPurple,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}