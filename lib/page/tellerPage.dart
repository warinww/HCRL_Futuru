import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_hcrl/model/fortuneteller_model.dart';

class TellerPage extends StatefulWidget {
  final FortuneTellerModel teller;

  const TellerPage({super.key, required this.teller});

  @override
  State<TellerPage> createState() => _TellerPageState();
}

class _TellerPageState extends State<TellerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.yellow[50],
      body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 20),
          child: Center(
            child: Container(
              child: Image.asset(
                widget.teller.iconPath,
                height: 250,
              ),
            ),
          ),
        ),
        Center(
          child: Text(
            widget.teller.name,
            style: GoogleFonts.prompt(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, top: 30, right: 20),
          padding: const EdgeInsets.all(16.0),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Rating : ',
                    style: GoogleFonts.prompt(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.teller.accuracyScore.toString(),
                    style: GoogleFonts.prompt(fontSize: 15),
                  ),
                  const SizedBox(width: 5),
                  Image.asset(
                    'assets/pic/star.png',
                    height: 18,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    'Expertise : ',
                    style: GoogleFonts.prompt(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.teller.expertise,
                    style: GoogleFonts.prompt(fontSize: 15),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "Consultation's type : ",
                    style: GoogleFonts.prompt(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.teller.consultation,
                    style: GoogleFonts.prompt(fontSize: 15),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Text(
                'Contact Methods:',
                style: GoogleFonts.prompt(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.teller.contactMethods.map((contact) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    contact,
                    style: GoogleFonts.prompt(fontSize: 15),
                  ),
                );
              }).toList(),
              )
            ],
          ),
        ),
      ],
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
}