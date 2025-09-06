import '../../common_libraries.dart';

class AvatarWidget extends StatelessWidget {
  final String name;
  final double radius;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final bool showBorder;
  final Color borderColor;
  final double borderWidth;

  const AvatarWidget({
    Key? key,
    required this.name,
    this.radius = 28,
    this.backgroundColor,
    this.textStyle,
    this.showBorder = false,
    this.borderColor = Colors.white,
    this.borderWidth = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String initial = name.isNotEmpty ? name[0].toUpperCase() : "👤";

    return Container(
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: backgroundColor == null
            ? const LinearGradient(
          colors: [Color(0xFF42A5F5), Color(0xFF478DE0)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )
            : null,
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
        border: showBorder
            ? Border.all(color: borderColor, width: borderWidth)
            : null,
      ),
      child: CircleAvatar(
        radius: radius,
        backgroundColor: Colors.transparent,
        child: Text(
          initial,
          style: textStyle ??
              TextStyle(
                fontSize: initial != "👤" ? radius * 0.6 : radius * 0.7,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: const [
                  Shadow(
                    blurRadius: 2,
                    color: Colors.black26,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
        ),
      ),
    );
  }
}
