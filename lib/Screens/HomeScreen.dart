import 'package:flutter/material.dart';
import 'SignupPage.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🌄 FULL SCREEN IMAGE (NO BLANK SPACE)
          SizedBox.expand(
            child: Image.asset(
              'assets/travel.jpg',
              fit: BoxFit.cover, // ✅ fills entire screen
              alignment: Alignment.topCenter, // 🔥 adjust focus
            ),
          ),

          // 🌫 Gradient overlay for readability
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),

          // 🧾 CONTENT
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),

              child: Column(
                children: [
                  Spacer(),

                  // 🔥 WELCOME TEXT
                  Text(
                    "WELCOME",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 4,
                    ),
                  ),

                  SizedBox(height: 15),

                  // ✨ QUOTE
                  Text(
                    "Your adventure is one tap away",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, color: Colors.white70),
                  ),

                  Spacer(),

                  // 🔵 BUTTON
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupPage()),
                      );
                    },
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            blurRadius: 12,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ),

                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
