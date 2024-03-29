/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ic_books.png
  AssetGenImage get icBooks => const AssetGenImage('assets/icons/ic_books.png');

  /// File path: assets/icons/ic_calendar.png
  AssetGenImage get icCalendar =>
      const AssetGenImage('assets/icons/ic_calendar.png');

  /// File path: assets/icons/ic_edit.png
  AssetGenImage get icEdit => const AssetGenImage('assets/icons/ic_edit.png');

  /// File path: assets/icons/ic_google.png
  AssetGenImage get icGoogle =>
      const AssetGenImage('assets/icons/ic_google.png');

  /// File path: assets/icons/ic_news.png
  AssetGenImage get icNews => const AssetGenImage('assets/icons/ic_news.png');

  /// File path: assets/icons/ic_paste.png
  AssetGenImage get icPaste => const AssetGenImage('assets/icons/ic_paste.png');

  /// File path: assets/icons/ic_videos.png
  AssetGenImage get icVideos =>
      const AssetGenImage('assets/icons/ic_videos.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [icBooks, icCalendar, icEdit, icGoogle, icNews, icPaste, icVideos];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/app_logo.png
  AssetGenImage get appLogo =>
      const AssetGenImage('assets/images/app_logo.png');

  /// File path: assets/images/book.png
  AssetGenImage get book => const AssetGenImage('assets/images/book.png');

  /// File path: assets/images/facebook.png
  AssetGenImage get facebook =>
      const AssetGenImage('assets/images/facebook.png');

  /// File path: assets/images/instagram.png
  AssetGenImage get instagram =>
      const AssetGenImage('assets/images/instagram.png');

  /// File path: assets/images/news.png
  AssetGenImage get news => const AssetGenImage('assets/images/news.png');

  /// File path: assets/images/video.png
  AssetGenImage get video => const AssetGenImage('assets/images/video.png');

  /// File path: assets/images/whatsapp.png
  AssetGenImage get whatsapp =>
      const AssetGenImage('assets/images/whatsapp.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [appLogo, book, facebook, instagram, news, video, whatsapp];
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/loading.json
  String get loading => 'assets/lottie/loading.json';

  /// List of all assets
  List<String> get values => [loading];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
