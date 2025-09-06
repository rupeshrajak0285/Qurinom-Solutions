import '../../common_libraries.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed; // nullable → disabled
  final double borderRadius;
  final List<Color> gradientColors;
  final bool isLoading; // loading state

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.borderRadius = 30,
    this.gradientColors = const [Colors.blue, Colors.purple],
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDisabled = onPressed == null || isLoading;

    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: isDisabled
            ? null // no gradient when disabled
            : LinearGradient(
          colors: gradientColors,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        color: isDisabled ? Colors.grey.shade50 : null, // solid gray when disabled
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: isDisabled ? null : onPressed,
        child: isLoading
            ? const SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 2,
          ),
        )
            : Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isDisabled ? Colors.black54 : Colors.white, // text color change
          ),
        ),
      ),
    );
  }
}
