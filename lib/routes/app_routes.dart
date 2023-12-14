import 'package:new_agg/presentation/splash_screen/splash_screen.dart';
import 'package:new_agg/presentation/splash_screen/binding/splash_binding.dart';
import 'package:new_agg/presentation/forgot_pass_two_screen/forgot_pass_two_screen.dart';
import 'package:new_agg/presentation/forgot_pass_two_screen/binding/forgot_pass_two_binding.dart';
import 'package:new_agg/presentation/forgot_pass_screen/forgot_pass_screen.dart';
import 'package:new_agg/presentation/forgot_pass_screen/binding/forgot_pass_binding.dart';
import 'package:new_agg/presentation/push_notification_screen/push_notification_screen.dart';
import 'package:new_agg/presentation/push_notification_screen/binding/push_notification_binding.dart';
import 'package:new_agg/presentation/forgot_pass_one_screen/forgot_pass_one_screen.dart';
import 'package:new_agg/presentation/forgot_pass_one_screen/binding/forgot_pass_one_binding.dart';
import 'package:new_agg/presentation/startpage_screen/startpage_screen.dart';
import 'package:new_agg/presentation/startpage_screen/binding/startpage_binding.dart';
import 'package:new_agg/presentation/login_page_screen/login_page_screen.dart';
import 'package:new_agg/presentation/login_page_screen/binding/login_page_binding.dart';
import 'package:new_agg/presentation/alternative_home_page_design_container_screen/alternative_home_page_design_container_screen.dart';
import 'package:new_agg/presentation/alternative_home_page_design_container_screen/binding/alternative_home_page_design_container_binding.dart';
import 'package:new_agg/presentation/news_screen/news_screen.dart';
import 'package:new_agg/presentation/news_screen/binding/news_binding.dart';
import 'package:new_agg/presentation/blokir_comment_screen/blokir_comment_screen.dart';
import 'package:new_agg/presentation/blokir_comment_screen/binding/blokir_comment_binding.dart';
import 'package:new_agg/presentation/profile_screen/profile_screen.dart';
import 'package:new_agg/presentation/profile_screen/binding/profile_binding.dart';
import 'package:new_agg/presentation/settings_screen/settings_screen.dart';
import 'package:new_agg/presentation/settings_screen/binding/settings_binding.dart';
import 'package:new_agg/presentation/register_page_screen/register_page_screen.dart';
import 'package:new_agg/presentation/register_page_screen/binding/register_page_binding.dart';
import 'package:new_agg/presentation/select_fav_category_screen/select_fav_category_screen.dart';
import 'package:new_agg/presentation/select_fav_category_screen/binding/select_fav_category_binding.dart';
import 'package:new_agg/presentation/filter_search_screen/filter_search_screen.dart';
import 'package:new_agg/presentation/filter_search_screen/binding/filter_search_binding.dart';
import 'package:new_agg/presentation/notification_screen/notification_screen.dart';
import 'package:new_agg/presentation/notification_screen/binding/notification_binding.dart';
import 'package:new_agg/presentation/edit_profile_screen/edit_profile_screen.dart';
import 'package:new_agg/presentation/edit_profile_screen/binding/edit_profile_binding.dart';
import 'package:new_agg/presentation/fav_category_screen/fav_category_screen.dart';
import 'package:new_agg/presentation/fav_category_screen/binding/fav_category_binding.dart';
import 'package:new_agg/presentation/story_news_screen/story_news_screen.dart';
import 'package:new_agg/presentation/story_news_screen/binding/story_news_binding.dart';
import 'package:new_agg/presentation/search_page_screen/search_page_screen.dart';
import 'package:new_agg/presentation/search_page_screen/binding/search_page_binding.dart';
import 'package:new_agg/presentation/ukuran_text_screen/ukuran_text_screen.dart';
import 'package:new_agg/presentation/ukuran_text_screen/binding/ukuran_text_binding.dart';
import 'package:new_agg/presentation/bahasa_screen/bahasa_screen.dart';
import 'package:new_agg/presentation/bahasa_screen/binding/bahasa_binding.dart';
import 'package:new_agg/presentation/news_one_screen/news_one_screen.dart';
import 'package:new_agg/presentation/news_one_screen/binding/news_one_binding.dart';
import 'package:new_agg/presentation/search_page_filter_kategori_screen/search_page_filter_kategori_screen.dart';
import 'package:new_agg/presentation/search_page_filter_kategori_screen/binding/search_page_filter_kategori_binding.dart';
import 'package:new_agg/presentation/alternative_home_page_design_one_screen/alternative_home_page_design_one_screen.dart';
import 'package:new_agg/presentation/alternative_home_page_design_one_screen/binding/alternative_home_page_design_one_binding.dart';
import 'package:new_agg/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:new_agg/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String forgotPassTwoScreen = '/forgot_pass_two_screen';

  static const String forgotPassScreen = '/forgot_pass_screen';

  static const String pushNotificationScreen = '/push_notification_screen';

  static const String forgotPassOneScreen = '/forgot_pass_one_screen';

  static const String historyPage = '/history_page';

  static const String beritaYangDiSukaiPage = '/berita_yang_di_sukai_page';

  static const String trendingPage = '/trending_page';

  static const String trendingPageTabContainerPage =
      '/trending_page_tab_container_page';

  static const String startpageScreen = '/startpage_screen';

  static const String loginPageScreen = '/login_page_screen';

  static const String homePage = '/home_page';

  static const String homePageWithTabPage = '/home_page_with_tab_page';

  static const String alternativeHomePageDesignContainerScreen =
      '/alternative_home_page_design_container_screen';

  static const String newsScreen = '/news_screen';

  static const String blokirCommentScreen = '/blokir_comment_screen';

  static const String profileScreen = '/profile_screen';

  static const String settingsScreen = '/settings_screen';

  static const String registerPageScreen = '/register_page_screen';

  static const String selectFavCategoryScreen = '/select_fav_category_screen';

  static const String filterSearchScreen = '/filter_search_screen';

  static const String notificationScreen = '/notification_screen';

  static const String editProfileScreen = '/edit_profile_screen';

  static const String favCategoryScreen = '/fav_category_screen';

  static const String storyNewsScreen = '/story_news_screen';

  static const String searchPageScreen = '/search_page_screen';

  static const String ukuranTextScreen = '/ukuran_text_screen';

  static const String bahasaScreen = '/bahasa_screen';

  static const String newsOneScreen = '/news_one_screen';

  static const String searchPageFilterKategoriScreen =
      '/search_page_filter_kategori_screen';

  static const String alternativeHomePageDesignOneScreen =
      '/alternative_home_page_design_one_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: forgotPassTwoScreen,
      page: () => ForgotPassTwoScreen(),
      bindings: [
        ForgotPassTwoBinding(),
      ],
    ),
    GetPage(
      name: forgotPassScreen,
      page: () => ForgotPassScreen(),
      bindings: [
        ForgotPassBinding(),
      ],
    ),
    GetPage(
      name: pushNotificationScreen,
      page: () => PushNotificationScreen(),
      bindings: [
        PushNotificationBinding(),
      ],
    ),
    GetPage(
      name: forgotPassOneScreen,
      page: () => ForgotPassOneScreen(),
      bindings: [
        ForgotPassOneBinding(),
      ],
    ),
    GetPage(
      name: startpageScreen,
      page: () => StartpageScreen(),
      bindings: [
        StartpageBinding(),
      ],
    ),
    GetPage(
      name: loginPageScreen,
      page: () => LoginPageScreen(),
      bindings: [
        LoginPageBinding(),
      ],
    ),
    
    GetPage(
      name: alternativeHomePageDesignContainerScreen,
      page: () => AlternativeHomePageDesignContainerScreen(),
      bindings: [
        AlternativeHomePageDesignContainerBinding(),
      ],
    ),
    GetPage(
      name: newsScreen,
      page: () => NewsScreen(),
      bindings: [
        NewsBinding(),
      ],
    ),
    GetPage(
      name: blokirCommentScreen,
      page: () => BlokirCommentScreen(),
      bindings: [
        BlokirCommentBinding(),
      ],
    ),
    GetPage(
      name: profileScreen,
      page: () => ProfileScreen(),
      bindings: [
        ProfileBinding(),
      ],
    ),
    GetPage(
      name: settingsScreen,
      page: () => SettingsScreen(),
      bindings: [
        SettingsBinding(),
      ],
    ),
    GetPage(
      name: registerPageScreen,
      page: () => RegisterPageScreen(),
      bindings: [
        RegisterPageBinding(),
      ],
    ),
    GetPage(
      name: selectFavCategoryScreen,
      page: () => SelectFavCategoryScreen(),
      bindings: [
        SelectFavCategoryBinding(),
      ],
    ),
    GetPage(
      name: filterSearchScreen,
      page: () => FilterSearchScreen(),
      bindings: [
        FilterSearchBinding(),
      ],
    ),
    GetPage(
      name: notificationScreen,
      page: () => NotificationScreen(),
      bindings: [
        NotificationBinding(),
      ],
    ),
    GetPage(
      name: editProfileScreen,
      page: () => EditProfileScreen(),
      bindings: [
        EditProfileBinding(),
      ],
    ),
    GetPage(
      name: favCategoryScreen,
      page: () => FavCategoryScreen(),
      bindings: [
        FavCategoryBinding(),
      ],
    ),
    GetPage(
      name: storyNewsScreen,
      page: () => StoryNewsScreen(),
      bindings: [
        StoryNewsBinding(),
      ],
    ),
    GetPage(
      name: searchPageScreen,
      page: () => SearchPageScreen(),
      bindings: [
        SearchPageBinding(),
      ],
    ),
    GetPage(
      name: ukuranTextScreen,
      page: () => UkuranTextScreen(),
      bindings: [
        UkuranTextBinding(),
      ],
    ),
    GetPage(
      name: bahasaScreen,
      page: () => BahasaScreen(),
      bindings: [
        BahasaBinding(),
      ],
    ),
    GetPage(
      name: newsOneScreen,
      page: () => NewsOneScreen(),
      bindings: [
        NewsOneBinding(),
      ],
    ),
    GetPage(
      name: searchPageFilterKategoriScreen,
      page: () => SearchPageFilterKategoriScreen(),
      bindings: [
        SearchPageFilterKategoriBinding(),
      ],
    ),
    GetPage(
      name: alternativeHomePageDesignOneScreen,
      page: () => AlternativeHomePageDesignOneScreen(),
      bindings: [
        AlternativeHomePageDesignOneBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    )
  ];
}
