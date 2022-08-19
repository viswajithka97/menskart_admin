import 'package:flutter/material.dart';
import 'package:menskart_admin/model/dashboard_model/dashboard_model.dart';
import 'package:menskart_admin/view/core/border_radius.dart';
import 'package:menskart_admin/view/core/color_constants.dart';
import 'package:menskart_admin/view/core/space_constants.dart';

class DashboardTopContainer extends StatelessWidget {
  final DashBoardModel? data;
  const DashboardTopContainer({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration:
          BoxDecoration(borderRadius: kBRadius10, color: kContainerGreen),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Total Profit',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '₹ ${data!.totalProfit.total}',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: kBRadius10,
                    color: kConOrange,
                  ),
                  child: const Icon(
                    Icons.shopping_cart_outlined,
                    color: kWhite,
                  ),
                )
              ],
            ),
            Row(
              children: const [
                CircleAvatar(
                  radius: 10,
                  child: Icon(
                    Icons.arrow_upward_rounded,
                    size: 12,
                  ),
                ),
                kWidth10,
                Text('Up From Yesterday')
              ],
            )
          ],
        ),
      ),
    );
  }
}
