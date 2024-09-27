import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_hcrl/model/category_model.dart';
import 'package:project_hcrl/model/fortuneteller_model.dart';
import 'package:project_hcrl/model/wad_model.dart';
import 'package:project_hcrl/page/PredictionPage.dart';
import 'package:project_hcrl/page/WadPage.dart';
import 'package:project_hcrl/page/tellerPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<WadModel> wads = [];
  List<FortuneTellerModel> tellers = [];
  TextEditingController _searchController = TextEditingController();

  void _getInitialInfo() {
    categories = CategoryModel.getCategories();
    wads = WadModel.getWad();
    tellers = FortuneTellerModel.getFortuneTellers();
  }

  void updateList(String value) {
    setState(() {
      tellers = FortuneTellerModel.getFortuneTellers().where((teller) {
        return teller.name.toLowerCase().contains(value.toLowerCase());
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _getInitialInfo();
    _searchController.addListener(() {
      updateList(_searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.yellow[50],
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // _searchField(),
          const SizedBox(height: 20,),
          _categoriesSection(),
          const SizedBox(height: 20,),
          _wadSection(),
          const SizedBox(height: 20,),
          _tellerSection(),
          const SizedBox(height: 20,),
        ],
      ),
    );
  }

  Column _categoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Category',
            style: GoogleFonts.prompt(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 15,),
        SizedBox(
          height: 180,
          child: ListView.separated(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, right: 20),
            separatorBuilder: (context, ind) => const SizedBox(width: 25,),
            itemBuilder: (context, ind) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PredictionPage(category: categories[ind]);
                  }));
                },
                child: Container(
                  width: 140,
                  decoration: BoxDecoration(
                    color: categories[ind].boxColor.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(categories[ind].iconPath),
                        ),
                      ),
                      Text(
                        categories[ind].name,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.prompt(
                          color: Colors.black, 
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                        child: Text(
                          categories[ind].description,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.prompt(
                            color: Colors.black,
                            fontSize: 12
                          ),
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Column _tellerSection() {
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
                    return TellerPage(teller: tellers[ind],);
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

  Column _wadSection() {
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

  Container _searchField() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
      child: TextField(
        controller: _searchController,
        style: GoogleFonts.prompt(
          fontSize: 15,
          color: Colors.black,
          fontWeight: FontWeight.normal,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(10),
          hintText: "Search fortune teller's name",
          hintStyle: GoogleFonts.prompt(
            fontSize: 15, color: Colors.grey
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset('assets/icons/search.svg',
              height: 5,
              width: 5,),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.black, width: 5)
          )
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text('✦ Futuru ✦',
        style: GoogleFonts.prompt(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black
        )),
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