import 'package:flutter/material.dart';

class PetElevattedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String text;
  final int? index; // Add this line

  const PetElevattedButton({super.key, 
    required this.onPressed,
    required this.icon,
    required this.text,
    this.index, // Add this line
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        elevation: 3,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          const SizedBox(height: 3),
          Text(text),
        ],
      ),
    );
  }
}
