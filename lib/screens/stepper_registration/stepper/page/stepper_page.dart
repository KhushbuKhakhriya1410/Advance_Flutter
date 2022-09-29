import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'modal_class.dart';
import 'package:outcaster/utils/colors.dart';
import 'package:outcaster/utils/strings.dart';
import 'package:outcaster/utils/textstyle.dart';
import 'package:outcaster/routes/routesstring.dart';

class StepperScreen extends StatefulWidget {
  const StepperScreen({Key? key}) : super(key: key);

  @override
  State<StepperScreen> createState() => _StepperScreenState();
}

class _StepperScreenState extends State<StepperScreen> {
  final ImagePicker picker = ImagePicker();
  int initialStepValue = 0;
  File? imgFile;
  String selectedDate = "";

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController psw = TextEditingController();
  TextEditingController Confirmpsw = TextEditingController();
   File? myImage;
   String name1 = '';
   String email2 = '';
   String password = '';
   String confirmPassword = '';
   String userName = '';
   String logInPassword = '';
   String cpsw = '';


  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
            colorScheme: const ColorScheme.light(
                primary: Colors.red
            ).copyWith(secondary: Colors.red),
        ),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: redColor,
            title: const Text(stepperApp),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Stepper(
                    currentStep: initialStepValue,
                    onStepTapped: (val) {
                      setState(() {
                        initialStepValue = val;
                      });
                    },
                    onStepContinue: () {
                      if (initialStepValue < 2 &&
                          formKey.currentState!.validate()) {
                        setState(() {
                          ++initialStepValue;
                        });
                      }
                    },
                    onStepCancel: () {
                      if (initialStepValue > 0) {
                        setState(() {
                          --initialStepValue;
                        });
                      }
                    },
                    controlsBuilder: (context, details) {
                      return Row(
                        children: [
                          ElevatedButton(
                              onPressed: details.onStepContinue,
                              child: Text("Next")),
                          SizedBox(width: 20),
                          OutlinedButton(
                              onPressed: details.onStepCancel,
                              child: Text("Cancel"))
                        ],
                      );
                    },
                    steps: [
                      Step(
                        state: StepState.editing,
                        title: Text("Registarion Page"),
                        content: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: CircleAvatar(
                                      backgroundImage: (imgFile != null)
                                          ? FileImage(imgFile!)
                                          : null,
                                      radius: 60,
                                      child: (imgFile != null)
                                          ? Text("")
                                          : Text("ADD"),
                                      backgroundColor: Colors.grey,
                                    ),
                                  ),
                                  Positioned(
                                    top: 70,
                                    left: 220,
                                    child: FloatingActionButton(
                                      onPressed: () async {
                                        XFile? image = await picker.pickImage(
                                            source: ImageSource.camera);
                                        setState(() {
                                          imgFile = File(image!.path);
                                          myImage = imgFile;
                                        });
                                      },
                                      mini: true,
                                      child: Icon(Icons.add),
                                    ),
                                  ),
                                ],
                              ),
                              TextFormField(
                                controller: name,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "please enter  first name";
                                  } else if (val.length < 2) {
                                    return "enter valid name...";
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  setState(() {
                                    name1 = val!;
                                  });
                                },
                                decoration: InputDecoration(
                                  icon: Icon(Icons.person),
                                  hintText: "Full Name",
                                ),
                              ),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: email,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "please enter  email address";
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  setState(() {
                                    email2 = val!;
                                  });
                                },
                                decoration: InputDecoration(
                                  icon: Icon(Icons.mark_email_read),
                                  hintText: "Email Address",
                                ),
                              ),
                              TextFormField(
                                keyboardType: TextInputType.phone,
                                controller: phone,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "please enter  phone no";
                                  } else if (val.length != 10) {
                                    return "enter valid length phone no...";
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  setState(() {
                                    phone = val! as TextEditingController;
                                  });
                                },
                                decoration: InputDecoration(
                                  icon: Icon(Icons.phone),
                                  hintText: "Mobile Number",
                                ),
                              ),
                              SizedBox(height: 20),

                              TextFormField(
                                controller: address,
                                maxLines: 2,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "please enter  address";
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  setState(() {
                                    address = val! as TextEditingController;
                                  });
                                },
                                decoration: InputDecoration(
                                  icon: Icon(Icons.home_filled),
                                  hintText: "Full House Address",
                                ),
                              ),
                              TextFormField(
                                controller: pincode,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "please enter valid pincode";
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  setState(() {
                                    pincode = val! as TextEditingController;
                                  });
                                },
                                decoration: InputDecoration(
                                  icon: Icon(Icons.pin),
                                  hintText: "Pincode",
                                ),
                              ),
                              TextFormField(
                                controller: psw,
                                obscureText: true,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "please enter  phone no";
                                  } else if (val.length != 8) {
                                    return "enter valid password...";
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  setState(() {
                                    psw = val! as TextEditingController;
                                  });
                                },
                                decoration: InputDecoration(
                                  icon: Icon(Icons.password_outlined),
                                  hintText: "password",
                                ),
                              ),
                              TextFormField(
                                controller: Confirmpsw,
                                obscureText: true,
                                validator: (val) {
                                  if (val!.isEmpty) return 'Empty';
                                  if (val != psw.text) return 'Not Match';
                                  return null;
                                },
                                onSaved: (val) {
                                  setState(() {
                                    cpsw = val!;
                                  });
                                },
                                decoration: InputDecoration(
                                  icon: Icon(Icons.password_sharp),
                                  hintText: "password",
                                ),
                              ),
                            ],
                          ),
                        ),
                        isActive: (initialStepValue >= 0) ? true : false,
                      ),
                      Step(
                          state: StepState.editing,
                          title: Text("Login"),
                          content: Column(
                            children: [
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: email,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "please enter  email address";
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  setState(() {
                                    email = val! as TextEditingController;
                                  });
                                },
                                decoration: InputDecoration(
                                  icon: Icon(Icons.mark_email_read),
                                  hintText: "Email Address",
                                ),
                              ),
                              TextFormField(
                                controller: psw,
                                obscureText: true,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "please enter valid password";
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  setState(() {
                                    psw = val! as TextEditingController;
                                  });
                                },
                                decoration: InputDecoration(
                                  icon: Icon(Icons.password_outlined),
                                  hintText: "password",
                                ),
                              ),
                            ],
                          ),
                          isActive: (initialStepValue >= 1) ? true : false),
                      Step(
                          state: StepState.editing,
                          title: Text("Home"),
                          content: Text("Login Successfully"),
                          isActive: (initialStepValue >= 2) ? true : false),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}



