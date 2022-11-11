import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  build(BuildContext context) {
    PermissionStatus camerapermission = PermissionStatus.denied;
    PermissionStatus locationpermission = PermissionStatus.denied;
    PermissionStatus storagepermission = PermissionStatus.denied;
    PermissionStatus microphonepermission = PermissionStatus.denied;
    PermissionStatus phonepermission = PermissionStatus.denied;
    PermissionStatus calenpermission = PermissionStatus.denied;
    PermissionStatus contacttpermission = PermissionStatus.denied;
    PermissionStatus photospermission = PermissionStatus.denied;

    return Scaffold(
      backgroundColor: Colors.yellowAccent.withOpacity(0.3),
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent,
        title: const Text("Permission App",style: TextStyle(color: Colors.black),),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                await openAppSettings();
              },
              icon: const Icon(Icons.settings,color: Colors.black,)),
          Theme(
            child: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Center(
                        child: Text("Permission Status"),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          mypermission(ic: Icons.camera_alt, permissionStatus: camerapermission),
                          mypermission(ic: Icons.location_on_outlined, permissionStatus: locationpermission),
                          mypermission(ic: Icons.storage, permissionStatus: storagepermission),
                          mypermission(ic: Icons.mic_none_rounded, permissionStatus: microphonepermission),
                          mypermission(ic: Icons.phone, permissionStatus: phonepermission),
                          mypermission(ic: Icons.calendar_month, permissionStatus: calenpermission),
                          mypermission(ic: Icons.contact_page_rounded, permissionStatus: contacttpermission),
                          mypermission(ic: Icons.photo, permissionStatus: photospermission),
                        ],
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.note_rounded,color: Colors.black,)),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              child: ListTile(
                leading: const Icon(Icons.camera_alt_outlined),
                title: const Text("Camera"),
                onTap: () async {
                  camerapermission = await Permission.camera.request();

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text("${camerapermission}"),
                    backgroundColor:
                    (camerapermission.isGranted) ? Colors.green : Colors.red,
                    behavior: SnackBarBehavior.floating,
                  ));
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.location_on_outlined),
                title: const Text("Location"),
                onTap: () async {
                  locationpermission = await Permission.location.request();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text("${locationpermission}"),
                    backgroundColor:
                    (locationpermission.isGranted) ? Colors.green : Colors.red,
                    behavior: SnackBarBehavior.floating,
                  ));
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.storage),
                title: const Text("Storage"),
                onTap: () async {
                  storagepermission = await Permission.storage.request();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text("${storagepermission}"),
                    backgroundColor:
                    (storagepermission.isGranted) ? Colors.green : Colors.red,
                    behavior: SnackBarBehavior.floating,
                  ));
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.mic),
                title: const Text("Microphone"),
                onTap: () async {
                  microphonepermission = await Permission.microphone.request();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text("${microphonepermission}"),
                    backgroundColor:
                    (microphonepermission.isGranted) ? Colors.green : Colors.red,
                    behavior: SnackBarBehavior.floating,
                  ));
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.phone),
                title: const Text("Phone"),
                onTap: () async {
                  phonepermission = await Permission.phone.request();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text("${phonepermission}"),
                    backgroundColor:
                    (phonepermission.isGranted) ? Colors.green : Colors.red,
                    behavior: SnackBarBehavior.floating,
                  ));
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.calendar_month),
                title: const Text("Calendar"),
                onTap: () async {
                  calenpermission = await Permission.calendar.request();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text("${calenpermission}"),
                    backgroundColor:
                    (calenpermission.isGranted) ? Colors.green : Colors.red,
                    behavior: SnackBarBehavior.floating,
                  ));
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.contacts),
                title: const Text("Contacts"),
                onTap: () async {
                  contacttpermission = await Permission.contacts.request();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text("${contacttpermission}"),
                    backgroundColor:
                    (contacttpermission.isGranted) ? Colors.green : Colors.red,
                    behavior: SnackBarBehavior.floating,
                  ));
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.photo),
                title: const Text("Photos"),
                onTap: () async {
                  photospermission = await Permission.photos.request();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text("${photospermission}"),
                    backgroundColor:
                    (photospermission.isGranted) ? Colors.green : Colors.red,
                    behavior: SnackBarBehavior.floating,
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  mypermission({required ic, required PermissionStatus permissionStatus}) {
    return Row(
      children: [
        Icon(ic),
        const Spacer(),
        (permissionStatus.isGranted)
            ? const Text("Permission Granted ")
            : const Text("Permission Denide  "),
        (permissionStatus.isGranted)
            ? const Icon(
          Icons.check_circle,
          color: Colors.green,
        )
            : const Icon(
          Icons.radio_button_unchecked,
          color: Colors.red,
        )
      ],
    );
  }
}