import 'package:flutter/material.dart';

class NotificationsSection extends StatelessWidget {
  const NotificationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ItemNotificationCard(title:'title',image: 'image'),
      ],
    );
  }
}

class _ItemNotificationCard extends StatelessWidget {
  final String title;
  final String image;

  const _ItemNotificationCard({required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
