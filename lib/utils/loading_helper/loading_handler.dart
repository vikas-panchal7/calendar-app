import 'package:calendar_app/extensions/buildContext_ext.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

part 'loading_indicator.dart';

String _lottiePath = 'assets/lottie/loading.json';

abstract class _DialogHandler {
  void startLoading(bool isShowBackground);

  void stopLoading();

  void handleBgDialog(bool isLoading);

  void handleDialog(bool isLoading);
}

class LoadingDialogHandler implements _DialogHandler {
  LoadingDialogHandler({required this.context});

  final BuildContext context;

  @override
  void startLoading(bool isShowBackground) {
    _showLoadingDialog(context: context, isShowBackGround: isShowBackground);
  }

  @override
  void stopLoading() {
    context.rootNavigator.pop();
  }

  @override
  void handleBgDialog(bool isLoading) {
    if (isLoading) {
      startLoading(true);
    } else {
      stopLoading();
    }
  }

  @override
  void handleDialog(bool isLoading) {
    if (isLoading) {
      startLoading(false);
    } else {
      stopLoading();
    }
  }
}

void _showLoadingDialog({required BuildContext context, required bool isShowBackGround}) {
  showDialog(
    context: context,
    useRootNavigator: true,
    builder: (context) {
      return Dialog(
        insetPadding: EdgeInsets.symmetric(
          horizontal: context.width * .37,
        ),
        elevation: 0,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
        backgroundColor: isShowBackGround ? Colors.white : Colors.transparent,
        child: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Container(child: Lottie.asset(_lottiePath)),
        ),
      );
    },
  );
}
