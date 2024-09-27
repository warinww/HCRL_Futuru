// import 'package:flutter/material.dart';

class SubtopicModel {
  String subtopic;
  String result;

  SubtopicModel({
    required this.subtopic,
    required this.result,
  });
}

class FortuneTellerModel {
  String name;
  String iconPath;
  String expertise;
  List<String> contactMethods;
  double accuracyScore;
  String consultation;

  FortuneTellerModel({
    required this.name,
    required this.iconPath,
    required this.expertise,
    required this.contactMethods,
    required this.accuracyScore,
    required this.consultation,
  });

  static List<FortuneTellerModel> getFortuneTellers() {
    List<FortuneTellerModel> fortuneTellers = [];

    fortuneTellers.add(
      FortuneTellerModel(
        name: 'Ananya',
        iconPath: 'assets/pic/wm1.png',
        expertise: 'Love, Career & Money',
        contactMethods: [
          'Phone: 080-123-4567',
          'Line ID: ananya123',
          'Facebook: fb.com/ananya',
        ],
        accuracyScore: 9.5,
        consultation : 'Online Consultation',
      ),
    );

    fortuneTellers.add(
      FortuneTellerModel(
        name: 'Panya',
        iconPath: 'assets/pic/wm2.png',
        expertise: 'Career & Money, Health',
        contactMethods: [
          'Phone: 090-987-6543',
          'Instagram: @panya_fortune',
        ],
        accuracyScore: 8.0,
        consultation : 'In-person Consultation',
      ),
    );

    fortuneTellers.add(
      FortuneTellerModel(
        name: 'Somchai',
        iconPath: 'assets/pic/m1.png',
        expertise: 'Luck, General',
        contactMethods: [
          'Phone: 070-555-1234',
          'Line ID: somchai123',
        ],
        accuracyScore: 7.5,
        consultation : 'Online Consultation',
      ),
    );

    fortuneTellers.add(
      FortuneTellerModel(
        name: 'Jasmine',
        iconPath: 'assets/pic/wm3.png',
        expertise: 'Love, Health',
        contactMethods: [
          'Phone: 075-444-7890',
          'Facebook: fb.com/jasmine',
        ],
        accuracyScore: 9.0,
        consultation : 'In-preson Consultation',
      ),
    );

    fortuneTellers.add(
      FortuneTellerModel(
        name: 'Nattapong',
        iconPath: 'assets/pic/m2.png',
        expertise: 'Career & Money, Health',
        contactMethods: [
          'Phone: 080-333-2222',
          'Line ID: nattapong89',
        ],
        accuracyScore: 8.5,
        consultation : 'Online Consultation',
      ),
    );
    return fortuneTellers;
  }
}