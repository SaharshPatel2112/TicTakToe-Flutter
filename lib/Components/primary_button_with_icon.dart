import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrimaryButtonWithIcon extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  final String iconpath;
  const PrimaryButtonWithIcon({
    super.key,
    required this.buttonText,
    required this.onTap,
    required this.iconpath,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(iconpath, width: 30),
            SizedBox(width: 30),
            Text(
              buttonText,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
