import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:loginformapp/pallete.dart';

class SocialButton extends StatelessWidget {
  final String iconPath;
  final String label;
  
  const SocialButton({
    super.key,
    required this.iconPath,
    required this.label,
    
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      icon: SvgPicture.asset(
        iconPath,
        width: 25,
        color: Pallete.whiteColor,
      ),
      label: Text(
        label,
        style: const TextStyle(
          color: Pallete.whiteColor,
          fontSize: 17,
        ),
      ),
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 30 ),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Pallete.borderColor,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}