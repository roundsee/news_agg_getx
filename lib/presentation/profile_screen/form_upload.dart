import 'package:easyupload_image_toserver/easyupload_image_toserver_mob.dart';
import 'package:new_agg/core/api_endpoint/api_endpoints.dart';
import 'package:new_agg/core/utils/checkurl.dart';
import 'package:new_agg/presentation/profile_screen/profile_screen.dart';
import '../profile_screen/widgets/profilelist_item_widget.dart';
import 'controller/profile_controller.dart';
import 'models/profilelist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';

class UploadScreen extends GetWidget<ProfileController> {
  UploadScreen({Key? key}) : super(key: key);

  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    String theFile = "";
    UploadImageforPhone upload = UploadImageforPhone();
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
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
                  //onTapImgImage();
                }),
            SizedBox(height: 40.v),
            Obx(() => CustomImageView(
                onTap: () {},
                imagePath: profileController.photo.toString() == ""
                    ? "https://img.freepik.com/free-vector/404-error-with-landscape-concept-illustration_114360-7898.jpg?w=2000&t=st=1705367389~exp=1705367989~hmac=15d172d57e2f959df17fbdc8dcbd6a0e0a6506671ed0aaa3e27a93b2ca8afc46"
                    : profileController.photo.toString(),
                height: 139.adaptSize,
                width: 139.adaptSize,
                radius: BorderRadius.circular(69.h))),
            SizedBox(height: 15.v),
            Obx(
              () => Text(profileController.name.toString(),
                  style: CustomTextStyles.titleMediumInter),
            ),
            SizedBox(height: 11.v),
            Column(
              children: [
                Center(
                  child: MaterialButton(
                    color: Colors.blue,
                    onPressed: () {
                      // for gcamallery
                      upload.selectFromGallary();
                      //if (upload.filePath != null) {
                      //  theFile = upload.filePath;
                      // }
                    },
                    child: const Text('from Gallery'),
                  ),
                ),
                Center(
                  child: MaterialButton(
                    color: Colors.blue,
                    onPressed: () {
                      // for gallery
                      upload.selectFromCam();
                    },
                    child: const Text('Camera'),
                  ),
                ),
                Center(
                  child: MaterialButton(
                    color: Colors.blue,
                    onPressed: () async {
                      var url = ApiEndPoints.baseUrl +
                          ApiEndPoints.readersEndpoints.changePhoto;
                      var headers = getHeaders("req");
                      await upload.uploadToServerWithImageWithOnly(
                          url, "photo", headers);
                      profileController.GetProfile();
                      Get.off(ProfileScreen());
                    },
                    child: const Text('upload'),
                  ),
                ),
              ],
            )
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

  /// Navigates to the settingsScreen when the action is triggered.
  onTapImgImage() {
    Get.toNamed(
      AppRoutes.settingsScreen,
    );
  }

  /// Navigates to the editProfileScreen when the action is triggered.
}
