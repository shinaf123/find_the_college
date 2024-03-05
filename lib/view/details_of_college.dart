import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';


class DetailsOfCollege extends StatefulWidget {
  final Map<String, dynamic> college;
  const DetailsOfCollege({super.key,required this.college});

  @override
  State<DetailsOfCollege> createState() => _DetailsOfCollegeState();
}

class _DetailsOfCollegeState extends State<DetailsOfCollege> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.college['name']),
      ),

      body: Container(
        padding: EdgeInsets.all(12),
        height: 110,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 206, 211, 214),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(25),
          ),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.college['name'],style: GoogleFonts.amarante(fontSize:22)),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Icon(Icons.location_city),
              Text(widget.college["country"],style: GoogleFonts.nunito(fontSize:18),),
              Spacer(),
              GestureDetector(
                onTap: () {
                  // _launchUrl();
                },
                child: Container(
                  padding: EdgeInsets.all(6),
                  height: 35,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 58, 110, 145),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.open_in_new),
                      Text("Go Web")
                
                    ],
                  ),
                ),
              )
            ],),

          ],
        ),
      )
    );
    
  }

  //Go to web Open
//  Future<void> _launchUrl() async {
//   if (!await launchUrl(widget.college['web_pages'].isEmpty ? "N/A": widget.college['web_pages'][0])) {
//     throw Exception('Could not launch ${widget.college['web_pages'].isEmpty ? "N/A": widget.college['web_pages'][0]}');
//   }
// }
}

