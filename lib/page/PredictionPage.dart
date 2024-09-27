import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_hcrl/model/category_model.dart';
import 'dart:math';

class PredictionPage extends StatefulWidget {
  final CategoryModel category;

  const PredictionPage({super.key, required this.category});

  @override
  _PredictionPageState createState() => _PredictionPageState();
}

class _PredictionPageState extends State<PredictionPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isLoading = true;

  List<String> colorr = ['255, 248, 211, 226',
  '255, 244, 212, 192',
  '255, 192, 234, 244',
  '255, 194, 244, 206',
  '255, 255, 255, 255'];

  Color parseColor(String colorString) {
    List<String> colorValues = colorString.split(',').map((s) => s.trim()).toList();
    return Color.fromARGB(
      int.parse(colorValues[0]),
      int.parse(colorValues[1]),
      int.parse(colorValues[2]),
      int.parse(colorValues[3]),
    );
  }



  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final random = Random();

    return Scaffold(
      appBar: _appBar(context),
      backgroundColor: Colors.yellow[50],
      body: _isLoading
          ? _buildLoadingScreen()
          : _buildContent(random),
    );
  }

  Widget _buildLoadingScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 230,),
          Text(
            'Loading...',
            style: GoogleFonts.prompt(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 20,),
          Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Center(
              child: AnimatedBuilder(
                animation: _controller,
                child: Image.asset(
                  widget.category.iconPath,
                  height: 110,
                  width: 110,
                ),
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _controller.value * 2 * pi,
                    child: child,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(Random random) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Center(
              child: Text(
                widget.category.name,
                style: GoogleFonts.prompt(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: AnimatedBuilder(
                    animation: _controller,
                    child: Image.asset(
                      widget.category.iconPath,
                      height: 90,
                      width: 90,
                    ),
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: _controller.value * 2 * pi,
                        child: child,
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: ListView.builder(
                itemCount: widget.category.subtopics.length + 1,
                itemBuilder: (context, index) {
                  if (index == widget.category.subtopics.length) {
                    return const SizedBox(height: 20);
                  }

                  final randomResultIndex = random.nextInt(widget.category.subtopics[index].results.length);
                  final randomResult = widget.category.subtopics[index].results[randomResultIndex];

                  final colorIndex = index % colorr.length;
                  final assignedColor = parseColor(colorr[colorIndex]);

                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: assignedColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.category.subtopics[index].subtopic,
                            style: GoogleFonts.prompt(fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            randomResult,
                            style: GoogleFonts.prompt(fontSize: 14, color: Colors.grey[800]),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      );
  }

  AppBar _appBar(BuildContext context) {
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