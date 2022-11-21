import 'package:design_system/design_system.dart';
import 'package:design_system/lib/text/text_field_widget.dart';
import 'package:design_system/lib/text/text_title_widget.dart';
import 'package:flutter/cupertino.dart';

class WidgetResolver extends StatelessWidget {
  const WidgetResolver({
    Key? key,
    required this.widgetKey,
    required this.dsModel,
    this.onPressedButton, this.onFieldSubmitted,
  }) : super(key: key);
  final String widgetKey;
  final DsModel dsModel;
  final void Function()? onPressedButton;
  final void Function(String value)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    late Widget widgetChild;

    switch (widgetKey) {
      case 'appBar':
        widgetChild = CustomAppBar(
          title: dsModel.title,
          key: Key(widgetKey + key.toString()),
        );
        break;
      case 'card1':
        widgetChild = CustomCard1(
          title: dsModel.title,
          key: Key(widgetKey + key.toString()),
        );
        break;
      case 'card2':
        widgetChild = CustomCard2(
          title: dsModel.title,
          key: Key(widgetKey + key.toString()),
        );
        break;
      case 'card3':
        widgetChild = CustomCard3(
          title: dsModel.title,
          key: Key(widgetKey + key.toString()),
        );
        break;
      case 'navButton':
        widgetChild = NavButton(
          title: dsModel.title,
          onPressed: onPressedButton,
          key: Key(widgetKey + key.toString()),
        );
        break;
      case 'navBlankButton':
        widgetChild = NavBlankButton(
          title: dsModel.title,
          onPressed: onPressedButton,
          key: Key(widgetKey + key.toString()),
        );
        break;
      case 'row':
        widgetChild = RowWidget(
          key: Key(widgetKey + key.toString()),
          children: List<Widget>.generate(
              dsModel.widgetList.length,
              (index) =>
                  WidgetResolver(widgetKey: dsModel.widgetList[index].widgetId, dsModel: dsModel.widgetList[index])),
        );
        break;
      case 'textTitle':
        widgetChild = TextTitleWidget(
          key: Key(widgetKey + key.toString()),
          title: dsModel.title,
        );
        break;
      case 'textField':
        widgetChild = TextFieldWidget(
          key: Key(widgetKey + key.toString()),
          onFieldSubmitted: onFieldSubmitted,
        );
        break;
      default:
        widgetChild = SizedBox.shrink(
          child: SizedBox(
            height: dsModel.paddingVertical,
            width: dsModel.paddingHorizontal,
          ),
        );
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: dsModel.paddingVertical, horizontal: dsModel.paddingHorizontal),
      child: widgetChild,
    );
  }
}
