import 'package:flutter/material.dart';

class communitypage extends StatefulWidget {
  const communitypage({Key? key}) : super(key: key);

  @override
  State<communitypage> createState() => _communitypageState();
}

class _communitypageState extends State<communitypage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        // padding: EdgeInsets.all(20.0),
        child: ListView(children: <Widget>[
          // Center(
          //     child: Text(
          //       'People-Chart',
          //       style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          //     )),
          DataTable(
            columns: [
              DataColumn(label: Text(
                  'No.',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
              )),
              DataColumn(label: Text(
                  'Resources',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
              )),
              DataColumn(label: Text(
                  'Availability',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
              )),
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('Beds',style: TextStyle(fontSize: 15),)),
                DataCell(Text('10')),
              ]),
              DataRow(cells: [
                DataCell(Text('2')),
                DataCell(Text('ICU')),
                DataCell(Text('Available')),
              ]),
              DataRow(cells: [
                DataCell(Text('3')),
                DataCell(Text('Bloods')),
                DataCell(Text('Available')),
              ]),
              DataRow(cells: [
                DataCell(Text('4')),
                DataCell(Text('Medicines')),
                DataCell(Text('Available')),
              ]),
            ],
          ),
        ])
    // DataTable(
        //
        //     columns: [
        //
        //       DataColumn(
        //         label: Text('ID'),
        //       ),
        //       DataColumn(
        //         label: Text('Name'),
        //       ),
        //       // DataColumn(
        //       //   label: Text('Code'),
        //       // ),
        //       // DataColumn(
        //       //   label: Text('Quantity'),
        //       // ),
        //       // DataColumn(
        //       //   label: Text('Amount'),
        //       // ),
        //     ],
        //     rows: [
        //
        //       DataRow(cells: [
        //         DataCell(Text('1')),
        //         DataCell(Text('Arshik')),
        //         // DataCell(Text('5644645')),
        //         // DataCell(Text('3')),
        //         // DataCell(Text('265\$')),
        //       ]),
        //       DataRow(cells: [
        //         DataCell(Text('1')),
        //         DataCell(Text('Arshik')),
        //         // DataCell(Text('5644645')),
        //         // DataCell(Text('3')),
        //         // DataCell(Text('265\$')),
        //       ]),
        //
        //     ])
      )

      // SingleChildScrollView(
      //   child: Container(
      //     child: ListView(
      //       padding: const EdgeInsets.all(8),
      //       children: [
      //         Container(
      //           height: 100,
      //           color: Colors.green,
      //           child: const Center(child: Text('Oxygen Available')),
      //         ),
      //         SizedBox(
      //           height: 20,
      //         ),
      //         Container(
      //           height: 100,
      //           color: Colors.red[500],
      //           child: const Center(child: Text('Blood  Not available')),
      //         ),
      //         SizedBox(
      //           height: 20,
      //         ),
      //         Container(
      //           height: 100,
      //           color: Colors.amber[100],
      //           child: const Center(child: Text('Beds Available')),
      //         ),
      //         SizedBox(
      //           height: 20,
      //         ),
      //         Container(
      //           height: 100,
      //           color: Colors.amber[100],
      //           child: const Center(child: Text('Snake venoum Available')),
      //         ),
      //         SizedBox(
      //           height: 20,
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
