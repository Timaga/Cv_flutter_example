// ignore_for_file: prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MyExpandableText extends StatefulWidget {
  @override
  LayoutScreen createState() => LayoutScreen();
}

class LayoutScreen extends State<MyExpandableText> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            CircleAvatar(
              radius: 90,
              foregroundImage: AssetImage("assets/rock.jpg"),
            ),
            SizedBox(
              height: 40,
            ),
            Text("Tim",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Iglesia")),
            Text("Flutter developer"),
            SizedBox(
              height: 20,
            ),
            Card(
              child: ListTile(
                leading: Icon(BoxIcons.bxs_phone_call),
                title: ElevatedButton(
                    child: Text("your phone"),
                    onPressed: () async {
                      final phoneNumber = 'your phone';
                      final url_ph = 'tel:$phoneNumber';

                      if (await canLaunchUrlString(url_ph)) {
                        await launchUrlString(url_ph);
                      }
                    }),
              ),
            ),
            Card(
              child: ListTile(
                  leading: Icon(Bootstrap.github),
                  title: ElevatedButton(
                    child: Text('GitHub'),
                    onPressed: () async {
                      final url = 'https://github.com/Timaga';
                      if (await canLaunch(url)) {
                        await launch(
                          url,
                          forceSafariVC: true,
                          forceWebView: true,
                          enableJavaScript: true,
                        );
                      }
                    },
                  )),
            ),
            Card(
              child: ListTile(
                  leading: Icon(Icons.email),
                  title: ElevatedButton(
                    child: Text('Email'),
                    onPressed: () async {
                      final toEmail = 'your mail';
                      final titleMsg = 'Greetings!';
                      final message =
                          'Hi!\nI am a flutter developer! you can subscribe me on github:\nhttps://github.com/Timaga';
                      final mail_url =
                          'mailto:$toEmail?titleMsg=${Uri.encodeFull(titleMsg)}&body=${Uri.encodeFull(message)}';
                      if (await canLaunch(mail_url)) {
                        await launch(
                          mail_url,
                        );
                      }
                    },
                  )),
            ),
            ExpansionPanelList(
              elevation: 1,
              expandedHeaderPadding: EdgeInsets.zero,
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  this.isExpanded = !isExpanded;
                });
              },
              children: [
                ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: ListTile(
                        title: Text(
                          'More information',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  },
                  body: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Education: your education\n\n'
                      'Work Experience: Programming teacher',
                    ),
                  ),
                  isExpanded: isExpanded,
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
