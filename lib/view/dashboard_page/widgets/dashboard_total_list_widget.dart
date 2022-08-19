import 'package:flutter/cupertino.dart';
import 'package:menskart_admin/model/dashboard_model/dashboard_model.dart';
import 'package:menskart_admin/view/core/border_radius.dart';
import 'package:menskart_admin/view/core/color_constants.dart';
import 'package:menskart_admin/view/core/space_constants.dart';

class DashBoardTotalWidget extends StatelessWidget {
  final DashBoardModel? data;
  const DashBoardTotalWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> list = ['Total Orders', 'Total Sales', 'Total Users'];
    final List<String> list2 = [
      data!.total.count.toString(),
      data!.totalSales.count.toString(),
      data!.users.count.toString()
    ];

    return Column(
      children: [
        kHeight10,
        ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
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
                        '${list[index]} :',
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        list2[index],
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
