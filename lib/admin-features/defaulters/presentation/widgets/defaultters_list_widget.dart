import 'package:flutter/cupertino.dart';
import 'package:housewise/admin-components/notification_card.dart';

class DefaulttersListWidget extends StatelessWidget {
  const DefaulttersListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 16),
      itemCount: defaulters.length,
      itemBuilder: (context, index) {
        final defaulter = defaulters[index];
        return NotificationCard(
          name: defaulter.name,
          amount: defaulter.amount,
          status: defaulter.status,
          day: defaulter.day,
          dayOfWeek: defaulter.dayOfWeek,
        );
      },
    );
  }
}

class DefaulterModel {
  final String name;
  final double amount;
  final String status;
  final int day;
  final String dayOfWeek;

  DefaulterModel({
    required this.name,
    required this.amount,
    required this.status,
    required this.day,
    required this.dayOfWeek,
  });
}

final List<DefaulterModel> defaulters = [
  DefaulterModel(
    name: 'Soban',
    amount: 321.3,
    status: 'unpaid',
    day: 25,
    dayOfWeek: 'MON',
  ),
  DefaulterModel(
    name: 'Aisha',
    amount: 450.0,
    status: 'unpaid',
    day: 24,
    dayOfWeek: 'SUN',
  ),
  DefaulterModel(
    name: 'James',
    amount: 210.5,
    status: 'unpaid',
    day: 23,
    dayOfWeek: 'SAT',
  ),
  DefaulterModel(
    name: 'Maria',
    amount: 625.8,
    status: 'unpaid',
    day: 22,
    dayOfWeek: 'FRI',
  ),
  DefaulterModel(
    name: 'Ahmed',
    amount: 180.2,
    status: 'unpaid',
    day: 21,
    dayOfWeek: 'THU',
  ),
  DefaulterModel(
    name: 'Sarah',
    amount: 340.0,
    status: 'unpaid',
    day: 20,
    dayOfWeek: 'WED',
  ),
  DefaulterModel(
    name: 'John',
    amount: 527.4,
    status: 'unpaid',
    day: 19,
    dayOfWeek: 'TUE',
  ),
  DefaulterModel(
    name: 'John',
    amount: 527.4,
    status: 'unpaid',
    day: 19,
    dayOfWeek: 'TUE',
  ),
];
