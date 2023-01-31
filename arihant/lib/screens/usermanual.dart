import 'package:flutter/material.dart';

class usermanual extends StatelessWidget {
  const usermanual({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Manual"),
        backgroundColor: const Color.fromRGBO(36, 59, 85, 1),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
            // width: width,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 1.5,
              color: Colors.blue[50],
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    // ignore: prefer_const_constructors
                    Center(
                      child: const Text(
                        "How to Add Collection",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromRGBO(36, 59, 85, 1),
                        ),
                      ),
                    ),
                    // ignore: prefer_const_constructors
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      // ignore: prefer_const_constructors
                      child: Text(
                        "1. Select Account Number from List.",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    // ignore: prefer_const_constructors
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      // ignore: prefer_const_constructors
                      child: Text(
                        "2. Add Collection Amount also Check weather it is not lesser than Initial Amount.",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    // ignore: prefer_const_constructors
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      // ignore: prefer_const_constructors
                      child: Text(
                        "3. Press Collect Button.",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "[If you want to add Penalty then just tap on Penalty button which is mentioned as a Red Colour.]",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
            // width: width,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 1.5,
              color: Colors.blue[50],
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    // ignore: prefer_const_constructors
                    Center(
                      child: const Text(
                        "How to Create a New Client",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromRGBO(36, 59, 85, 1),
                        ),
                      ),
                    ),
                    // ignore: prefer_const_constructors
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      // ignore: prefer_const_constructors
                      child: Text(
                        "[This Feature is only for new Client who is not yet Registered.]",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    // ignore: prefer_const_constructors
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      // ignore: prefer_const_constructors
                      child: Text(
                        "1. Fill the All Value which is Required.",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    // ignore: prefer_const_constructors
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      // ignore: prefer_const_constructors
                      child: Text(
                        "2. Check weather Amount is not Less than Initial Amount",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "3. Press Submit Button.",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
            // width: width,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 1.5,
              color: Colors.blue[50],
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    // ignore: prefer_const_constructors
                    Center(
                      child: const Text(
                        "How to Add New Account",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromRGBO(36, 59, 85, 1),
                        ),
                      ),
                    ),
                    // ignore: prefer_const_constructors
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      // ignore: prefer_const_constructors
                      child: Text(
                        "[This features is Avalible only for those Client who have already Created a Account earlier and have a Client Id]",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    // ignore: prefer_const_constructors
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      // ignore: prefer_const_constructors
                      child: Text(
                        "1. Select a Client Id from List.[Make sure which Client Id is selected]",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    // ignore: prefer_const_constructors
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      // ignore: prefer_const_constructors
                      child: Text(
                        "2. Fill the all Required values for new Account.",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "3. Submit the Button.",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "[Before Creation of New Account consider the Penalty of Client]",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
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
