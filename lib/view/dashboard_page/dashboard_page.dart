import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart_admin/controller/dashboard_controller/dashboard_controller.dart';
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
      body: GetBuilder<DashBoardController>(
        init: DashBoardController(),
        builder: (controller) {
          if (controller.allData == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: [
                kHeight10,
                DashboardTopContainer(data: controller.allData),
                kHeight10,
                GraphWidget(data: controller.allData),
                DashBoardTotalWidget(data: controller.allData),
              ],
            ),
          ));
        },
      ),
    );
  }
}
