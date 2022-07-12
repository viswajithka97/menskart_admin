import 'package:flutter/cupertino.dart';
import 'package:menskart_admin/view/core/border_radius.dart';
import 'package:menskart_admin/view/core/color_constants.dart';
import 'package:menskart_admin/view/core/space_constants.dart';

class DashBoardTotalWidget extends StatelessWidget {
  DashBoardTotalWidget({Key? key}) : super(key: key);

  final List<String> _list = ['Total Orders', 'Total Sales', 'Total Users'];
  final List<String> _list2 = ['101', '26', '5'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kHeight10,
        ListView.separated(
            shrinkWrap: true,
            itemCount: 3,
            separatorBuilder: (context, index) => kHeight10,
            itemBuilder: (context, index) {
              return Container(
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: kBRadius10, color: kBackgroundGrey),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${_list[index]} :',
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        _list2[index],
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              );
            })
      ],
    );
  }
}
