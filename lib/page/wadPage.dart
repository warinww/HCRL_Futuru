import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_hcrl/model/wad_model.dart';
import 'package:url_launcher/url_launcher.dart';

class WadPage extends StatefulWidget {
  final WadModel wad;

  const WadPage({super.key, required this.wad});

  @override
  State<WadPage> createState() => _WadPageState();
}

class _WadPageState extends State<WadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.yellow[50],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Text(
                widget.wad.name,
                style: GoogleFonts.prompt(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(widget.wad.pic1),
                  ),
                  const SizedBox(height: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(widget.wad.pic2),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: widget.wad.subtopics.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text(
                        widget.wad.subtopics[index].subtopic,
                        style: GoogleFonts.prompt(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        widget.wad.subtopics[index].result,
                        style: GoogleFonts.prompt(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                      onTap: () {
                        if (widget.wad.subtopics[index].subtopic == 'Location Details') {
                          _openMap(widget.wad.lo);
                        }
                      },
                    ),
                  );
                },
              ),
            ),
            Text(
              '*Click on Location Details to see the map.*',
              style: GoogleFonts.prompt(
                fontSize: 13,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        '✦ Futuru ✦',
        style: GoogleFonts.prompt(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.yellow[200],
      elevation: 0.0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
          height: 20,
          width: 20,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      // actions: [
      //   IconButton(
      //     icon: SvgPicture.asset(
      //       'assets/icons/dots.svg',
      //       height: 5,
      //       width: 5,
      //     ),
      //     onPressed: () {},
      //   ),
      // ],
    );
  }

  void _openMap(String location) async {
    final String googleMapUrl = 'https://maps.app.goo.gl/$location';
    if (await canLaunch(googleMapUrl)) {
      await launch(googleMapUrl);
    } else {
      throw 'Could not launch $googleMapUrl';
    }
  }
}