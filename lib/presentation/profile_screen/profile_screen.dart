import 'package:new_agg/presentation/edit_profile_screen/controller/edit_profile_controller.dart';
import 'package:new_agg/presentation/history_page/history_page.dart';
import 'package:new_agg/presentation/news_stat_screen/news_stat_screen.dart';
import 'package:new_agg/widgets/custom_text_form_field.dart';

import '../profile_screen/widgets/profilelist_item_widget.dart';
import 'controller/profile_controller.dart';
import 'models/profilelist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';
//import 'package:new_agg/presentation/berita_yang_di_sukai_page/berita_yang_di_sukai_page.dart';
import 'package:new_agg/presentation/home_page_with_tab_page/home_page_with_tab_page.dart';
//import 'package:new_agg/presentation/trending_page_tab_container_page/trending_page_tab_container_page.dart';
import 'package:new_agg/widgets/custom_bottom_bar.dart';

class ProfileScreen extends GetWidget<ProfileController> {
  ProfileScreen({Key? key}) : super(key: key);

  ProfileController profileController = Get.put(ProfileController());
  EditProfileController editController = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
      //appBar:
      //AppBar(
      //    leading: BackButton(
      //  onPressed: () {},
      //)),
      body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 26.h, vertical: 33.v),
          child: Column(children: [
            CustomImageView(
                imagePath: ImageConstant.imgMaterialSymbolsSettings,
                height: 24.adaptSize,
                width: 24.adaptSize,
                alignment: Alignment.centerRight,
                onTap: () {
                  onTapImgImage();
                }),
            SizedBox(height: 40.v),

            Obx(() => CustomImageView(
                imagePath: profileController.photo.toString() == ""
                    ? "https://img.freepik.com/free-vector/404-error-with-landscape-concept-illustration_114360-7898.jpg?w=2000&t=st=1705367389~exp=1705367989~hmac=15d172d57e2f959df17fbdc8dcbd6a0e0a6506671ed0aaa3e27a93b2ca8afc46"
                    : profileController.photo.toString(),
                // .toString(), //ImageConstant.imgEllipse2,
                height: 139.adaptSize,
                width: 139.adaptSize,
                radius: BorderRadius.circular(69.h))),

            SizedBox(height: 15.v),
            Obx(
              () => Text(profileController.name.toString(),
                  style: CustomTextStyles.titleMediumInter),
            ),
            SizedBox(height: 11.v),
            Obx(() => Text(profileController.email.toString(),
                style: CustomTextStyles.titleSmallGray70005)),
            SizedBox(height: 13.v),

            GestureDetector(
                onTap: () {
                  onTapTxtEditProfile();
                },
                child: Text("lbl_edit_profile".tr,
                    style: CustomTextStyles.titleSmallErrorContainer
                        .copyWith(decoration: TextDecoration.underline))),
            SizedBox(height: 20.v),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                print('Button pressed!');
              },
              child: Text("msg_berita_yang_di_sukai".tr),
            ),
            ElevatedButton(
                onPressed: () => Get.to(() => NewsStatScreen(), arguments: [
                      {"statType": "like"}
                    ]),
                child: Text(
                  "msg_berita_yang_di_sukai".tr,
                  style: TextStyle(color: appTheme.gray100),
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 1,
                )),
            ElevatedButton(
                onPressed: () => Get.to(() => NewsStatScreen(), arguments: [
                      {"statType": "save"}
                    ]),
                child: Text(
                  "msg_berita_yang_di_simpan".tr,
                  style: TextStyle(color: appTheme.gray100),
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 1,
                )) //_buildProfileList()
          ])),
      //bottomNavigationBar: _buildBottomBar()
    ));
  }

  /// Section Widget
  Widget _buildProfileList() {
    return Padding(
        padding: EdgeInsets.only(left: 1.h),
        child: Obx(() => ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 15.v);
            },
            itemCount: profileController
                .profileModelObj.value.profilelistItemList.value.length,
            itemBuilder: (context, index) {
              ProfilelistItemModel model = controller
                  .profileModelObj.value.profilelistItemList.value[index];
              return ProfilelistItemWidget(model);
            })));
  }

  /// Section Widget
  Widget _buildBottomBar() {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Get.toNamed(getCurrentRoute(type), id: 1);
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homePageWithTabPage;
      case BottomBarEnum.Trending:
        return AppRoutes.trendingPageTabContainerPage;
      case BottomBarEnum.History:
        return AppRoutes.historyPage;
      case BottomBarEnum.Profile:
        return AppRoutes.profileScreen;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homePageWithTabPage:
        return HomePageWithTabPage();
      case AppRoutes.historyPage:
        return HistoryPage();
      case AppRoutes.profileScreen:
        return ProfileScreen();
      default:
        return DefaultWidget();
    }
  }

  /// Navigates to the settingsScreen when the action is triggered.
  onTapImgImage() {
    Get.toNamed(
      AppRoutes.settingsScreen,
    );
  }

  /// Navigates to the editProfileScreen when the action is triggered.
  onTapTxtEditProfile() {
    editController.SetProfile(
        controller.name.value.toString(),
        controller.birthday.value.toString(),
        controller.gender.value..toString(),
        controller.photo.value..toString());
    Get.toNamed(
      AppRoutes.editProfileScreen,
    );
  }
}
