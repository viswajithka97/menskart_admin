import 'package:flutter/cupertino.dart';
import 'package:menskart_admin/view/core/color_constants.dart';

class UserDetailsTextWidget extends StatelessWidget {
  final String heading;
  final String value;
  const UserDetailsTextWidget({
    Key? key,
    required this.heading,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$heading : \n',
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: kBlack),
        children: [
          TextSpan(
            text: '   $value',
            style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
