

import '../common_libraries.dart';

/// Generic class for app color codes.
class AppColor {
  // Primary Colors
  static Color primaryColor = const Color(0xFF2562B3);
  static Color primaryButtonColor = primaryColor;

  static const Color blackColor = Colors.black;
  static const Color instructionContainerBackGroundColor = Color(0xFFF3F3F3);
  static const Color darkGreyColor = Color(0xFF4B5563);
  static const Color lightGreyColor = Color(0xFF717171);
  static const Color whiteColor = Colors.white;
  static const Color borderColor = Colors.black12;

}

// constants/app_constants.dart
class AppColors {
  static const Color primaryBackground = Color(0xFF0A0A0A);
  static const Color secondaryBackground = Color(0xFF1A1A1A);
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFFB0B0B0);
  static const Color accent = Colors.red;
}

class AppDimensions {
  static const double heroSectionHeight = 450.0;
  static const double posterWidth = 140.0;
  static const double posterHeight = 200.0;
}

class AppTextStyles {
  static const TextStyle movieTitle = TextStyle(
    color: Colors.white,
    fontSize: 28,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
  );

  static const TextStyle sectionTitle = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.3,
  );

  static const TextStyle buttonText = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
}

class AppGradients {
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFFFF6B6B), Color(0xFFFF8E53)],
  );
}


class AppShadows {
  static List<BoxShadow> get posterShadows => [
    BoxShadow(
      color: Colors.black.withOpacity(0.6),
      blurRadius: 20,
      offset: const Offset(0, 10),
    ),
    BoxShadow(
      color: Colors.red.withOpacity(0.3),
      blurRadius: 40,
      offset: const Offset(0, 20),
    ),
  ];

  static List<BoxShadow> get glassButtonShadows => [
    BoxShadow(
      color: Colors.black.withOpacity(0.3),
      blurRadius: 10,
      offset: const Offset(0, 4),
    ),
  ];
}
