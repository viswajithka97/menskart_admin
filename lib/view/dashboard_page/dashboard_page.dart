import 'package:flutter/material.dart';
import 'package:menskart_admin/view/core/space_constants.dart';
import 'package:menskart_admin/view/dashboard_page/widgets/dashboard_top_container.dart';
import 'package:menskart_admin/view/dashboard_page/widgets/dashboard_total_list_widget.dart';
import 'package:menskart_admin/view/dashboard_page/widgets/graph_widget.dart';
import 'package:menskart_admin/view/widgets/drawer.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const DrawerWidget(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            kHeight10,
            const DashboardTopContainer(),
            kHeight10,
            const GraphWidget(),
            DashBoardTotalWidget()
          ],
        ),
      )),
    );
  }
}
