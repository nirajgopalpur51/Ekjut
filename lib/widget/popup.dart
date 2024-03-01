import 'package:flutter/material.dart';

class Popup extends StatefulWidget {
  const Popup({Key? key}) : super(key: key);

  @override
  State<Popup> createState() => _PopupState();
}

class _PopupState extends State<Popup> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 20
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Text('Enter your UPI ID',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22
              ),
            ),
          SizedBox(height: size.height*.02,),
          TextField(
            decoration: InputDecoration(
                hintText: 'UPI ID',
                fillColor: Color(0xffF5F5F5),
                filled: true,
                border: InputBorder.none),
          ),
            SizedBox(height: size.height*.02,),
        
            ElevatedButton(
              onPressed: () {
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xffFCA136))
              ),
              child: Text('Pay',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
        
          ],
        ),
      )

    );
  }
}
