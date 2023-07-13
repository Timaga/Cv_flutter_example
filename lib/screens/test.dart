import 'package:flutter/material.dart';

class MyExpandableText extends StatefulWidget {
  @override
  _MyExpandableTextState createState() => _MyExpandableTextState();
}

class _MyExpandableTextState extends State<MyExpandableText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expandable Text Example'),
      ),
      body: ListView(
        children: [
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
                  return ListTile(
                    title: Center(
                      child: Text(
                        'More information',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
                body: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                  'Sed sit amet est nunc. In hac habitasse platea dictumst. '
                  'Praesent interdum feugiat commodo. ',
                ),
                isExpanded: isExpanded,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: MyExpandableText()));
}
