import 'package:flutter/cupertino.dart';
import 'package:menskart_admin/view/core/border_radius.dart';

class GraphWidget extends StatelessWidget {
  const GraphWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: kBRadius10,
        image: const DecorationImage(
            image: AssetImage('assets/images/Monthly spending.jpg'),
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover),
      ),
    );
  }
}
