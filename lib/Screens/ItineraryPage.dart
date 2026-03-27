import 'package:flutter/material.dart';
import 'TripSummaryPage.dart';

class ItineraryPage extends StatefulWidget {
  @override
  State<ItineraryPage> createState() => _ItineraryPageState();
}

class _ItineraryPageState extends State<ItineraryPage> {
  DateTime? selectedDate;

  final TextEditingController peopleController = TextEditingController();
  final TextEditingController daysController = TextEditingController();
  final TextEditingController placeController = TextEditingController();

  String selectedLocation = "";

  // 🌍 Locations list
  final List<String> locations = [
    "India",
    "Bangalore",
    "Mumbai",
    "Delhi",
    "Paris",
    "France",
    "New York",
    "USA",
    "Tokyo",
    "Japan",
    "Dubai",
    "London",
    "Singapore",
    "Maldives",
  ];

  // 📅 Date Picker
  Future<void> pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🌄 Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/travel.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 🌫 Light overlay
          IgnorePointer(child: Container(color: Colors.white.withOpacity(0.2))),

          // 🧾 Content
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  // 🔍 SEARCH BAR
                  Autocomplete<String>(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text == '') {
                        return const Iterable<String>.empty();
                      }
                      return locations.where(
                        (option) => option.toLowerCase().contains(
                          textEditingValue.text.toLowerCase(),
                        ),
                      );
                    },
                    onSelected: (String selection) {
                      selectedLocation = selection;
                    },
                    fieldViewBuilder:
                        (context, controller, focusNode, onEditingComplete) {
                          return TextField(
                            controller: controller,
                            focusNode: focusNode,
                            decoration: InputDecoration(
                              hintText: "Search City / Country",
                              prefixIcon: Icon(Icons.search),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.9),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          );
                        },
                  ),

                  SizedBox(height: 20),

                  // 🧾 FORM CARD
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(25),
                    ),

                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Title
                        Text(
                          "Plan Your Trip ✈️",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 20),

                        // 📅 Date
                        ListTile(
                          leading: Icon(Icons.calendar_today),
                          title: Text(
                            selectedDate == null
                                ? "Select Travel Date"
                                : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                          ),
                          trailing: Icon(Icons.arrow_forward),
                          onTap: pickDate,
                        ),

                        SizedBox(height: 10),

                        // 👥 People
                        TextField(
                          controller: peopleController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.people),
                            labelText: "Number of People",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),

                        SizedBox(height: 15),

                        // 🗓️ Days
                        TextField(
                          controller: daysController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.calendar_view_day),
                            labelText: "Number of Days",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),

                        SizedBox(height: 15),

                        // 📍 Favorite Place
                        TextField(
                          controller: placeController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.location_on),
                            labelText: "Favorite Place",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),

                        SizedBox(height: 25),

                        // 🚀 Create Itinerary Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TripSummaryPage(
                                    location: selectedLocation,
                                    date: selectedDate == null
                                        ? "Not selected"
                                        : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                                    people: peopleController.text,
                                    days: daysController.text,
                                    place: placeController.text,
                                  ),
                                ),
                              );
                            },
                            child: Text("Create Itinerary"),
                          ),
                        ),

                        SizedBox(height: 15),

                        // ➡️ Arrow Button
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TripSummaryPage(
                                    location: selectedLocation,
                                    date: selectedDate == null
                                        ? "Not selected"
                                        : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                                    people: peopleController.text,
                                    days: daysController.text,
                                    place: placeController.text,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
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
