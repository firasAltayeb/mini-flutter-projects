import 'package:flutter/material.dart';

import '../app_constants.dart';
import '../utility/size_config.dart';

class SmallListTile extends StatelessWidget {
  const SmallListTile({
    required this.function,
    required this.icon,
    required this.text,
    super.key,
  });

  final void Function() function;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: SizeConfig.scaledHeight(7),
        width: SizeConfig.scaledWidth(39),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.green[500],
          borderRadius: AppConstants.circleRadius,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            SizedBox(
              width: SizeConfig.scaledWidth(4),
            ),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.scaledHeight(2.25),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
