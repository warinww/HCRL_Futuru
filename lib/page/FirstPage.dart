// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_hcrl/page/home.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  // late Animation<double> _animation;

  List<String> dayList = List<String>.generate(31, (index) => (index + 1).toString());
  List<String> monthList = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
  List<String> yearList = List<String>.generate(2024 - 1920 + 1, (index) => (1920 + index).toString());

  String _dayValue = '1';
  String _monthValue = 'January';
  String _yearValue = '1920';

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();

    // _animation = CurvedAnimation(
    //   parent: _controller,
    //   curve: Curves.linear,
    // );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildDropdown(String value, List<String> items, ValueChanged<String?> onChanged) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: DropdownButton<String>(
        value: value,
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(item, style: GoogleFonts.prompt(fontSize: 14),),
            ),
          );
        }).toList(),
        onChanged: onChanged,
        underline: Container(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 255, 237, 156),
              Color.fromARGB(255, 236, 192, 247),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 200),
          child: Center(
            child: Stack(
              children: [
                Column(
                  children: [
                    // AnimatedBuilder(
                    //   animation: _animation,
                    //   child: Image.asset(
                    //     'assets/pic/magic-ball.png',
                    //     height: 200,
                    //     width: 200,
                    //   ),
                    //   builder: (context, child) {
                    //     return Transform.rotate(
                    //       angle: _animation.value * 2.0 * pi,
                    //       child: child,
                    //     );
                    //   },
                    // ),
                    Image.asset(
                      'assets/pic/magic-ball.png',
                      height: 200,
                      width: 200,
                    ),
                    const SizedBox(height: 30),
                    Text('✦ Welcome to Futuru ✦',
                        style: GoogleFonts.prompt(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Text('Are you ready to know your future?',
                        style: GoogleFonts.prompt(fontSize: 16)),
                    const SizedBox(height: 30),
                    Text('Filled your birthday', style: GoogleFonts.prompt(fontSize: 14)),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                   
                        _buildDropdown(_dayValue, dayList, (String? newValue) {
                          setState(() {
                            _dayValue = newValue!;
                          });
                        }),
                        const SizedBox(width: 10),
                        
                        _buildDropdown(_monthValue, monthList, (String? newValue) {
                          setState(() {
                            _monthValue = newValue!;
                          });
                        }),
                        const SizedBox(width: 10),
                    
                        _buildDropdown(_yearValue, yearList, (String? newValue) {
                          setState(() {
                            _yearValue = newValue!;
                          });
                        }),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return const HomePage();
                          }));
                        },
                        child: Text('Start', style: GoogleFonts.prompt(fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}