import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart_admin/view/categories_list_page/categories_edit_page/category_edit_page.dart';
import 'package:menskart_admin/view/core/border_radius.dart';
import 'package:menskart_admin/view/core/color_constants.dart';
import 'package:menskart_admin/view/core/space_constants.dart';

// ignore: must_be_immutable
class CategoriesListtileWidget extends StatelessWidget {
  CategoriesListtileWidget({
    Key? key,
  }) : super(key: key);

  List<String> category = [
    'Jeans',
    'Shirts',
    'T-shirts',
    'Shoes',
    'Bags',
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemCount: 5,
        separatorBuilder: (context, index) => kHeight10,
        itemBuilder: (context, index) {
          return Builder(builder: (context) {
            return Container(
              height: 60,
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
                    // Get.to(const UserDetailsWidget());
                  },
                  leading: CircleAvatar(
                    backgroundColor: kBlackwithOpacity,
                    child: const Icon(Icons.person),
                  ),
                  title: Text(category[index]),
                  trailing: Wrap(
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.to(() => const CategoriesEditPage());
                          },
                          icon:
                              const Icon(Icons.edit, size: 30, color: kBlack)),
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
          });
        });
  }
}
