import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:project/signup/success.dart';
import 'package:http/http.dart' as http;

class BusinessHours extends StatefulWidget {
  // Controllers
  final TextEditingController name;
  final TextEditingController email;
  final TextEditingController phone;
  final TextEditingController password;
  final TextEditingController confPass;
  final TextEditingController bizname;
  final TextEditingController biznic;
  final TextEditingController street;
  final TextEditingController city;
  final TextEditingController country;
  final TextEditingController zip;
  final String proof;

  BusinessHours({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.confPass,
    required this.bizname,
    required this.biznic,
    required this.street,
    required this.city,
    required this.country,
    required this.zip,
    required this.proof,
  });

  @override
  State<BusinessHours> createState() => _BusinessHoursState();
}

class _BusinessHoursState extends State<BusinessHours> {
  // List to hold selected time slots
  final List<String> timeSlots = [
    "8:00am - 10:00am",
    "10:00am - 1:00pm",
    "1:00pm - 4:00pm",
    "4:00pm - 7:00pm",
    "7:00pm - 10:00pm",
  ];

  // List to hold selected days
  final List<bool> selectedDays = List.generate(7, (index) => false);

  // List to hold selected time slots for each day
  final List<List<bool>> selectedTimeSlots = List.generate(
    7, // 7 days of the week
    (index) => List.generate(5, (i) => false), // 5 time slots per day
  );

  // Map to hold business hours in the required format
  final Map<String, List<String>> businessHours = {
    "mon": [],
    "tue": [],
    "wed": [],
    "thu": [],
    "fri": [],
    "sat": [],
    "sun": [],
  };

  // Register User function
  Future<void> registerUser(BuildContext context) async {
    saveBusinessHours(); // Save selected hours into `businessHours` map
    Uri url = Uri.parse("https://sowlab.com/assignment/user/register");

    var data = {
      "full_name": widget.name.text,
      "email": widget.email.text,
      "phone": widget.phone.text,
      "password": widget.password.text,
      "role": "farmer",
      "business_name": widget.bizname.text,
      "informal_name": widget.biznic.text,
      "address": widget.street.text,
      "city": widget.city.text,
      "state": widget.country.text,
      "zip_code": widget.zip.text,
      "registration_proof": widget.proof,
      "business_hours": businessHours,
      "social_id": '254',
      "device_token": "qwerty123", // Assuming you have this token
      "type": "email",
    };

    try {
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(data),
      );

      var jsonData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // Check if registration was successful
        if (jsonData["success"] == "true") {
          // Registration succeeded, show success message and navigate
          showAlertDialog(context, jsonData["message"], true);
        } else {
          // Registration failed, show the error message
          showAlertDialog(context, jsonData["message"], false);
        }
      } else {
        // Handle unexpected status codes
        showAlertDialog(
            context, "An unexpected error occurred. Please try again.", false);
      }
    } catch (e) {
      print("Error: $e");
      showAlertDialog(context, "An error occurred: $e", false);
    }
  }

  // Save business hours function
  void saveBusinessHours() {
    for (int i = 0; i < selectedDays.length; i++) {
      if (selectedDays[i]) {
        String dayKey = ["mon", "tue", "wed", "thu", "fri", "sat", "sun"][i];
        businessHours[dayKey] = timeSlots
            .asMap()
            .entries
            .where((entry) => selectedTimeSlots[i][entry.key])
            .map((entry) => entry.value)
            .toList();
      }
    }

    print(businessHours); // For debugging purposes, remove in production
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "FarmerEats",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Sign up 4 of 4",
                style: TextStyle(
                  fontSize: 8,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Business Hours",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Choose the hours your farm is open for pickups. This will allow customers to order deliveries.",
                style: TextStyle(
                  fontSize: 8,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              myDays(),
              const SizedBox(height: 10),
              myTime(),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          // Action for back button
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                      GestureDetector(
                        onTap: () {
                          registerUser(context);
                        },
                        child: Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius:
                                BorderRadius.circular(25), // Rounded corners
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: const Offset(0, 3), // Shadow position
                              ),
                            ],
                            gradient: const LinearGradient(
                              colors: [Colors.amber, Colors.orangeAccent],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          alignment: Alignment
                              .center, // Center text within the container
                          child: const Text(
                            "Continue",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
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
    );
  }

  // Time slot widget
  Column myTime() {
    return Column(
      children: List.generate(selectedDays.length, (dayIndex) {
        return Column(
          children: [
            Text(
              ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"][dayIndex],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Make time slots scrollable
              child: Row(
                children: List.generate(timeSlots.length, (timeIndex) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTimeSlots[dayIndex][timeIndex] =
                            !selectedTimeSlots[dayIndex][timeIndex];
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: selectedTimeSlots[dayIndex][timeIndex]
                            ? Colors.amber
                            : Colors.white,
                        border: Border.all(
                            color: selectedTimeSlots[dayIndex][timeIndex]
                                ? Colors.amber
                                : Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        timeSlots[timeIndex],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: selectedTimeSlots[dayIndex][timeIndex]
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        );
      }),
    );
  }

  // Days of the week widget
  Row myDays() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(selectedDays.length, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedDays[index] = !selectedDays[index];
            });
          },
          child: DayBox(
            day: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"][index],
            isSelected: selectedDays[index],
          ),
        );
      }),
    );
  }
}

// Day Box Widget
class DayBox extends StatelessWidget {
  final String day;
  final bool isSelected;

  const DayBox({
    super.key,
    required this.day,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected ? Colors.green : Colors.white,
        border: Border.all(color: isSelected ? Colors.green : Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        day,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}

// Function to show alert dialog
// Function to show alert dialog
void showAlertDialog(BuildContext context, String message, bool isSuccess) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(isSuccess ? "Success" : "Error"),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
              if (isSuccess) {
                // Navigate to success page if the registration was successful
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Success()),
                );
              }
            },
          ),
        ],
      );
    },
  );
}
