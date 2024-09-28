import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_hcrl/model/category_model.dart';
import 'package:project_hcrl/page/PredictionPage.dart';

class CategoriesWidget extends StatelessWidget {
  final List<CategoryModel> categories = CategoryModel.getCategories(); // ข้อมูลหมวดหมู่

  CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
}