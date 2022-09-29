import 'package:flutter/material.dart';
import 'dart:io';
import 'package:outcaster/utils/colors.dart';
import 'package:image_picker/image_picker.dart';

class registration extends StatefulWidget {
  const registration({Key? key}) : super(key: key);

  @override
  State<registration> createState() => _registrationState();
}

class _registrationState extends State<registration> {
  int initialStepValue = 0;
  final ImagePicker picker = ImagePicker();
  File? imgFile;
  DateTime initialDate = DateTime.now();
  String selectedDate = "";


  TextStyle titleStyle = TextStyle(fontSize: 20, color: Colors.indigoAccent);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pincode = TextEditingController();
   String name1 = '';
   String email1 = '';
   String phone1 = '';
   String address1 = '';
   String pincode1 = '';

  static File? myImage;
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
          title:  Text("Registartion Page"),
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
                      print(initialStepValue);
                    });
                  },
                  onStepContinue: () {
                    if (initialStepValue < 3 && formKey.currentState!.validate()) {
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
                  controlsBuilder: (context,details){
                    return Row(children: [
                      ElevatedButton(onPressed:details.onStepContinue , child: Text("Next")),
                      SizedBox(width: 20),
                      OutlinedButton(onPressed: details.onStepCancel , child:  Text("Cancel"))
                    ],);
                  },
                  steps: [
                    Step(
                      state: StepState.editing,
                      title: Text("Profile Picture"),
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
                          ],
                        ),
                      ),
                      isActive: (initialStepValue >= 0) ? true : false,
                    ),
                    Step(
                        state: StepState.editing,
                        title: Text("Account"),
                        content: Column(
                          children: [
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
                                 name = val! as TextEditingController;
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
                                  email = val! as TextEditingController;
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
                          ],
                        ),
                        isActive: (initialStepValue >= 1) ? true : false),
                    Step(
                        state: StepState.editing,
                        title: Text("DOB"),
                        content:Column(
                          children: [
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Date", style: titleStyle),
                                Text("$selectedDate", style: titleStyle),
                              ],
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () async {
                                    DateTime? pickerDate = await showDatePicker(
                                        context: context,
                                        initialDate: initialDate,
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2030),
                                        initialDatePickerMode: DatePickerMode.day,
                                        initialEntryMode: DatePickerEntryMode.calendarOnly,
                                        helpText: "Choose your destination date",
                                        confirmText: "Book",
                                        cancelText: "Dismiss",
                                        );
                                    setState(() {
                                      if (pickerDate != null) {
                                        selectedDate =
                                        "${pickerDate.day}/${pickerDate.month}/${pickerDate.year}";
                                      }
                                    });
                                  },
                                  child: Text("Change Date")),
                            ),
                          ],
                        ),
                        isActive: (initialStepValue >= 2) ? true : false

                    ),
                    Step(
                        state: StepState.editing,
                        title: Text("Address"),
                        content: Column(
                          children: [
                            TextFormField(
                              controller: address,
                              maxLines: 3,
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
                          ],
                        ),
                        isActive: (initialStepValue >= 3) ? true : false),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
