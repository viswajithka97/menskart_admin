import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart_admin/controller/user_management_controller/user_,management_controller.dart';
import 'package:menskart_admin/view/core/border_radius.dart';
import 'package:menskart_admin/view/core/color_constants.dart';
import 'package:menskart_admin/view/core/space_constants.dart';
import 'package:menskart_admin/view/user_management_page/widgets/user_details_widget.dart';

class UsersWidget extends StatelessWidget {
  const UsersWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      init: UserController(),
      builder: (controller) {
        if (controller.users == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemCount: controller.users!.length,
              separatorBuilder: (context, index) => kHeight10,
              itemBuilder: (context, index) {
                final user = controller.users![index];
                return Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: kBlackwithOpacity,
                        width: 1.0,
                      ),
                      borderRadius: kBRadius10),
                  child: Center(
                    child: ListTile(
                      onTap: () {
                        Get.to(UserDetailsWidget(
                          user: user,
                          index: index,
                        ));
                      },
                      leading: CircleAvatar(
                        backgroundColor: kBlackwithOpacity,
                        child: const Icon(Icons.person),
                      ),
                      title: Text(user.name),
                      trailing: Wrap(
                        children: [
                          user.userBlock != true
                              ? IconButton(
                                  onPressed: () {
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
                                  icon: const Icon(Icons.lock_open_outlined,
                                      size: 30, color: kBlack))
                              : IconButton(
                                  onPressed: () {
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
                                  icon: const Icon(Icons.lock_outline_rounded,
                                      size: 30, color: kBlack)),
                          IconButton(
                            onPressed: () {
                              Get.defaultDialog(
                                title: 'Confirm',
                                content: const Text(
                                    'Are you sure you want to delete this user?'),
                                actions: [
                                  TextButton(
                                    child: const Text('Cancel'),
                                    onPressed: () {
                                      Get.back();
                                    },
                                  ),
                                  TextButton(
                                    child: const Text('Delete'),
                                    onPressed: () {
                                      controller.deleteUser(user.id);
                                      controller.update();
                                      controller.getAllUsers();
                                      controller.update();
                                      Get.back();
                                    },
                                  ),
                                ],
                              );
                            },
                            icon: const Icon(Icons.delete_outline,
                                size: 30, color: kBlack),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        );
      },
    );
  }
}
