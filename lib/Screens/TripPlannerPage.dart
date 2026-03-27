import 'package:flutter/material.dart';
import 'PaymentPage.dart';

class TripPlannerPage extends StatefulWidget {
  final String location;
  final String days;

  const TripPlannerPage({required this.location, required this.days});

  @override
  State<TripPlannerPage> createState() => _TripPlannerPageState();
}

class _TripPlannerPageState extends State<TripPlannerPage> {
  List<String> activities = [];

  void addActivity() {
    TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add Activity"),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: "Enter activity"),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  setState(() {
                    activities.add(controller.text);
                  });
                }
                Navigator.pop(context);
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    int totalDays = int.tryParse(widget.days) ?? 1;

    return Scaffold(
      body: Stack(
        children: [
          // 🌄 Background Image
          SizedBox.expand(
            child: Image.asset('assets/travel.jpg', fit: BoxFit.cover),
          ),

          // 🌫 Overlay
          Container(color: Colors.black.withOpacity(0.4)),

          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ✈️ Title
                  Text(
                    "Your Trip Plan ✈️",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 5),

                  Text(
                    widget.location,
                    style: TextStyle(fontSize: 20, color: Colors.white70),
                  ),

                  SizedBox(height: 20),

                  // 📅 DAY-WISE PLAN
                  Text(
                    "Day-wise Plan",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 10),

                  Column(
                    children: List.generate(totalDays, (index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          leading: Icon(Icons.calendar_today),
                          title: Text("Day ${index + 1}"),
                          subtitle: Text("Plan your activities"),
                        ),
                      );
                    }),
                  ),

                  SizedBox(height: 20),

                  // 🌍 Nearby Places
                  Text(
                    "Nearby Places",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 10),

                  Wrap(
                    spacing: 10,
                    children: [
                      Chip(label: Text("Beach")),
                      Chip(label: Text("Museum")),
                      Chip(label: Text("Cafe")),
                      Chip(label: Text("Park")),
                      Chip(label: Text("Shopping")),
                    ],
                  ),

                  SizedBox(height: 20),

                  // ➕ Activities
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Your Activities",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: addActivity,
                        icon: Icon(Icons.add, color: Colors.white),
                      ),
                    ],
                  ),

                  Column(
                    children: activities.map((activity) {
                      return ListTile(
                        leading: Icon(Icons.check_circle, color: Colors.white),
                        title: Text(
                          activity,
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }).toList(),
                  ),

                  SizedBox(height: 20),

                  // 💰 Budget Section
                  Text(
                    "Estimated Budget",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 10),

                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Text("Stay: ₹5000"),
                          Text("Food: ₹2000"),
                          Text("Travel: ₹3000"),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  // ❤️ Save & Share
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("Save"),
                        ),
                      ),

                      SizedBox(width: 10),

                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("Share"),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  // 💳 PAYMENT BUTTON
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PaymentPage(location: widget.location),
                          ),
                        );
                      },
                      child: Text("Proceed to Payment 💳"),
                    ),
                  ),

                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
