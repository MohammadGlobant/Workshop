import 'package:flutter/material.dart';

Widget listItems(Map item) => Padding(
  padding: const EdgeInsets.all(8.0),
  child: Row(
    children: [
       CircleAvatar(
        backgroundColor: Colors.red,
        radius: 40.0,
        child: Text(
            '${item['time']}'
        ),
      ),
      const SizedBox(width: 20.0),
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${item["title"]}',
            style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold
            ),
          ),
          Text(
            '${item['date']}',
            style: const TextStyle(
                color: Colors.grey
            ),
          ),
        ],
      )
    ],
  ),
);