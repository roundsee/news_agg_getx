import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/core/controllers/categories_controller.dart';
import 'package:new_agg/core/controllers/news_per_cagory_controller.dart';
import 'package:new_agg/presentation/page_search_category/page_search_category.dart';

NewsPerCategoryController newsPerCategoriesController =
    Get.put(NewsPerCategoryController());

Drawer sideDrawer(CategoriesController categoriesController) {
  return Drawer(
    backgroundColor: appTheme.gray100,
    child: ListView(
      children: <Widget>[
        DrawerHeader(
            child: Text("Category"),
            decoration: BoxDecoration(
              color: Colors.blue,
            )),
        GetBuilder<CategoriesController>(
          builder: (controller) {
            return Container(
              decoration: BoxDecoration(
                  color: appTheme.whiteA700,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )),
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(categoriesController.allCategory.length,
                    (index) {
                  return ListTile(
                    leading: ImageIcon(NetworkImage(categoriesController
                        .allCategory[index].icon
                        .toString())),
                    title: Text(categoriesController.allCategory[index].category
                        .toString()),
                    onTap: () {
                      // Navigator.pop(context);
                      newsPerCategoriesController.getNewsPerCategories(index);
                      Get.to(() => PageSearchCategory());
                    },
                  );
                  //Text(categoriesController.allCategory[index].category.toString());
                }),
              ),
            );
          },
          init: CategoriesController(),
        ),
      ],
    ),
  );
}
