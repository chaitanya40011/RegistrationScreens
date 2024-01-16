import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  final String mobileNumber;
  final String name;
  final String email;
  final String pin;

  const SuccessScreen({
    super.key,
    required this.mobileNumber,
    required this.name,
    required this.email,
    required this.pin,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Success',
                style: TextStyle(
                    fontSize: 40.0,
                    fontFamily: 'Lato',
                    color: Colors.blueGrey)),
            const SizedBox(height: 50.0),
            Text('Mobile Number: $mobileNumber',
                style: const TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Lato',
                    color: Colors.blueGrey)),
            const SizedBox(height: 10.0),
            Text('Name: $name',
                style: const TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Lato',
                    color: Colors.blueGrey)),
            const SizedBox(height: 10.0),
            Text('Email: $email',
                style: const TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Lato',
                    color: Colors.blueGrey)),
            const SizedBox(height: 10.0),
            Text('PIN: $pin',
                style: const TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Lato',
                    color: Colors.blueGrey)),
          ],
        ),
      ),
    );
  }
}
