import 'package:flutter/material.dart';

class VideoConsultTab extends StatefulWidget {
  const VideoConsultTab({Key? key}) : super(key: key);

  @override
  State<VideoConsultTab> createState() => _VideoConsultTabState();
}

class _VideoConsultTabState extends State<VideoConsultTab> {
  final List<Map<String,dynamic>> day=[{'id':1,'lable':'Yesterday'},
    {'id':2,'lable':'Today'},
    {'id':3,'lable':'Tomorrow'}
  ];
  final List<Map<String, dynamic>> timing =[
    {'id':1,'lable':'1:00 pm',},
    {'id':2,'lable':'1:15 pm',},
    {'id':3,'lable':'1:30 pm',},
    {'id':4,'lable':'1:45 pm',},
    {'id':5,'lable':'2:00 pm',},
    {'id':6,'lable':'2:15 pm',},
    {'id':7,'lable':'2:30 pm',},
    // {'id':8,'lable':'2:45 pm',},
    // {'id':9,'lable':'2:00 pm',},
  ];
  int timingId=-1;
  int dayId=-1;
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Wrap(
            children:day.map((value) => buildChoiceChip(value)).toList(),
            spacing: size.width*.07,
          ),
          SizedBox(
            height: size.height * .017,
          ),
          Row(
            children: [
              Text(
                'Timings',
                style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
              ),
              Spacer()
            ],
          ),
          SizedBox(
            height: size.height * .017,
          ),
          Wrap(
            children: timing.map((value) => buildChoiceChipTiming(value)).toList(),
            spacing: size.width * .05,
            alignment: WrapAlignment.spaceEvenly,
            runSpacing: size.width * .03,
          ),
        ],
      ),
    );
  }

  ChoiceChip buildChoiceChip(Map<String,dynamic> value) =>
      ChoiceChip(
        label:Text( value['lable']),
        selectedColor: Color(0xff00B48B),
        selected: value['id']==dayId,
        labelStyle: TextStyle(
            color: value['id']==dayId?Colors.white:Colors.black,
            fontSize:18
        ),
        onSelected: (_)=>setState(() {
          dayId=value['id'];
        }),
      );
  ChoiceChip buildChoiceChipTiming(Map<String,dynamic> value) =>
      ChoiceChip(
        label:Text( value['lable']),
        selectedColor: Color(0xff00B48B),
        selected: value['id']==timingId,
        labelStyle: TextStyle(
            color: value['id']==timingId?Colors.white:Colors.black,
            fontSize:18
        ),
        onSelected: (_)=>setState(() {
          timingId=value['id'];
        }),
      );

}



// import 'package:flutter/material.dart';
//
// class VideoConsultTab extends StatefulWidget {
//   const VideoConsultTab({Key? key}) : super(key: key);
//
//   @override
//   State<VideoConsultTab> createState() => _VideoConsultTabState();
// }
//
// class _VideoConsultTabState extends State<VideoConsultTab> {
//   final List<Map<String, dynamic>> day = [
//     {'id': 1, 'lable': 'Yesterday'},
//     {'id': 2, 'lable': 'Today'},
//     {'id': 3, 'lable': 'Tomorrow'}
//   ];
//   final List<Map<String, dynamic>> timing =[
//     {'id':1,'lable':'9:00 am',},
//     {'id':2,'lable':'9:15 am',},
//     {'id':3,'lable':'9:30 am',},
//     {'id':4,'lable':'9:45 am',},
//     {'id':5,'lable':'10:00 am',},
//     {'id':6,'lable':'10:15 am',},
//     {'id':7,'lable':'10:30 am',},
//     {'id':8,'lable':'10:45 am',},
//     // {'id':9,'lable':'11:00 am',},
//
//   ];
//   int dayId = -1;
//   int timingId=-1;
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Wrap(
//             children: day.map((value) => buildChoiceChip(value)).toList(),
//             spacing: size.width * .07,
//           ),
//           SizedBox(
//             height: size.height * .017,
//           ),
//           Row(
//             children: [
//               Text(
//                 'Timings',
//                 style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
//               ),
//               Spacer()
//             ],
//           ),
//           SizedBox(
//             height: size.height * .017,
//           ),
//           Wrap(
//             children: timing.map((value) => buildChoiceChipTiming(value)).toList(),
//             spacing: size.width * .05,
//             alignment: WrapAlignment.spaceEvenly,
//             runSpacing: size.width * .03,
//           ),
//         ],
//       ),
//     );
//   }
//
//   ChoiceChip buildChoiceChip(Map<String, dynamic> value) => ChoiceChip(
//         label: Text(value['lable']),
//         padding: EdgeInsets.all(5),
//         selectedColor: Color(0xff00B48B),
//         selected: value['id'] == timingId,
//         labelStyle: TextStyle(
//             color: value['id'] == timingId ? Colors.white : Colors.black,
//             fontSize: 18),
//         onSelected: (_) => setState(() {
//           timingId = value['id'];
//         }),
//       );
//   ChoiceChip buildChoiceChipTiming(Map<String,dynamic> value) =>
//       ChoiceChip(
//         label:Text( value['lable']),
//         selectedColor: Color(0xff00B48B),
//         selected: value['id']==timingId,
//         labelStyle: TextStyle(
//             color: value['id']==timingId?Colors.white:Colors.black,
//             fontSize:18
//         ),
//         onSelected: (_)=>setState(() {
//           timingId=value['id'];
//         }),
//       );
// }
