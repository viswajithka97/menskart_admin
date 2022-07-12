import 'package:flutter/cupertino.dart';
import 'package:menskart_admin/view/core/color_constants.dart';

class OrderDetailTextWidget extends StatelessWidget {
  final String heading;
  final String value;
  const OrderDetailTextWidget(
      {Key? key, required this.heading, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$heading : \n',
        style: const TextStyle(
            fontSize: 15, fontWeight: FontWeight.normal, color: kBlack),
        children: [
          TextSpan(
            text: '   $value',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
