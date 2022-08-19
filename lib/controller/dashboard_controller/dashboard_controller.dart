import 'package:get/get.dart';
import 'package:menskart_admin/controller/dashboard_controller/dashboard_services/dashboard_services.dart';
import 'package:menskart_admin/model/dashboard_model/dashboard_model.dart';

class DashBoardController extends GetxController {
  DashBoardModel? allData;
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    try {
      final response = await DashBoardServics().getData();
      if (response!.statusCode == 200) {
        final data = dashBoardModelFromJson(response.data);
        allData = data;
        update(); 
      } else {
        print(response.statusCode);
      }
    } catch (e) {}
  }
}
