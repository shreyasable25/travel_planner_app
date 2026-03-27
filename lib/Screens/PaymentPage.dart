import 'package:flutter/material.dart';
import 'HomeScreen.dart';

class PaymentPage extends StatefulWidget {
  final String location;

  const PaymentPage({required this.location});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isPaid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🌄 Background
          SizedBox.expand(
            child: Image.asset('assets/travel.jpg', fit: BoxFit.cover),
          ),

          Container(color: Colors.black.withOpacity(0.5)),

          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 🔥 TITLE
                    Text(
                      isPaid ? "Trip Confirmed" : "Confirm Your Trip",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(height: 15),

                    Text(
                      widget.location,
                      style: TextStyle(fontSize: 18, color: Colors.white70),
                    ),

                    SizedBox(height: 40),

                    // 💳 PAYMENT BOX (SQUARE CENTERED)
                    if (!isPaid)
                      Container(
                        width: 220,
                        height: 220,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Total Amount",
                              style: TextStyle(fontSize: 16),
                            ),

                            SizedBox(height: 10),

                            Text(
                              "₹10,000",
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 20),

                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  isPaid = true;
                                });
                              },
                              child: Text("Pay Now"),
                            ),
                          ],
                        ),
                      ),

                    // ✅ SUCCESS UI
                    if (isPaid)
                      Column(
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 70,
                          ),

                          SizedBox(height: 20),

                          Text(
                            "Your booking is successfully completed.",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),

                          SizedBox(height: 10),

                          Text(
                            "Further details will be sent to your registered email.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white70,
                            ),
                          ),

                          SizedBox(height: 30),

                          // 🚪 EXIT BUTTON
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              padding: EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 15,
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ),
                                (route) => false,
                              );
                            },
                            child: Text("Finish & Exit"),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
