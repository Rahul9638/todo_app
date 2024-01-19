import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/modules/utils/svg_assets.dart';

class NoEmployeeFoundWidget extends StatelessWidget {
  const NoEmployeeFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(SvgAssetPath.noEmployee),
          Text(
            'No employee records found',
            style: theme.textTheme.titleSmall,
          )
        ],
      ),
    );
  }
}
