import 'package:assignment_4/src/views/success_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  final String mobileNumber;

  const RegisterScreen({Key? key, required this.mobileNumber})
      : super(key: key);

  @override
  State<RegisterScreen> createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _pin = TextEditingController();
  TextEditingController _confpin = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _emailid = TextEditingController();

  bool validateEmail(String value) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    return emailValid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xffe8e8ef),
        padding: const EdgeInsets.only(top: 70.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('PIN',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontFamily: 'Lato',
                          color: Colors.blueGrey)),
                  const SizedBox(height: 20.0),
                  const Text("Enter Personal Details",
                      style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          color: Colors.blueGrey)),
                  const SizedBox(height: 20.0),
                  Container(
                    width: 260,
                    height: 50,
                    child: TextFormField(
                      controller: _name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Name";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(color: Colors.blueGrey),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 260,
                    height: 50,
                    child: TextFormField(
                      controller: _emailid,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Email ID";
                        } else if (!validateEmail(value)) {
                          return "Invalid Email ID";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(color: Colors.blueGrey),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 260,
                    height: 50,
                    child: TextFormField(
                      obscureText: true,
                      controller: _pin,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter PIN";
                        } else if (value.length != 4) {
                          return "PIN should be of 4 digit";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "PIN",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(color: Colors.blueGrey),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 260,
                    height: 50,
                    child: TextFormField(
                      controller: _confpin,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Confirm PIN";
                        } else if (value != _pin.text) {
                          return "PINs do not match";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Confirm PIN",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(color: Colors.blueGrey),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 260, // Set your desired width
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Successful Registration')),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SuccessScreen(
                                  mobileNumber: widget.mobileNumber,
                                  name: _name.text,
                                  email: _emailid.text,
                                  pin: _pin.text,
                                ),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Fill in all fields'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          }
                        },
                        child: const Text('Continue'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
