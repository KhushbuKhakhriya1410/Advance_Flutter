import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:outcaster/utils/colors.dart';
import 'package:outcaster/utils/strings.dart';
import 'package:outcaster/utils/textstyle.dart';
import 'package:outcaster/routes/routesstring.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool lockswitch = true;
  bool fingerprintswitch = false;
  bool passwordswitch = true;
  bool platformchange = true;

  @override
  Widget build(BuildContext context) {
    return (platformchange == true)
        ? Scaffold(
            appBar: AppBar(
              title: Text(settingui, style: whitebold20),
              backgroundColor: appbarsettings,
              actions: [
                Switch(
                  activeColor: whiteswitch,
                  inactiveTrackColor: greyswitchappbar,
                  activeTrackColor: greyswitch,
                  inactiveThumbColor: blackswitchappbar,
                  onChanged: (val) {
                    setState(() {
                      platformchange = val;
                    });
                  },
                  value: platformchange,
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(width: 15),
                      Text(
                        settingscommon,
                        style: redbold,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    title: Text(
                      settingslanguage,
                      style: black18,
                    ),
                    subtitle: Text(
                      settingenglish,
                      style: grey15,
                    ),
                    leading: const Icon(Icons.language),
                  ),
                  ListTile(
                    title: Text(
                      settingenviroment,
                      style: black18,
                    ),
                    subtitle: Text(
                      settingproduction,
                      style: grey15,
                    ),
                    leading: const Icon(Icons.cloud_outlined),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(width: 15),
                      Text(
                        settingaccount,
                        style: redbold,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    title: Text(
                      settingphone,
                      style: black18,
                    ),
                    leading: const Icon(Icons.phone),
                  ),
                  ListTile(
                    title: Text(
                      settingemail,
                      style: black18,
                    ),
                    leading: const Icon(Icons.email),
                  ),
                  ListTile(
                    title: Text(
                      settingenviroment,
                      style: black18,
                    ),
                    leading: const Icon(Icons.login_outlined),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(width: 15),
                      Text(
                        settingsecurity,
                        style: redbold,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    title: Text(
                      settinglock,
                      style: black18,
                    ),
                    leading: const Icon(Icons.logout_outlined),
                    trailing: Switch(
                      inactiveThumbColor: whiteswitch,
                      activeTrackColor: orangeswitch,
                      inactiveTrackColor: greyswitch,
                      activeColor: redswitch,
                      onChanged: (val) {
                        setState(() {
                          lockswitch = val;
                        });
                      },
                      value: lockswitch,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      settingfingerprint,
                      style: black18,
                    ),
                    leading: const Icon(Icons.fingerprint),
                    trailing: Switch(
                      inactiveThumbColor: whiteswitch,
                      activeTrackColor: orangeswitch,
                      inactiveTrackColor: greyswitch,
                      activeColor: redswitch,
                      onChanged: (val) {
                        setState(() {
                          fingerprintswitch = val;
                        });
                      },
                      value: fingerprintswitch,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      settingpassword,
                      style: black18,
                    ),
                    leading: const Icon(Icons.lock),
                    trailing: Switch(
                      inactiveThumbColor: whiteswitch,
                      activeTrackColor: orangeswitch,
                      inactiveTrackColor: greyswitch,
                      activeColor: redswitch,
                      onChanged: (val) {
                        setState(() {
                          passwordswitch = val;
                        });
                      },
                      value: passwordswitch,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        settingmisc,
                        style: redbold,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    title: Text(
                      settingterms,
                      style: black18,
                    ),
                    leading: const Icon(Icons.event_note_outlined),
                  ),
                  ListTile(
                    title: Text(
                      settingopensource,
                      style: black18,
                    ),
                    leading: const Icon(Icons.library_add_check),
                  ),
                ],
              ),
            ),
          )
        : SettingPage2();
  }
}

class SettingPage2 extends StatefulWidget {
  const SettingPage2({Key? key}) : super(key: key);

  @override
  State<SettingPage2> createState() => _SettingPage2State();
}

class _SettingPage2State extends State<SettingPage2> {
  bool platformchange1 = true;
  bool lockswitch = true;
  bool passwordswitch = true;
  bool fingerprintswitch = false;

  @override
  Widget build(BuildContext context) {
    return (platformchange1 == true)
        ? Scaffold(
            backgroundColor: black05,
            appBar: AppBar(
              title: Text(
                settingui,
                style: whitebold20,
              ),
              centerTitle: true,
              backgroundColor: appbarsettings,
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(width: 15),
                      Text(
                        settingscommon,
                        style: greybold,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: colorwhite,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.language,
                          color: greycolor,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          settingslanguage,
                          style: black18,
                        ),
                        const SizedBox(
                          width: 280,
                        ),
                        Row(
                          children: [
                            Text(
                              settingenglish,
                              style: grey15,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                color: greycolor,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: colorwhite,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.cloud_outlined,
                          color: greycolor,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          settingenviroment,
                          style: black18,
                        ),
                        const SizedBox(
                          width: 248,
                        ),
                        Row(
                          children: [
                            Text(
                              settingproduction,
                              style: grey15,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                color: greycolor,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(width: 15),
                      Text(
                        settingaccount,
                        style: greybold,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 40,
                    color: colorwhite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 15),
                        Icon(
                          Icons.phone,
                          color: greycolor,
                        ),
                        const SizedBox(width: 15),
                        Text(
                          settingphone,
                          style: black18,
                        ),
                        const SizedBox(width: 300),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: greycolor,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    color: colorwhite,
                    height: 40,
                    child: Row(
                      children: [
                        const SizedBox(width: 15),
                        Icon(
                          Icons.email,
                          color: greycolor,
                        ),
                        const SizedBox(width: 15),
                        Text(
                          settingemail,
                          style: black18,
                        ),
                        const SizedBox(width: 360),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: greycolor,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 40,
                    color: colorwhite,
                    child: Row(
                      children: [
                        const SizedBox(width: 15),
                        Icon(
                          Icons.login_outlined,
                          color: greycolor,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          settingenviroment,
                          style: black18,
                        ),
                        const SizedBox(width: 320),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: greycolor,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(width: 15),
                      Text(
                        settingsecurity,
                        style: greybold,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: colorwhite,
                    alignment: Alignment.center,
                    height: 40,
                    child: Row(
                      children: [
                        const SizedBox(width: 15),
                        Icon(
                          Icons.logout_outlined,
                          color: greycolor,
                        ),
                        const SizedBox(width: 15),
                        Text(
                          settinglock,
                          style: black18,
                        ),
                        const SizedBox(width: 200),
                        CupertinoSwitch(
                          activeColor: redswitch,
                          thumbColor: whiteswitch,
                          trackColor: greyswitch,
                          onChanged: (val) {
                            setState(() {
                              lockswitch = val;
                            });
                          },
                          value: lockswitch,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: colorwhite,
                    alignment: Alignment.center,
                    height: 40,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.fingerprint,
                          color: greycolor,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          settingfingerprint,
                          style: black18,
                        ),
                        const SizedBox(
                          width: 260,
                        ),
                        CupertinoSwitch(
                          activeColor: redswitch,
                          thumbColor: whiteswitch,
                          trackColor: greyswitch,
                          onChanged: (val) {
                            setState(() {
                              fingerprintswitch = val;
                            });
                          },
                          value: fingerprintswitch,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: colorwhite,
                    alignment: Alignment.center,
                    height: 40,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.lock,
                          color: greycolor,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          settingpassword,
                          style: black18,
                        ),
                        const SizedBox(
                          width: 240,
                        ),
                        CupertinoSwitch(
                          activeColor: redswitch,
                          thumbColor: whiteswitch,
                          trackColor: greyswitch,
                          onChanged: (val) {
                            setState(() {
                              passwordswitch = val;
                            });
                          },
                          value: passwordswitch,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        settingmisc,
                        style: greybold,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: colorwhite,
                    alignment: Alignment.center,
                    height: 40,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.event_note_outlined,
                          color: greycolor,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          settingterms,
                          style: black18,
                        ),
                        const SizedBox(
                          width: 280,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: greycolor,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: colorwhite,
                    alignment: Alignment.center,
                    height: 40,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.library_add_check,
                          color: greycolor,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          settingopensource,
                          style: black18,
                        ),
                        const SizedBox(
                          width: 250,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: greycolor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : SettingPage();
  }
}
