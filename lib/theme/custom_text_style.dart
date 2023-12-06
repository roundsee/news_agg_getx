import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeGray50001 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray50001,
      );
  static get bodyLargeOnError => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.onError,
      );
  static get bodyLargePoppinsPrimaryContainer =>
      theme.textTheme.bodyLarge!.poppins.copyWith(
        color: theme.colorScheme.primaryContainer,
      );
  static get bodyMediumGray900 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray900,
        fontSize: 15.fSize,
      );
  static get bodyMediumPoppinsGray900 =>
      theme.textTheme.bodyMedium!.poppins.copyWith(
        color: appTheme.gray900,
        fontSize: 15.fSize,
      );
  static get bodySmall10 => theme.textTheme.bodySmall!.copyWith(
        fontSize: 10.fSize,
      );
  static get bodySmall12 => theme.textTheme.bodySmall!.copyWith(
        fontSize: 12.fSize,
      );
  static get bodySmall9 => theme.textTheme.bodySmall!.copyWith(
        fontSize: 9.fSize,
      );
  static get bodySmallBluegray40001 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blueGray40001,
        fontSize: 10.fSize,
      );
  static get bodySmallBluegray700 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blueGray700,
        fontSize: 12.fSize,
      );
  static get bodySmallGray600 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray600,
      );
  static get bodySmallGray60003 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray60003,
        fontSize: 12.fSize,
      );
  static get bodySmallGray700 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray700,
        fontSize: 10.fSize,
      );
  static get bodySmallGray70002 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray70002,
        fontSize: 10.fSize,
      );
  static get bodySmallGray70003 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray70003,
        fontSize: 12.fSize,
      );
  static get bodySmallGray70004 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray70004,
        fontSize: 12.fSize,
      );
  static get bodySmallGray70007 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray70007,
        fontSize: 10.fSize,
      );
  static get bodySmallGray80001 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray80001,
        fontSize: 12.fSize,
      );
  static get bodySmallGray900 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray900,
        fontSize: 12.fSize,
      );
  static get bodySmallGreen900 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.green900,
        fontSize: 12.fSize,
      );
  static get bodySmallOnError => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.onError,
        fontSize: 10.fSize,
      );
  static get bodySmallPoppins => theme.textTheme.bodySmall!.poppins.copyWith(
        fontSize: 12.fSize,
      );
  static get bodySmallPoppinsGray50001 =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: appTheme.gray50001,
        fontSize: 10.fSize,
      );
  static get bodySmallPoppinsGray5000112 =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: appTheme.gray50001,
        fontSize: 12.fSize,
      );
  static get bodySmallPoppinsGray50002 =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: appTheme.gray50002,
        fontSize: 9.fSize,
      );
  static get bodySmallPoppinsGray60002 =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: appTheme.gray60002,
        fontSize: 12.fSize,
      );
  static get bodySmallPoppinsGray70001 =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: appTheme.gray70001,
        fontSize: 12.fSize,
      );
  static get bodySmallPoppinsIndigo700 =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: appTheme.indigo700,
        fontSize: 12.fSize,
      );
  static get bodySmallPoppinsPrimary =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 12.fSize,
      );
  static get bodySmallPoppinsRed700 =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: appTheme.red700,
        fontSize: 10.fSize,
      );
  static get bodySmallWhiteA700 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 10.fSize,
      );
  static get bodySmallWhiteA70011 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 11.fSize,
      );
  static get bodySmallWhiteA70012 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 12.fSize,
      );
  static get bodySmallWhiteA700_1 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.whiteA700,
      );
  // Headline text style
  static get headlineSmallGray900 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.gray900,
        fontWeight: FontWeight.w700,
      );
  static get headlineSmallInter => theme.textTheme.headlineSmall!.inter;
  static get headlineSmallInterBlack900 =>
      theme.textTheme.headlineSmall!.inter.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w700,
      );
  static get headlineSmallWhiteA700 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w700,
      );
  // Label text style
  static get labelLargeGray800 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray800,
        fontWeight: FontWeight.w500,
      );
  static get labelLargeGray900 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray900,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeMedium => theme.textTheme.labelLarge!.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get labelLargeMedium_1 => theme.textTheme.labelLarge!.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get labelLargeOnError => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.onError,
        fontWeight: FontWeight.w600,
      );
  static get labelLargePoppins => theme.textTheme.labelLarge!.poppins;
  static get labelLargePoppinsOnError =>
      theme.textTheme.labelLarge!.poppins.copyWith(
        color: theme.colorScheme.onError,
        fontWeight: FontWeight.w500,
      );
  static get labelLargePoppinsWhiteA700 =>
      theme.textTheme.labelLarge!.poppins.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w500,
      );
  static get labelLargePoppinsWhiteA700SemiBold =>
      theme.textTheme.labelLarge!.poppins.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w600,
      );
  static get labelLargePoppinsWhiteA700_1 =>
      theme.textTheme.labelLarge!.poppins.copyWith(
        color: appTheme.whiteA700,
      );
  static get labelLargeSemiBold => theme.textTheme.labelLarge!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get labelLargeWhiteA700 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.whiteA700,
      );
  static get labelLargeWhiteA700SemiBold =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w600,
      );
  static get labelMediumPoppinsBluegray400 =>
      theme.textTheme.labelMedium!.poppins.copyWith(
        color: appTheme.blueGray400,
        fontWeight: FontWeight.w500,
      );
  static get labelMediumPoppinsOnError =>
      theme.textTheme.labelMedium!.poppins.copyWith(
        color: theme.colorScheme.onError,
        fontWeight: FontWeight.w500,
      );
  static get labelMediumPoppinsOnErrorBold =>
      theme.textTheme.labelMedium!.poppins.copyWith(
        color: theme.colorScheme.onError,
        fontWeight: FontWeight.w700,
      );
  static get labelMediumPoppinsWhiteA700 =>
      theme.textTheme.labelMedium!.poppins.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w500,
      );
  // Title text style
  static get titleLargeGray900 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.gray900,
      );
  static get titleLargeWhiteA700 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.whiteA700,
      );
  static get titleLargeWhiteA700_1 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.whiteA700,
      );
  static get titleMediumInter => theme.textTheme.titleMedium!.inter;
  static get titleMediumInterGray70006 =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: appTheme.gray70006,
      );
  static get titleMediumInterMedium =>
      theme.textTheme.titleMedium!.inter.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get titleMediumInterSemiBold =>
      theme.textTheme.titleMedium!.inter.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get titleMediumKohSantepheap =>
      theme.textTheme.titleMedium!.kohSantepheap.copyWith(
        fontWeight: FontWeight.w900,
      );
  static get titleMediumOnError => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onError,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumWhiteA700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w500,
      );
  static get titleSmall15 => theme.textTheme.titleSmall!.copyWith(
        fontSize: 15.fSize,
      );
  static get titleSmallBlack900 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallBlack900Bold => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallBluegray900 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blueGray900,
      );
  static get titleSmallBold => theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get titleSmallBold15 => theme.textTheme.titleSmall!.copyWith(
        fontSize: 15.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallErrorContainer => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.errorContainer,
      );
  static get titleSmallGray70005 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray70005,
      );
  static get titleSmallPoppinsBlack900 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallPoppinsBlack900_1 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.black900,
      );
  static get titleSmallPoppinsWhiteA700 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.whiteA700,
      );
  static get titleSmallWhiteA700 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.whiteA700,
      );
}

extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get kohSantepheap {
    return copyWith(
      fontFamily: 'Koh Santepheap',
    );
  }
}
