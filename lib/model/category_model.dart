import 'package:flutter/material.dart';

class SubtopicModel {
  String subtopic;
  List<String> results;

  SubtopicModel({
    required this.subtopic,
    required this.results,
  });
}

class CategoryModel {
  String name;
  String description;
  String iconPath;
  Color boxColor;
  List<SubtopicModel> subtopics;

  CategoryModel({
    required this.name,
    required this.description,
    required this.iconPath,
    required this.boxColor,
    required this.subtopics,
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(
      CategoryModel(
        name: 'Horoscope',
        description: 'Daily insights based on your zodiac.',
        iconPath: 'assets/pic/horoscope.png',
        boxColor: const Color.fromARGB(255, 220, 141, 240),
        subtopics: [
          SubtopicModel(
            subtopic: 'Love',
            results: [
              'A surprise romantic gesture awaits you today.',
              'You may feel misunderstood in love; communication is key.',
              'An old flame could reignite under unexpected circumstances.',
              'You will experience a deep connection with your partner today.',
              'Single? Someone may be silently admiring you.'
            ],
          ),
          SubtopicModel(
            subtopic: 'Career & Money',
            results: [
              'A new project at work could lead to financial gains.',
              'Expect a small bonus or unexpected income today.',
              'It’s a great day to focus on networking for career growth.',
              'Be cautious with your spending; small expenses may add up.',
              'A colleague might offer you valuable advice today.'
            ],
          ),
          SubtopicModel(
            subtopic: 'Health',
            results: [
              'Take extra care of your mental health today; rest if needed.',
              'Your energy levels will be high—perfect for starting new fitness routines.',
              'A balanced diet will make a big difference today.',
              'Don’t ignore small health signals; visit the doctor if necessary.',
              'You’ll feel rejuvenated after some outdoor exercise.'
            ],
          ),
          SubtopicModel(
            subtopic: 'Luck',
            results: [
              'Today is a lucky day for solving long-standing problems.',
              'A missed opportunity may resurface with better potential.',
              'Lucky numbers today: 3, 7, and 9.',
              'You’ll find luck in unexpected places—stay alert.',
              'Take a chance on something new, luck will follow.'
            ],
          ),
          SubtopicModel(
            subtopic: 'General',
            results: [
              'A friend might bring good news your way.',
              'An opportunity to learn something new will appear today.',
              'Today will bring moments of joy in small interactions.',
              'You’ll feel unusually creative today—embrace it.',
              'A small challenge today will lead to long-term rewards.'
            ],
          ),
        ],
      ),
    );

    categories.add(
      CategoryModel(
        name: 'Tarot Reading',
        description: 'Guidance through tarot card readings.',
        iconPath: 'assets/pic/tarot-card.png',
        boxColor: const Color.fromARGB(255, 236, 192, 247),
        subtopics: [
          SubtopicModel(
            subtopic: 'Love',
            results: [
              'Your relationship will grow stronger through shared experiences this month.',
              'Expect some emotional ups and downs in your love life.',
              'An unexpected romantic opportunity may come your way.',
              'Single? You may meet someone with long-term potential this month.',
              'Be patient with your partner; understanding will bring harmony.'
            ],
          ),
          SubtopicModel(
            subtopic: 'Career & Money',
            results: [
              'This month brings a chance to advance in your career through hard work.',
              'Financial stability is on the horizon; stay focused.',
              'A new job offer might align with your long-term goals.',
              'Beware of impulsive spending—it could lead to financial stress.',
              'This is a good month to invest in your skills and education.'
            ],
          ),
          SubtopicModel(
            subtopic: 'Health',
            results: [
              'Focus on building healthier habits for long-term benefits.',
              'Physical exercise will improve your mental clarity this month.',
              'Minor health issues may arise, but nothing too concerning.',
              'You’ll feel stronger if you balance work and rest properly.',
              'Pay attention to your nutrition; it will impact your energy levels.'
            ],
          ),
          SubtopicModel(
            subtopic: 'Luck',
            results: [
              'A lucky break may come your way mid-month.',
              'You’ll experience a stroke of good fortune in your social life.',
              'Lucky colors this month: green and blue.',
              'Take calculated risks; fortune favors the bold.',
              'Your charm will attract positive opportunities.'
            ],
          ),
          SubtopicModel(
            subtopic: 'General',
            results: [
              'This month brings unexpected changes—embrace the flow.',
              'You will find peace in routine activities this month.',
              'Challenges this month will help you grow in ways you didn’t expect.',
              'New friendships could blossom, bringing fresh energy into your life.',
              'An opportunity to travel may come up—take it if you can.'
            ],
          ),
        ],
      ),
    );

    categories.add(
      CategoryModel(
        name: 'Numerology',
        description: 'Discover the meaning behind your numbers.',
        iconPath: 'assets/pic/numerology.png',
        boxColor: const Color.fromARGB(255, 220, 141, 240),
        subtopics: [
          SubtopicModel(
            subtopic: 'Love',
            results: [
              'Long-term relationships may face a test, but with growth comes strength.',
              'This year, love will be about finding balance and deep connection.',
              'A whirlwind romance may sweep you off your feet.',
              'Single? The end of the year brings promising romantic prospects.',
              'Your love life will see gradual progress, with meaningful conversations.'
            ],
          ),
          SubtopicModel(
            subtopic: 'Career & Money',
            results: [
              'Career growth is steady this year; focus on learning new skills.',
              'Financial rewards may be slow, but they will come with consistency.',
              'A major career shift could occur—embrace the change.',
              'Money management will be key to securing your future this year.',
              'You might receive a promotion or significant recognition in your field.'
            ],
          ),
          SubtopicModel(
            subtopic: 'Health',
            results: [
              'A steady focus on fitness will bring you great results over the year.',
              'Mental well-being is just as important as physical health this year.',
              'Minor health issues will surface—deal with them promptly.',
              'This year will bring improvements to your overall vitality.',
              'Regular health checkups will help you maintain good health.'
            ],
          ),
          SubtopicModel(
            subtopic: 'Luck',
            results: [
              'The second half of the year will bring a lucky financial turn.',
              'Unexpected opportunities will come from new acquaintances.',
              'Luck is on your side when it comes to personal relationships.',
              'Your intuition will guide you to lucky decisions.',
              'Take bold risks early in the year for great rewards.'
            ],
          ),
          SubtopicModel(
            subtopic: 'General',
            results: [
              'This year is about self-discovery and personal growth.',
              'You will achieve something you’ve been working towards for years.',
              'A significant change in your life will bring unexpected happiness.',
              'Stay open-minded; this year will offer new perspectives.',
              'Balance and harmony will be key to a successful year.'
            ],
          ),
        ],
      ),
    );

    categories.add(
      CategoryModel(
        name: 'Fortune Sticks',
        description: 'Unlock your fortune with ancient wisdom.',
        iconPath: 'assets/pic/fortunestrick.png',
        boxColor: const Color.fromARGB(255, 236, 192, 247),
        subtopics: [
          SubtopicModel(
            subtopic: 'Love',
            results: [
              'You’ll face a decision that will change your love life.',
              'A new love interest may enter your life soon.',
              'Your current relationship will grow with mutual understanding.',
              'This is not the right time to rush into romance.',
              'Expect a positive change in your love life soon.'
            ],
          ),
          SubtopicModel(
            subtopic: 'Career & Money',
            results: [
              'An unexpected opportunity for growth is around the corner.',
              'Now is a good time to save money for future plans.',
              'A career change may come with financial benefits.',
              'Your efforts will soon be rewarded with a promotion.',
              'Financial challenges will pass, bringing stability.'
            ],
          ),
          SubtopicModel(
            subtopic: 'Health',
            results: [
              'Take care of your health; small changes will make a big difference.',
              'You’ll feel stronger if you take time to relax.',
              'Your body will benefit from better nutrition this month.',
              'It’s a good time to start a new health routine.',
              'Make rest a priority to avoid burnout.'
            ],
          ),
          SubtopicModel(
            subtopic: 'Luck',
            results: [
              'A good fortune is coming your way—stay positive.',
              'The numbers 5, 9, and 12 will bring you luck today.',
              'Luck will come from someone you least expect.',
              'Good luck will follow you in financial matters.',
              'This week, luck will be in your favor with new beginnings.'
            ],
          ),
          SubtopicModel(
            subtopic: 'General',
            results: [
              'A new opportunity will appear soon; be ready.',
              'You’ll meet someone who will impact your future positively.',
              'Challenges today will lead to great success tomorrow.',
              'Your intuition will guide you in an important decision.',
              'A pleasant surprise is in store for you soon.'
            ],
          ),
        ],
      ),
    );
    return categories;
  }
}
