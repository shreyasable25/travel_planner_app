import 'package:flutter/material.dart';
import 'TripPlannerPage.dart';

class TripSummaryPage extends StatelessWidget {
  final String location;
  final String date;
  final String people;
  final String days;
  final String place;

  const TripSummaryPage({
    required this.location,
    required this.date,
    required this.people,
    required this.days,
    required this.place,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🌄 Background Image
          SizedBox.expand(
            child: Image.asset('assets/travel.jpg', fit: BoxFit.cover),
          ),

          // 🌫 Overlay
          Container(color: Colors.black.withOpacity(0.3)),

          // 🧾 Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 🔥 HERO TEXT
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Text(
                        "Your next adventure starts right here",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  // 📋 DETAILS CARD
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("🌍 Location: $location"),
                          SizedBox(height: 8),

                          Text("📅 Date: $date"),
                          SizedBox(height: 8),

                          Text("👥 People: $people"),
                          SizedBox(height: 8),

                          Text("🗓️ Days: $days"),

                          SizedBox(height: 20),

                          // 📍 Favourite Places
                          Text(
                            "Favourite Places:",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 10),

                          Text("• $place"),
                          SizedBox(height: 5),
                          Text("• Add more places..."),
                          SizedBox(height: 5),
                          Text("• Explore nearby attractions"),

                          Spacer(),

                          // ➡️ NEXT BUTTON
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TripPlannerPage(
                                      location: location,
                                      days: days,
                                    ),
                                  ),
                                );
                              },
                              child: Text("Plan Details ➡️"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
