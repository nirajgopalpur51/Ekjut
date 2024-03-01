
import 'package:flutter/material.dart';

class HistoryTab extends StatefulWidget {
  HistoryTab({Key? key}) : super(key: key);

  @override
  State<HistoryTab> createState() => _HistoryTabState();
}

class _HistoryTabState extends State<HistoryTab> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(20 ),
      child: Column(
        children: [
          Container(
            height: size.height * .15,
            width: size.width * .9,
            // ignore: prefer_const_constructors
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.grey[100]),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/img.png',
                      height: size.height * .07,
                      width: size.width * .5,
                    ),
                    Text(
                      'dr.mike\n16th sep\n10:15 am',
                      style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 2,
                        color: Colors.black,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}