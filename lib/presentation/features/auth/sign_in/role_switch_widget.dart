
import '../../../../common_libraries.dart';

class RoleSwitch extends StatelessWidget {
  final String selectedRole;
  final ValueChanged<bool> onToggle;

  const RoleSwitch({super.key, required this.selectedRole, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    final isVendor = selectedRole == "vendor";

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Customer",
          style: TextStyle(
            fontWeight: !isVendor ? FontWeight.bold : FontWeight.normal,
            color: !isVendor ? Colors.blue : Colors.grey,
          ),
        ),
        const SizedBox(width: 10),
        Switch(
          value: isVendor,
          onChanged: onToggle,
          activeColor: Colors.blue,
          inactiveThumbColor: Colors.blue,
        ),
        const SizedBox(width: 10),
        Text(
          "Vendor",
          style: TextStyle(
            fontWeight: isVendor ? FontWeight.bold : FontWeight.normal,
            color: isVendor ? Colors.blue : Colors.grey,
          ),
        ),
      ],
    );
  }
}
