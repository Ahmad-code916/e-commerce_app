import 'package:flutter/material.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({super.key, required this.name, required this.value});

  final String name;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: Text.rich(
        overflow: TextOverflow.ellipsis,
        TextSpan(
          text: '$name : ',
          children: [
            TextSpan(
              text: value,
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Colors.black),
            )
          ],
          style: const TextStyle(
              fontWeight: FontWeight.w700, fontSize: 15, color: Colors.black),
        ),
      ),
    );
  }
}
