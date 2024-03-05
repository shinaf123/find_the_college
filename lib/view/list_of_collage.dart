import 'dart:convert';

import 'package:find_collage/view/details_of_college.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class ListOfCollage extends StatefulWidget {
  const ListOfCollage({super.key});

  @override
  State<ListOfCollage> createState() => _ListOfCollageState();
}

class _ListOfCollageState extends State<ListOfCollage> {
  List<dynamic> colleges = [];

  @override
  void initState() {
    fetchColleges();
    super.initState();
  }

  //API Calling.....
  Future<void> fetchColleges() async {
    final response = await http
        .get(Uri.parse('http://universities.hipolabs.com/search?name=middle'));
    if (response.statusCode == 200) {
      setState(() {
        colleges = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load universities');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('University List',style: GoogleFonts.acme(),),
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 265,
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            labelText: 'Search for Colleges',
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.only(top: 12),
                        height: 45,
                        width: 80,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 49, 131, 52),
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          "Search",
                          style: GoogleFonts.nunito(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                 const SizedBox(height: 10,),
              
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height-100,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                        itemCount: colleges.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsOfCollege(college: colleges[index])));
                              },
                              child: Container(
                                width: MediaQuery.sizeOf(context).width,
                                height: 60,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 215, 222, 228),
                                    border: Border(),
                                    borderRadius: BorderRadius.circular(15)
                                    ),
              
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(colleges[index]['name']),
                                          Icon(Icons.school_sharp,color: Colors.black,)
                                        ],
                                      ),
                                    ),
                              ),
                            ),
                          );
              
                         
                        }),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
