import 'package:flutter/material.dart';
import 'songs_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> moods = [
    {"name": "Happy", "emoji": "😊", "color": Colors.yellow},
    {"name": "Sad", "emoji": "😢", "color": Colors.blue},
    {"name": "Angry", "emoji": "😡", "color": Colors.red},
    {"name": "Relax", "emoji": "😌", "color": Colors.green},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("🎵 Mood Music"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),

          // Title
          Text(
            "How are you feeling today?",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 20),

          // Grid
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemCount: moods.length,
              itemBuilder: (context, index) {
                final mood = moods[index];

                return InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SongsScreen(mood: mood["name"]),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: mood["color"].withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          offset: Offset(2, 2),
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          mood["emoji"],
                          style: TextStyle(fontSize: 45),
                        ),
                        SizedBox(height: 10),
                        Text(
                          mood["name"],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}