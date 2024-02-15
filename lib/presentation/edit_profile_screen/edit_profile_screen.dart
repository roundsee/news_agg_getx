import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';
import 'package:new_agg/core/utils/sharedprefs.dart';
import 'package:new_agg/widgets/custom_text_form_field.dart';

import 'controller/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/widgets/app_bar/appbar_leading_image.dart';
import 'package:new_agg/widgets/app_bar/appbar_subtitle.dart';
import 'package:new_agg/widgets/app_bar/appbar_trailing_button.dart';
import 'package:new_agg/widgets/app_bar/custom_app_bar.dart';
import 'package:new_agg/widgets/custom_outlined_button.dart';

class EditProfileScreen extends GetWidget<EditProfileController> {
  EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                //height: 80.v,
                leadingWidth: 49.h,
                leading: BackButton(
                  onPressed: () {
                    Get.back();
                  },
                ),
                title: AppbarSubtitle(
                    text: "lbl_edit_profile".tr,
                    margin: EdgeInsets.only(left: 70.h)),
                actions: [
                  AppbarTrailingButton(
                      margin: EdgeInsets.symmetric(
                          horizontal: 32.h, vertical: 10.v),
                      onTap: () {
                        onTapSimpan();
                      })
                ]), // _buildAppBar(),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 33.v),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() => CustomImageView(
                            imagePath: controller.photo.value.toString() == ""
                                ? "https://img.freepik.com/free-vector/404-error-with-landscape-concept-illustration_114360-7898.jpg?w=2000&t=st=1705367389~exp=1705367989~hmac=15d172d57e2f959df17fbdc8dcbd6a0e0a6506671ed0aaa3e27a93b2ca8afc46"
                                : controller.photo.toString(),
                            height: 103.adaptSize,
                            width: 103.adaptSize,
                            radius: BorderRadius.circular(51.h),
                            alignment: Alignment.center)),
                        SizedBox(height: 17.v),
                        CustomOutlinedButton(
                            height: 35.v,
                            width: 43.h,
                            text: "lbl_edit".tr,
                            buttonStyle: CustomButtonStyles.outlineOnErrorTL5,
                            buttonTextStyle: CustomTextStyles.labelLargeOnError,
                            alignment: Alignment.center),
                        SizedBox(height: 30.v),
                        Text("lbl_name".tr),
                        TextFormField(
                          controller: controller.namaController,
                          onFieldSubmitted: (value) {
                            _setNewname(value);
                          },
                          // initialValue: controller.nama.value,
                        ),
                        /*
                                RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "lbl_nama".tr,
                                      style: CustomTextStyles.bodySmallGray80001),
                                  TextSpan(
                                      text: "lbl_merdefi".tr,
                                      style: CustomTextStyles.titleSmallBlack900)
                                ]),
                                textAlign: TextAlign.left)
                                */

                        SizedBox(height: 21.v),
                        Container(
                            width: 262.h,
                            margin: EdgeInsets.only(right: 37.h),
                            child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "lbl_username".tr,
                                      style:
                                          CustomTextStyles.bodySmallGray80001),
                                  TextSpan(
                                      text: SharedPrefs().username,
                                      style:
                                          CustomTextStyles.titleSmallBlack900)
                                ]),
                                textAlign: TextAlign.left)),
                        SizedBox(height: 17.v),
                        Text("lbl_birtdate".tr),
                        TextFormField(
                          controller: controller.dateController,
                          readOnly: true,
                          onTap: () {
                            _selectDate(context);
                          },
                          // initialValue:controller.birthdate.value.toString()
                        ),
                        /*
                            RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "lbl_tanggal_lahir".tr,
                                      style: CustomTextStyles.bodySmallGray80001),
                                  TextSpan(
                                      text: "lbl_23_mar_2001".tr,
                                      style: CustomTextStyles.titleSmallBlack900)
                                ]),
                                textAlign: TextAlign.left)
                                */

                        SizedBox(height: 20.v),
                        getWidget(false, false),
                      ]),
                ))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        height: 80.v,
        leadingWidth: 49.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftGray60004,
            margin: EdgeInsets.only(left: 25.h, top: 16.v, bottom: 16.v),
            onTap: () {
              onTapArrowLeft();
            }),
        title: AppbarSubtitle(
            text: "lbl_edit_profile".tr, margin: EdgeInsets.only(left: 70.h)),
        actions: [
          AppbarTrailingButton(
              margin: EdgeInsets.symmetric(horizontal: 32.h, vertical: 10.v),
              onTap: () {
                onTapSimpan();
              })
        ]);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }

  /// Navigates to the profileScreen when the action is triggered.
  onTapSimpan() {
    controller.UpdateProfile(controller.nama.toString(),
        controller.birthdate.toString(), controller.gender.toString());
    //Get.toNamed(
    // AppRoutes.profileScreen,
    //);
  }

  Widget getWidget(bool showOtherGender, bool alignVertical) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 40),
      alignment: Alignment.center,
      child: GenderPickerWithImage(
        showOtherGender: showOtherGender,
        verticalAlignedText: alignVertical,

        // to show what's selected on app opens, but by default it's Male
        selectedGender: Gender.Male,
        selectedGenderTextStyle:
            TextStyle(color: Color(0xFF8b32a8), fontWeight: FontWeight.bold),
        unSelectedGenderTextStyle:
            TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
        onChanged: (Gender? gender) {
          print(gender);
        },
        //Alignment between icons
        equallyAligned: true,

        animationDuration: Duration(milliseconds: 300),
        isCircular: true,
        // default : true,
        opacityOfGradient: 0.4,
        padding: const EdgeInsets.all(3),
        size: 50, //default : 40
      ),
    );
  }

  _setNewname(String newName) {
    controller.Setname(newName);
    controller.namaController.text = newName;
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.parse(controller.birthdate.value),
        firstDate: DateTime(2000, 1),
        lastDate: DateTime.now());

    if (picked != null && picked != selectedDate) {
      controller.SetBirtdate(picked.toString());
      controller.dateController.text = picked.toString();
      //controller.birthdate.value = picked.toString();
    }
  }
}
