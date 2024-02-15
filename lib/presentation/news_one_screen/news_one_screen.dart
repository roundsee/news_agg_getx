//import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
//import 'package:new_agg/core/models/suggestion_model.dart';
import 'package:new_agg/core/models/suggestion_model_show.dart';
import 'package:url_launcher/url_launcher.dart';
//import '../news_one_screen/widgets/newsonelist_item_widget.dart';
import 'controller/news_one_controller.dart';
//import 'models/newsonelist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/widgets/app_bar/appbar_leading_image.dart';
import 'package:new_agg/widgets/app_bar/appbar_trailing_image.dart';
import 'package:new_agg/widgets/app_bar/custom_app_bar.dart';
//import 'package:new_agg/widgets/custom_text_form_field.dart';
//import 'package:file_picker/file_picker.dart';
import 'package:social_share/social_share.dart';

class NewsOneScreen extends StatelessWidget {
  NewsOneScreen({Key? key}) : super(key: key);

  NewsOneController controller = Get.put(NewsOneController());
  var xoption = "";

  String groupLink = ""; //https://chat.whatsapp.com/HMudsgtHEzS7xLmHrN8El/
  String numberWithCode = ""; //https://wa.me/9779812345678/
  String facebookId = "";
  String filepath = "";
  void wa(String host) async {
    Uri url =
        Uri.parse("$host?text=Follow 30FlutterTips With Lakshydeep Vikram");
    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw "Can't launch link";
    }
  }

  //var xFontSize = "small";
  @override
  Widget build(BuildContext context) {
    // Get.put(NewsOneController());
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            // floatingActionButton: MyFloatingActionButton(),
            appBar:
                //_buildAppBar(),
                AppBar(
              leadingWidth: 49.h,
              leading: BackButton(
                onPressed: () {
                  Get.back();
                },
              ),
            ),
//============
            body: SizedBox(
                width: mediaQueryData.size.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 10.v),
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 5.v),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                //crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      //WidgetsBinding.instance.addPostFrameCallback((_) {
                                      xoption = "1";
                                      _showListAlert(context);
                                      //});
                                    },
                                    child: CustomImageView(
                                        imagePath: ImageConstant
                                            .imgMdiSortAlphabeticalVariant),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      xoption = "2";
                                      _showListAlert(context);
                                    },
                                    child: CustomImageView(
                                        margin: EdgeInsets.only(right: 30),
                                        imagePath:
                                            ImageConstant.imgPhTranslateFill),
                                  ),
                                ],
                              ),
                              Container(
                                  width: 238.h,
                                  margin: EdgeInsets.only(left: 28.h),
                                  child: Obx(
                                    () => Text(
                                        controller.title.value.toString(),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: CustomTextStyles
                                            .titleMediumInterSemiBold),
                                  )),
                              SizedBox(height: 7.v),
                              Padding(
                                  padding: EdgeInsets.only(left: 30.h),
                                  child: Text("Ini nampilin apa ya ?",
                                      style: CustomTextStyles
                                          .titleSmallBluegray900)),
                              SizedBox(height: 8.v),
                              Padding(
                                  padding: EdgeInsets.only(left: 28.h),
                                  child: Obx(() => Text(
                                      "Author:" +
                                          controller.author.value.toString() +
                                          ", " +
                                          controller.publish.value.toString(),
                                      style: CustomTextStyles
                                          .bodySmallGray70002))),
                              SizedBox(height: 5.v),
                              _buildOneStack(),
                              SizedBox(height: 5.v),
                              //_buildOneStack(),
                              Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                      width: 307.h,
                                      margin: EdgeInsets.only(
                                          left: 25.h, right: 28.h),
                                      child: Obx(() => Text(
                                          controller.description.value
                                              .toString(),
                                          // maxLines: 5,
                                          //overflow: TextOverflow.ellipsis,
                                          style: controller.myStyle.value
                                          //CustomTextStyles.labelLargeMedium
                                          )))),
                              SizedBox(height: 14.v),
                              Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: 307.h,
                                    margin: EdgeInsets.only(
                                        left: 25.h, right: 28.h),
                                  )),
                              SizedBox(height: 17.v),
                              Padding(
                                  padding: EdgeInsets.only(left: 25.h),
                                  child: Obx(() => Row(children: [
                                        GestureDetector(
                                          child: _buildFrameThirtySeven(
                                              bookmarkImage: controller.like ==
                                                      "1"
                                                  ? ImageConstant
                                                      .imgSolarHeartBoldRed70001
                                                  : ImageConstant
                                                      .imgSolarHeartBold,
                                              bookmarkLabel: controller
                                                  .jlike.value
                                                  .toString()),
                                          onTap: () {
                                            controller.InteractionClick(
                                                controller.idn, 1);
                                          },
                                        ),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(left: 10.h),
                                            child: GestureDetector(
                                              child: _buildFrameThirtySeven(
                                                  bookmarkImage: controller
                                                              .save ==
                                                          "1"
                                                      ? ImageConstant
                                                          .imgPhBookmarkSimpleFillOnerror
                                                      : ImageConstant
                                                          .imgPhBookmarkSimpleFill,
                                                  bookmarkLabel: controller
                                                      .jsave.value
                                                      .toString()),
                                              onTap: () {
                                                controller.InteractionClick(
                                                    controller.idn, 2);
                                              },
                                            )),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(left: 10.h),
                                            child: GestureDetector(
                                              onTap: () {
                                                _showShare(context);
                                              },
                                              /*
                                              onTap: () async {
                                                final box =
                                                    context.findRenderObject()
                                                        as RenderBox?;
                                                await Share.share(
                                                  controller.slug.value,
                                                  subject:
                                                      controller.title.value,
                                                  sharePositionOrigin: box!
                                                          .localToGlobal(
                                                              Offset.zero) &
                                                      box.size,
                                                );
                                              }
                                              */
                                              child: _buildFrameThirtySeven(
                                                  bookmarkImage: ImageConstant
                                                      .imgMajesticonsShareCircle,
                                                  bookmarkLabel: controller
                                                      .jshare.value
                                                      .toString()),
                                            )),
                                      ]))),
                              SizedBox(height: 19.v),
                              Padding(
                                  padding: EdgeInsets.only(left: 20.h),
                                  child: Text("lbl_similar".tr,
                                      style: theme.textTheme.labelLarge)),
                              SizedBox(height: 8.v),
                              _buildNewsOneList()
                            ]))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 49.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 25.h, top: 14.v, bottom: 14.v),
            onTap: () {
              onTapArrowLeft();
            }),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgMdiSortAlphabeticalVariant,
              margin: EdgeInsets.only(left: 25.h, top: 14.v, right: 14.h)),
          AppbarTrailingImage(
              imagePath: ImageConstant.imgPhTranslateFill,
              margin: EdgeInsets.only(left: 16.h, top: 14.v, right: 39.h))
        ],
        styleType: Style.bgFill);
  }

  /// Section Widget
  Widget _buildOneStack() {
    return Obx(() => Align(
        alignment: Alignment.center,
        child: SizedBox(
            height: 223.v,
            width: 307.h,
            child: Stack(alignment: Alignment.centerLeft, children: [
              CustomImageView(
                  imagePath: controller.imgUrl.value == ""
                      ? ImageConstant.imgRectangle8223x307
                      : controller.imgUrl.value,
                  height: 223.v,
                  width: 307.h,
                  alignment: Alignment.center),
              /*
              CustomImageView(
                  imagePath: ImageConstant.imgVector,
                  height: 43.adaptSize,
                  width: 43.adaptSize,
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 125.h))
                  */
            ]))));
  }

  /// Section Widget
  Widget _buildNewsOneList() {
    //controller.Suggested(controller.theNews.value.toString());
    return SizedBox(
        height: 199.v,
        child: Obx(() => ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return SizedBox(width: 10.h);
            },
            itemCount: controller.listSuggestion.value.length,
            itemBuilder: (context, index) {
              SuggestionModel model = controller.listSuggestion.value[index];
              return _listSuggestion(model);
            })));
  }

  Widget _listSuggestion(SuggestionModel Sugg) {
    return Container(
      margin: EdgeInsets.only(left: 16),
      padding: EdgeInsets.symmetric(vertical: 10.v),
      decoration: AppDecoration.fillBlueGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      width: 300.h,
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            children: [
              //Sugg.header.toString()

              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CustomImageView(
                  imagePath: Sugg.header.toString(),
                  height: 100.v,
                  width: 280.h,
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: 280,
                child: Text(
                  Sugg.title.toString(),
                  overflow: TextOverflow.ellipsis,
                  //suggestionContent.oneHundred!.value,
                  style: theme.textTheme.bodyMedium,
                ),
              ),

              Row(
                //crossAxisAlignment: CrossAxisAlignment.stretch,

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      Sugg.datePublish.toString(),
                      //suggestionContent.oneHundred!.value,
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgSolarHeartBold,
                            height: 20.adaptSize,
                            width: 20.adaptSize,
                          ),
                          SizedBox(height: 2.v),
                          //  Obx(
                          //() =>
                          Text(
                            Sugg.like.toString(),
                            //suggestionContent.oneHundred!.value,
                            style: theme.textTheme.bodySmall,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgPhBookmarkSimpleFill,
                            height: 20.adaptSize,
                            width: 20.adaptSize,
                          ),
                          SizedBox(height: 3.v),
                          Text(
                            Sugg.save.toString(),
                            style: theme.textTheme.bodySmall,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgMajesticonsShareCircle,
                            height: 20.adaptSize,
                            width: 20.adaptSize,
                          ),
                          SizedBox(height: 3.v),
                          Text(
                            Sugg.share.toString(),

                            //suggestionContent.oneHundred!.value,
                            style: theme.textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              //  ),
            ],
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildFrameThirtySeven({
    required String bookmarkImage,
    required String bookmarkLabel,
  }) {
    return Column(children: [
      CustomImageView(
          imagePath: bookmarkImage, height: 20.adaptSize, width: 20.adaptSize),
      SizedBox(height: 3.v),
      Text(bookmarkLabel,
          style: theme.textTheme.bodySmall!.copyWith(color: appTheme.black900))
    ]);
  }

  /// Common widget
  Widget _buildFrameSixtySix({
    required String userName,
    required String hCounter,
    required String apakahTidakMasalah,
    required String wpfLike,
    required String likesCounter,
    required String reply,
    required String viewMoreReplies,
  }) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
              imagePath: ImageConstant.imgEllipse3,
              height: 32.adaptSize,
              width: 32.adaptSize,
              radius: BorderRadius.circular(16.h),
              margin: EdgeInsets.only(bottom: 62.v)),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: 9.h),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Text(userName,
                              style: theme.textTheme.labelMedium!
                                  .copyWith(color: appTheme.black900)),
                          Padding(
                              padding: EdgeInsets.only(left: 10.h),
                              child: Text(hCounter,
                                  style: CustomTextStyles.bodySmallBluegray40001
                                      .copyWith(color: appTheme.blueGray40001)))
                        ]),
                        SizedBox(height: 9.v),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: SizedBox(
                                      width: 216.h,
                                      child: Text(apakahTidakMasalah,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: CustomTextStyles.bodySmall10
                                              .copyWith(
                                                  color: appTheme.black900)))),
                              CustomImageView(
                                  imagePath: wpfLike,
                                  height: 20.adaptSize,
                                  width: 20.adaptSize,
                                  margin:
                                      EdgeInsets.only(left: 27.h, bottom: 6.v))
                            ]),
                        SizedBox(height: 10.v),
                        Row(children: [
                          Padding(
                              padding: EdgeInsets.only(bottom: 1.v),
                              child: Text(likesCounter,
                                  style: CustomTextStyles.bodySmallBluegray40001
                                      .copyWith(
                                          color: appTheme.blueGray40001))),
                          Padding(
                              padding: EdgeInsets.only(left: 10.h),
                              child: Text(reply,
                                  style: CustomTextStyles.bodySmallBluegray40001
                                      .copyWith(color: appTheme.blueGray40001)))
                        ]),
                        SizedBox(height: 8.v),
                        Text(viewMoreReplies,
                            style: CustomTextStyles.bodySmallBluegray40001
                                .copyWith(color: appTheme.blueGray40001))
                      ])))
        ]);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }

//=======================
  _showListAlert(BuildContext context) {
    showPlatformDialog(
      context: context,
      builder: (_) => BasicDialogAlert(
        title: Text(
            xoption == "1" ? "lbl_title_text_size".tr : "lbl_title_language".tr,
            style: CustomTextStyles.bodyMediumGray900),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              xoption == "1"
                  ? _buildListItem("lbl_kecil".tr)
                  : _buildListItem("Indonesia"),
              xoption == "1"
                  ? _buildListItem("lbl_sedang".tr)
                  : _buildListItem("English"),
              xoption == "1"
                  ? _buildListItem("lbl_besar".tr)
                  : _buildListItem(""),
              //_buildListItem("Medium"),
              //_buildListItem("Besar"),
            ],
          ),
        ),
        actions: <Widget>[
          BasicDialogAction(
            title: Text("OK"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  _showShare(BuildContext context) {
    showPlatformDialog(
      context: context,
      builder: (_) => BasicDialogAlert(
        title: Text("Share News", style: CustomTextStyles.bodyMediumGray900),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _buildListItemShare("Copy", "assets/images/logocopy.png"),
              _buildListItemShare("WhatsApp", "assets/images/logowa.png"),
              _buildListItemShare("Twitter", "assets/images/logotwit.png"),
              _buildListItemShare("Facebook", "assets/images/logofb.png"),
              _buildListItemShare("Instagram", "assets/images/logoig.png"),
              //_buildListItem("Medium"),
              //_buildListItem("Besar"),
            ],
          ),
        ),
        actions: <Widget>[
          BasicDialogAction(
            title: Text("OK"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(String title) {
    return Column(
      children: [
        Container(
          height: 48,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: InkWell(
                child: Text(title),
                onTap: () async {
                  switch (title.toLowerCase()) {
                    case "kecil":
                      controller.saveOptions(title);
                      break;
                    case "medium":
                      controller.saveOptions(title);
                      break;
                    case "besar":
                      controller.saveOptions(title);
                      break;
                    default:
                  }
                },
              )),
            ],
          ),
        ),
        const Divider(height: 0.5),
      ],
    );
  }

  Widget _buildListItemShare(String title, String imgPath) {
    return Column(children: [
      Container(
          height: 48,
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Expanded(
                child: InkWell(
                    child: Row(children: [
                      CustomImageView(
                          imagePath: imgPath,
                          height: 20.adaptSize,
                          width: 20.adaptSize,
                          margin: EdgeInsets.only(left: 27.h, bottom: 6.v)),
                      SizedBox(width: 10.v),
                      Text(title)
                    ]),
                    onTap: () async {
                      switch (title.toLowerCase()) {
                        case "copy":
                          Clipboard.setData(
                              ClipboardData(text: controller.slug.value));
                          Get.snackbar(
                            "Share ews",
                            "News has beeen copied",
                            //icon: Icon(Icons.person, color: Colors.white),
                            duration: const Duration(seconds: 5),
                            snackPosition: SnackPosition.BOTTOM,
                          );
                          controller.InteractionClick(
                              controller.idn.value, "share");
                          break;
                        case "whatsapp":
                          SocialShare.shareWhatsapp(
                            controller.slug.toString(),
                          ).then((data) {
                            print(data);
                          });
                          controller.InteractionClick(
                              controller.idn.value, "share");
                          break;
                        case "facebook":
                          SocialShare.shareFacebookStory(
                            appId: facebookId,
                            imagePath: filepath,
                            backgroundTopColor: "#ffffff",
                            backgroundBottomColor: "#000000",
                          ).then((data) {
                            print(data);
                          });
                          controller.InteractionClick(
                              controller.idn.value, "share");
                          break;
                        case "instagram":
                          SocialShare.shareInstagramStory(
                            appId: facebookId,
                            imagePath: filepath,
                            backgroundResourcePath: filepath,
                          ).then((data) {
                            print(data);
                          });
                          controller.InteractionClick(
                              controller.idn.value, "share");
                          break;
                        case "twitter":
                          SocialShare.shareTwitter(
                            controller.slug.value,
                            hashtags: [
                              "SocialSharePlugin",
                              "world",
                              "foo",
                              "bar"
                            ],
                            url: "https://google.com/hello",
                            trailingText: "cool!!",
                          ).then((data) {
                            print(data);
                          });
                          controller.InteractionClick(
                              controller.idn.value, "share");
                          break;
                        default:
                      }
                    }))
          ]))
    ]);
  }

//=======================
/*
  void _onShare(BuildContext context) async {
    // A builder is used to retrieve the context immediately
    // surrounding the ElevatedButton.
    //
    // The context's `findRenderObject` returns the first
    // RenderObject in its descendent tree when it's not
    // a RenderObjectWidget. The ElevatedButton's RenderObject
    // has its position and size after it's built.
    final box = context.findRenderObject() as RenderBox?;

    if (uri.isNotEmpty) {
      await Share.shareUri(Uri.parse(uri));
    } else if (imagePaths.isNotEmpty) {
      final files = <XFile>[];
      for (var i = 0; i < imagePaths.length; i++) {
        files.add(XFile(imagePaths[i], name: imageNames[i]));
      }
      await Share.shareXFiles(files,
          text: text,
          subject: subject,
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
    } else {
      await Share.share(text,
          subject: subject,
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
    }
  }
  */

  tapShare(String title) {
    switch (title.toLowerCase()) {
      case "copy":
        Clipboard.setData(ClipboardData(text: controller.slug.value));
        break;
      case "whatsapp":
        SocialShare.shareWhatsapp(
          controller.slug.toString(),
        ).then((data) {
          print(data);
        });
        break;
      case "facebook":
        SocialShare.shareFacebookStory(
          appId: facebookId,
          imagePath: filepath,
          backgroundTopColor: "#ffffff",
          backgroundBottomColor: "#000000",
        ).then((data) {
          print(data);
        });
        break;
      case "instagram":
        SocialShare.shareInstagramStory(
          appId: facebookId,
          imagePath: filepath,
          backgroundResourcePath: filepath,
        ).then((data) {
          print(data);
        });
        break;
      case "twitter":
        SocialShare.shareTwitter(
          "This is Social Share twitter example with link.  ",
          hashtags: ["SocialSharePlugin", "world", "foo", "bar"],
          url: "https://google.com/hello",
          trailingText: "cool!!",
        ).then((data) {
          print(data);
        });

        break;
      default:
    }
  }
}

class MyFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showBottomSheet(
            context: context,
            builder: (context) => Container(
                  height: 200,
                  color: Colors.red,
                ));
      },
    );
  }
}
