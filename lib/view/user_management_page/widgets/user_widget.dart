import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return Expanded(
      child: ListView.separated(
          shrinkWrap: true,
          itemCount: 10,
          separatorBuilder: (context, index) => kHeight10,
          itemBuilder: (context, index) {
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
                  onTap: (){
                    Get.to(const UserDetailsWidget());
                  },
                  leading: CircleAvatar(
                    backgroundColor: kBlackwithOpacity,
                    child: const Icon(Icons.person),
                  ),
                  title: const Text('John Doe'),
                  trailing: Wrap(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.lock_open_outlined,
                              size: 30, color: kBlack)),
                      IconButton(
                        onPressed: () {},
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
  }
}
