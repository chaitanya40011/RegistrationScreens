import 'package:assignment_4/src/views/register_screen.dart';
import 'package:flutter/material.dart';

class NumberScreen extends StatefulWidget {
  const NumberScreen({Key? key}) : super(key: key);

  @override
  State<NumberScreen> createState() => NumberScreenState();
}

class NumberScreenState extends State<NumberScreen> {
  TextEditingController mobileController = TextEditingController();
  String mobileNumber = ''; // Added line

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xffe8e8ef),
        padding: const EdgeInsets.only(top: 100.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30.0),
            const CircleAvatar(
              backgroundColor: Color(0xffb095d5),
              radius: 50.0,
              backgroundImage: NetworkImage('http://i.imgur.com/QSev0hg.jpg'),
            ),
            const SizedBox(height: 30.0),
            const Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Registration',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Lato',
                        color: Colors.blueGrey),
                    maxLines: 2,
                  ),
                ),
                SizedBox(height: 30.0),
                SizedBox(
                  width: 220,
                  child: Text(
                    'Enter your mobile number, we will send you OTP to verify later',
                    style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: 'Lato',
                        color: Colors.blueGrey),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.0),
            Container(
              width: 260, // Set your desired width
              child: TextField(
                controller: mobileController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: Colors.blueGrey),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              width: 260,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (mobileController.text.length == 10) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            RegisterScreen(mobileNumber: mobileController.text),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Mobile Number shall be of 10 digits'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
                child: const Text('Continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
