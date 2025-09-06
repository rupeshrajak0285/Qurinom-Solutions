import '../../common_libraries.dart';

enum AppNotifyType {
  success,
  info,
  error,
}

class AppToaster {
  final BuildContext context;
  final AppNotifyType notifyType;
  final String content;

  AppToaster({
    required this.context,
    required this.notifyType,
    required this.content,

  });

  void show() {
    final String message =  content;

    switch (notifyType) {
      case AppNotifyType.success:
        _showToast(message, AnimatedSnackBarType.success);
        break;
      case AppNotifyType.info:
        _showToast(message, AnimatedSnackBarType.warning,);
        break;
      case AppNotifyType.error:
        _showToast(message, AnimatedSnackBarType.error);
        break;
    }
  }

  void _showToast(String message, AnimatedSnackBarType type) {
    hideCurrentSnackBar();
    AnimatedSnackBar.material(
      message,
      type: type,
      mobilePositionSettings: const MobilePositionSettings(
        topOnAppearance: 100,
      ),
    ).show(context);
  }

  void hideCurrentSnackBar() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }
}
