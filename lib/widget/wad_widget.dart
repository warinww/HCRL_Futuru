import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_hcrl/model/wad_model.dart';
import 'package:project_hcrl/page/wadPage.dart';

class WadWidget extends StatelessWidget {
  final List<WadModel> wads = WadModel.getWad();

  WadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Recommend Sanctuary',
            style: GoogleFonts.prompt(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        const SizedBox(height: 15,),
        SizedBox(
          height: 250,
          child: ListView.separated(
            itemBuilder: (context, ind) {
              String location = wads[ind].subtopics
                .firstWhere((subtopic) => subtopic.subtopic == 'Location Details')
                .result;

              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return WadPage(wad: wads[ind]);
                  }));
                },
                child: Container(
                  width: 210,
                  decoration: BoxDecoration(
                    color: wads[ind].boxColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: SvgPicture.asset(wads[ind].iconPath,
                        height: 120,
                        width: 120),
                      ),
                      Text(
                        wads[ind].name,
                        style: GoogleFonts.prompt(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.center,
                        softWrap: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                        child: Text(
                          location,
                          style: GoogleFonts.prompt(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                          softWrap: true,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, ind) => const SizedBox(width: 25,),
            itemCount: wads.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(
              left: 20,
              right: 20
            ),
          ),
        )
      ],
    );
  }
}