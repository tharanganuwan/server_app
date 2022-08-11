import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  const ListCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueAccent[200],
      child: ListTile(
        title: Text('Server Name'),
        subtitle: Text('Port'),
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
