import 'package:flutter/material.dart';

class CustomGridCard extends StatelessWidget {
  final String name;
  final String country;
  final VoidCallback? onTap;

  const CustomGridCard({
    super.key,
    required this.name,
    required this.country,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: _containerGrid(context),
    );
  }

  Container _containerGrid(BuildContext context) {
    return Container(
      decoration: _boxDecorationGrid(context),
      padding: const EdgeInsets.all(12),
      child: _columnGrid(),
    );
  }

  BoxDecoration _boxDecorationGrid(BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).cardColor,
      borderRadius: BorderRadius.circular(10),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 4,
          offset: Offset(0, 2),
        ),
      ],
    );
  }

  Column _columnGrid() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Text(
          'País: $country',
          style: const TextStyle(fontSize: 12, color: Colors.blueGrey),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
