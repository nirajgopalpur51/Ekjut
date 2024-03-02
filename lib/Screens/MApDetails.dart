import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../Controller/LocationController.dart';
import '../Model/MapData.dart';
class MapDetails extends GetView<LocationController> {
  final Results results;
  const MapDetails(this.results, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.9,
              height: 221,
              clipBehavior: Clip.hardEdge,
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: results.photos != null && results.photos!.isNotEmpty
                  ? Image.network(
                getPhotoUrl(results.photos!.first),
                width: double.infinity,
                height: 221,
                fit: BoxFit.cover,
              )
                  : Image.network("https://img.freepik.com/free-vector/oops-404-error-with-broken-robot-concept-illustration_114360-1932.jpg",fit: BoxFit.cover,), // Placeholder for image
            ),
            Text(results.name ?? "Unknown", style: _textStyle(18, FontWeight.w600)),

            Row(
              children: [
                Text(results.rating.toString()),
                const SizedBox(width: 5,),
                RatingBar.builder(
                  initialRating: results.rating ?? 0.0,
                  minRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 12.0,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    // Handle rating update if needed
                  },
                ),
                SizedBox(width: 30,),
                results.userRatingsTotal==null?Container():
                Text("${results.userRatingsTotal} Reviews" ,style: TextStyle(fontSize: 11),)
              ],
            ),
            _TextRow(Icons.location_on_outlined, results.plusCode?.compoundCode  ?? "Unknown"),
            _TextRow(Icons.watch_later_outlined, results.openingHours?.openNow == true ? "Open Now" : "Closed"),
            _TextRow(Icons.add_business_outlined,  "Unknown"),
            _TextRow(Icons.call, "Unknown"),

            // SizedBox(width: MediaQuery.of(context).size.width*0.9,child: ElevatedButton(
            //   onPressed: (){},
            //   child: const Text("Book a Appointment"),
            // ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Reviews' , style: _textStyle(15, FontWeight.w600,color: Colors.black)),
                // OutlinedButton(onPressed: (){}, child: const Text("Write Review")),
              ],
            ),

            Text(results.userRatingsTotal?.toString() ?? "", style: _textStyle(15, FontWeight.w400, color: Colors.blue)),
            Text(results.rating?.toString() ?? ""),
            const Text("No comment"),
          ],
        ),
      ),
    );
  }

  TextStyle _textStyle(double fontSize, FontWeight fontWeight, {Color color = Colors.black}) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontFamily: 'Poppins',
      fontWeight: fontWeight,
      height: 0,
    );
  }
  String getPhotoUrl(Photos photo) {
    String url ='https://maps.googleapis.com/maps/api/place/photo?maxwidth=${photo.width}&photoreference=${photo.photoReference}&key=AIzaSyC1stPRMsTLwlxp9fP0vf0byrWjOUm7VbQ';
    return url;
  }
  Widget _TextRow(IconData icon ,String title,) {
    debugPrint(title);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(icon),
        SizedBox(width: 10,),

        Text(title, style: _textStyle(12, FontWeight.w400, color: const Color(0xFF342B60)),softWrap: true),
      ],
    );
  }
}
