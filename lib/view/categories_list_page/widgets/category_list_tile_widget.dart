import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart_admin/controller/category_controller/category_controller.dart';
import 'package:menskart_admin/view/categories_list_page/categories_edit_page/category_edit_page.dart';
import 'package:menskart_admin/view/core/border_radius.dart';
import 'package:menskart_admin/view/core/color_constants.dart';
import 'package:menskart_admin/view/core/space_constants.dart';
import 'package:menskart_admin/view/core/url_constants.dart';

// ignore: must_be_immutable
class CategoriesListtileWidget extends StatelessWidget {
  const CategoriesListtileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      init: CategoryController(),
      builder: (controller) {
        if (controller.category == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.separated(
          shrinkWrap: true,
          itemCount: controller.category!.length,
          separatorBuilder: (context, index) => kHeight10,
          itemBuilder: (context, index) {
            return Builder(
              builder: (context) {
                final category = controller.category![index];
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
                      leading: CachedNetworkImage(
                        imageUrl: '$kCategoryUrl/${category.id}.jpg',
                        fit: BoxFit.cover,
                        imageBuilder: (context, imageProvider) => CircleAvatar(
                          radius: 25,
                          backgroundImage: imageProvider,
                        ),
                        placeholder: (context, url) => const SizedBox(
                            height: 30, child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) {
                          return CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl:
                                '$kCategoryAddedUrl/${controller.category![index].id}.jpg',
                            imageBuilder: (context, imageProvider) =>
                                CircleAvatar(
                              radius: 25,
                              backgroundImage: imageProvider,
                            ),
                            placeholder: (context, url) => const SizedBox(
                                height: 30, child: CircularProgressIndicator()),
                          );
                        },
                      ),
                      title: Text(category.category),
                      trailing: Wrap(
                        children: [
                          IconButton(
                              onPressed: () {
                                Get.to(() =>
                                    CategoriesEditPage(category: category));
                              },
                              icon: const Icon(Icons.edit,
                                  size: 30, color: kBlack)),
                          IconButton(
                            onPressed: () {
                              Get.defaultDialog(
                                title: 'Delete Category',
                                content: const Text(
                                    'Are you sure you want to delete this category?'),
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
                                      controller.deleteCategory(category.id);
                                      controller.update();
                                      controller.getAllCategory();
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
              },
            );
          },
        );
      },
    );
  }
}
