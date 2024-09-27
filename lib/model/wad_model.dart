import 'package:flutter/material.dart';

class SubtopicModel {
  String subtopic;
  String result;

  SubtopicModel({
    required this.subtopic,
    required this.result,
  });
}

class WadModel {
  String name;
  String iconPath;
  Color boxColor;
  String pic1;
  String pic2;
  String lo;
  List<SubtopicModel> subtopics;

  WadModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
    required this.pic1,
    required this.pic2,
    required this.lo,
    required this.subtopics,
  });

  static List<WadModel> getWad() {
    List<WadModel> wads = [];

    wads.add(
      WadModel(
        name: 'Temple of the Emerald Buddha',
        iconPath: 'assets/icons/3.svg',
        boxColor: const Color.fromARGB(255, 204, 231, 255),
        pic1: 'assets/pic/1-1.jpg',
        pic2: 'assets/pic/1-2.jpg',
        lo: '3G8tsrRftC5MSQLA8',
        subtopics: [
          SubtopicModel(
            subtopic: 'Location Details',
            result: 'Located in Phra Nakhon District, Bangkok.',
          ),
          SubtopicModel(
            subtopic: 'Common Prayers',
            result: 'Prayers for prosperity and stability in life.',
          ),
        ],
      ),
    );

    wads.add(
      WadModel(
        name: 'Phra That Doi Suthep Temple',
        iconPath: 'assets/icons/1.svg',
        boxColor: const Color.fromARGB(255, 221, 237, 251),
        pic1: 'assets/pic/2-1.jpg',
        pic2: 'assets/pic/2-2.jpg',
        lo: 'PcxeoJ7qzKJwDVXY7',
        subtopics: [
          SubtopicModel(
            subtopic: 'Location Details',
            result: 'Located in Mueang District, Chiang Mai Province.',
          ),
          SubtopicModel(
            subtopic: 'Common Prayers',
            result: 'Prayers for health, well-being, and long life.',
          ),
        ],
      ),
    );

    wads.add(
      WadModel(
        name: 'Temple of Dawn',
        iconPath: 'assets/icons/new-icon.svg',
        boxColor: const Color.fromARGB(255, 204, 231, 255),
        pic1: 'assets/pic/3-1.jpg',
        pic2: 'assets/pic/3-2.jpg',
        lo: 'V9JuaPJKaqU3p6r99',
        subtopics: [
          SubtopicModel(
            subtopic: 'Location Details',
            result: 'Located in Bangkok Yai District, Bangkok.',
          ),
          SubtopicModel(
            subtopic: 'Common Prayers',
            result: 'Prayers for new beginnings and personal growth.',
          ),
        ],
      ),
    );

    wads.add(
      WadModel(
        name: 'Erawan Shrine',
        iconPath: 'assets/icons/4.svg',
        boxColor: const Color.fromARGB(255, 221, 237, 251),
        pic1: 'assets/pic/4-1.jpg',
        pic2: 'assets/pic/4-2.jpg',
        lo: 'gNpox3hpJ3BtDiPZ9',
        subtopics: [
          SubtopicModel(
            subtopic: 'Location Details',
            result: 'Located at Ratchaprasong Intersection, Bangkok.',
          ),
          SubtopicModel(
            subtopic: 'Common Prayers',
            result: 'Prayers for success in business and financial fortune.',
          ),
        ],
      ),
    );

    return wads;
  }
}