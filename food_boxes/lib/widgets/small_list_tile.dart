import 'package:flutter/material.dart';

import '../app_constants.dart';
import '../utility/dimension_extensions.dart';

class SmallListTile extends StatelessWidget {
  const SmallListTile({
    super.key,
    required this.icon,
    required this.text,
    required this.function,
  });

  final IconData icon;
  final String text;
  final void Function() function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: context.percentHeight(7),
        width: context.percentWidth(39),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.green[500],
          borderRadius: AppConstants.circleRadius,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: context.percentHeight(2),
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
