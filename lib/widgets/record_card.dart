import 'package:flutter/material.dart';

class RecordCard extends StatelessWidget {
  const RecordCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueAccent[200],
      child: ListTile(
        title: Text('Record Name'),
        subtitle: Row(
          children: [
            Text('Status'),
            SizedBox(
              width: 5,
            ),
            Text('Cammand'),
            SizedBox(
              width: 5,
            ),
            // Text('Time Value'),
            // SizedBox(
            //   width: 5,
            // ),
            // Text('Description'),
            // SizedBox(
            //   width: 5,
            // ),
            // Text('Commanda Run Time'),
          ],
        ),
        trailing: SizedBox(
          width: 100,
          child: Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
              IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
            ],
          ),
        ),
      ),
    );
  }
}
