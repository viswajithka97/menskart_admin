import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart_admin/controller/user_management_controller/user_,management_controller.dart';
import 'package:menskart_admin/model/user_management_model/get_all_user_model.dart';
import 'package:menskart_admin/view/core/border_radius.dart';
import 'package:menskart_admin/view/core/color_constants.dart';
import 'package:menskart_admin/view/core/space_constants.dart';
import 'package:menskart_admin/view/products_list_page/widgets/container_confirm_button.dart';
import 'package:menskart_admin/view/user_management_page/widgets/user_details_text_widget.dart';

class UserDetailsWidget extends StatelessWidget {
  final User user;
  final int index;
  const UserDetailsWidget({Key? key, required this.user, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: kBRadius10, color: kBackgroundGrey),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      kHeight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          UserDetailsTextWidget(
                            heading: 'Name',
                            value: user.name,
                          ),
                          GetBuilder<UserController>(
                            init: UserController(),
                            builder: (controller) {
                              return controller.users![index].userBlock != true
                                  ? ContainerConfirmButton(
                                      height: 40,
                                      width: 80,
                                      radius: kBRadius30,
                                      buttonText: 'Block',
                                      buttonColor: kWhite,
                                      onpressed: () {
                                        Get.defaultDialog(
                                          title: 'Block User',
                                          content: const Text(
                                              'Are you sure you want to block this user?'),
                                          actions: [
                                            TextButton(
                                              child: const Text('Cancel'),
                                              onPressed: () {
                                                Get.back();
                                              },
                                            ),
                                            TextButton(
                                              child: const Text('Block'),
                                              onPressed: () {
                                                controller.blockUser(user.id);
                                                controller.update();
                                                controller.getAllUsers();
                                                controller.update();
                                                Get.back();
                                                // controller.update();
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    )
                                  : ContainerConfirmButton(
                                      height: 40,
                                      width: 80,
                                      radius: kBRadius30,
                                      buttonText: 'Unblock',
                                      buttonColor: kWhite,
                                      onpressed: () {
                                        Get.defaultDialog(
                                          title: 'Block User',
                                          content: const Text(
                                              'Are you sure you want to Unblock this user?'),
                                          actions: [
                                            TextButton(
                                              child: const Text('Cancel'),
                                              onPressed: () {
                                                Get.back();
                                              },
                                            ),
                                            TextButton(
                                              child: const Text('Unblock'),
                                              onPressed: () {
                                                controller.unblockUser(user.id);
                                                controller.update();
                                                controller.getAllUsers();
                                                controller.update();
                                                Get.back();
                                                // controller.update();
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                            },
                          )
                        ],
                      ),
                      kHeight10,
                      UserDetailsTextWidget(
                          heading: 'Email', value: user.email),
                      kHeight10,
                      UserDetailsTextWidget(
                          heading: 'Contact', value: '+91 ${user.phoneNumber}'),
                      kHeight10,
                      user.address!.isEmpty
                          ? const UserDetailsTextWidget(
                              heading: 'Address', value: 'No Address Found')
                          : UserDetailsTextWidget(
                              heading: 'Address',
                              value:
                                  'House no ${user.address![0].house},\n   ${user.address![0].address},\n   ${user.address![0].city}\n   ${user.address![0].state} - ${user.address![0].pincode}'),
                      kHeight10,
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
