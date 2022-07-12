import 'package:flutter/material.dart';
import 'package:menskart_admin/view/core/border_radius.dart';
import 'package:menskart_admin/view/core/color_constants.dart';
import 'package:menskart_admin/view/core/space_constants.dart';
import 'package:menskart_admin/view/products_list_page/widgets/container_confirm_button.dart';
import 'package:menskart_admin/view/user_management_page/widgets/user_details_text_widget.dart';

class UserDetailsWidget extends StatelessWidget {
  const UserDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
      ),
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
                          const UserDetailsTextWidget(
                            heading: 'Name',
                            value: 'Viswajith K A',
                          ),
                          ContainerConfirmButton(
                            height: 40,
                            width: 80,
                            radius: kBRadius30,
                            buttonText: 'Unblock',
                            buttonColor: kWhite,
                          )
                        ],
                      ),
                      kHeight10,
                      const UserDetailsTextWidget(
                          heading: 'Email', value: 'viswajithka@gmail.com'),
                      kHeight10,
                      const UserDetailsTextWidget(
                          heading: 'Contact', value: '+91 9447617999'),
                      kHeight10,
                      const UserDetailsTextWidget(
                          heading: 'Address',
                          value:
                              'House no 12, Thammadiyil Temple\n   Road, Tripunitura'),
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
