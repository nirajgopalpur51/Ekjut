import 'package:flutter/material.dart';

class AppoimentTab extends StatefulWidget {
  AppoimentTab({Key? key}) : super(key: key);

  @override
  State<AppoimentTab> createState() => _AppoimentTabState();
}

class _AppoimentTabState extends State<AppoimentTab> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      // ignore: prefer_const_constructors
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            height: size.height * .20,
            width: size.width * .9,
            // ignore: prefer_const_constructors
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[100]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/img.png',
                      height: size.height * .10,
                      width: size.width * .5,
                    ),
                    // ignore: prefer_const_constructors
                    Text(
                      // ignore: prefer_const_constructors
                      'dr.mike\n16th sep\n10:15 am',
                      style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 2,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'join metting',
                    style: TextStyle(
                        fontSize: 15, letterSpacing: 2, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    // ignore: prefer_const_constructors
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
