import 'package:flutter/material.dart';

class DashboardContainer extends StatelessWidget {
  final IconData? icon;
  final String text;
  final VoidCallback? onTap;

  const DashboardContainer({
    this.icon,
    required this.text,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      height: MediaQuery.of(context).size.height * .075,
      width: MediaQuery.of(context).size.width,
      child: GestureDetector(
        onTap: onTap,
        // Perform your actions here

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              size: 22, // Increase the icon size
            ),
            Text(
              text,
              style: const TextStyle(fontSize: 14),
            ),
            const Icon(
              size: 22,
              Icons.keyboard_arrow_right,
            )
          ],
        ),
      ),
    );
  }
}
