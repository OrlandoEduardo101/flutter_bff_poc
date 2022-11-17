import 'package:design_system/design_system.dart';
import 'package:design_system/lib/buttons/nav_button.dart';
import 'package:design_system/lib/cards/custom_card_1.dart';
import 'package:design_system/lib/cards/custom_card_3.dart';
import 'package:design_system/lib/model/ds_model.dart';
import 'package:flutter/cupertino.dart';

import '../cards/custom_card_2.dart';

class WidgetResolver extends StatelessWidget {
  const WidgetResolver({
    Key? key,
    required this.widgetKey,
    required this.dsModel,
    this.onPressedButton,
  }) : super(key: key);
  final String widgetKey;
  final DsModel dsModel;
  final void Function()? onPressedButton;

  @override
  Widget build(BuildContext context) {
    switch (widgetKey) {
      case 'appBar':
        return CustomAppBar(
          title: dsModel.title,
          key: Key(widgetKey + key.toString()),
        );
      case 'card1':
        return CustomCard1(
          title: dsModel.title,
          key: Key(widgetKey + key.toString()),
        );
      case 'card2':
        return CustomCard2(
          title: dsModel.title,
          key: Key(widgetKey + key.toString()),
        );
      case 'card3':
        return CustomCard3(
          title: dsModel.title,
          key: Key(widgetKey + key.toString()),
        );
      case 'navButton':
        return NavButton(
          title: dsModel.title,
          onPressed: onPressedButton,
          key: Key(widgetKey + key.toString()),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
