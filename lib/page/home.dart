import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_hcrl/model/category_model.dart';
import 'package:project_hcrl/model/fortuneteller_model.dart';
import 'package:project_hcrl/model/wad_model.dart';
import 'package:project_hcrl/widget/categories_widget.dart';
import 'package:project_hcrl/widget/wad_widget.dart';      
import 'package:project_hcrl/widget/teller_widget.dart'; 

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<WadModel> wads = [];
  List<FortuneTellerModel> tellers = [];
  final TextEditingController _searchController = TextEditingController();

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
        children: [
          const SizedBox(height: 20,),
          CategoriesWidget(),
          const SizedBox(height: 20,),
          WadWidget(),
          const SizedBox(height: 20,),
          TellerWidget(),
          const SizedBox(height: 20,),
        ],
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
    );
  }
}
