import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_hcrl/model/fortuneteller_model.dart';
import 'package:project_hcrl/page/tellerPage.dart';

class TellerWidget extends StatelessWidget {
  final List<FortuneTellerModel> tellers = FortuneTellerModel.getFortuneTellers();

  TellerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Fortune Tellers',
            style: GoogleFonts.prompt(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        const SizedBox(height: 15,),
        ListView.separated(
          itemCount: tellers.length,
          shrinkWrap: true,
          separatorBuilder: (context, ind) => const SizedBox(height: 25,),
          padding: const EdgeInsets.only(left: 20, right: 20),
          itemBuilder: (context, ind) {
            return GestureDetector(
              onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return TellerPage(teller: tellers[ind],); // ไปหน้าแสดงรายละเอียดผู้พยากรณ์
                  }));
                },
              child: Container(
                height: 115,
                decoration: BoxDecoration(
                  color: Colors.pink[100],
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.07),
                      offset: const Offset(0, 10),
                      blurRadius: 40,
                      spreadRadius: 0
                    )
                  ]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Image.asset(tellers[ind].iconPath, height: 90,),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${tellers[ind].name} ✦ ${tellers[ind].accuracyScore.toStringAsFixed(1)}',
                              style: GoogleFonts.prompt(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Text(
                          tellers[ind].expertise,
                          style: GoogleFonts.prompt(
                            color: Colors.black,
                            fontSize: 13
                          ),
                        ),
                        Text(
                          tellers[ind].consultation,
                          style: GoogleFonts.prompt(
                            color: Colors.black,
                            fontSize: 13
                          ),
                        )
                      ],
                    ),
                    SvgPicture.asset(
                      'assets/icons/button.svg',
                      height: 30,
                      width: 30,
                    )
                  ],
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
