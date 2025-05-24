import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String name;
  final String country;
  final VoidCallback? onTap;

  const CustomCard({
    super.key,
    required this.name,
    required this.country,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? _iosCard() : _androidCard(context);
  }

  Widget _iosCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onTap,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: CupertinoColors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: CupertinoColors.systemGrey3,
                blurRadius: 3,
                spreadRadius: 1,
              ),
            ],
          ),
          padding: const EdgeInsets.all(12.0),
          child: _cardContent(),
        ),
      ),
    );
  }

  Widget _androidCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12.0),
            child: _cardContent(),
          ),
        ),
      ),
    );
  }

  Widget _cardContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
        ),
        const SizedBox(height: 8),
        Text(
          'País de origen: $country',
          style: const TextStyle(fontSize: 14, color: Colors.blueGrey),
        ),
      ],
    );
  }
}
