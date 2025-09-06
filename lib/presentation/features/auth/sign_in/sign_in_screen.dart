import '../../../../common_libraries.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isButtonEnabled = false;
  String _selectedRole = "vendor";
  @override
  void initState() {
    super.initState();
    usernameController.addListener(_validateForm);
    passwordController.addListener(_validateForm);
  }

  void _validateForm() {
    final isNotEmpty = usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;

    if (isNotEmpty != isButtonEnabled) {
      setState(() {
        isButtonEnabled = isNotEmpty;
      });
    }
  }
  void _toggleRole(bool isVendor) {
    setState(() {
      _selectedRole = isVendor ? "vendor" : "customer";
    });
  }
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthViewModelBloc(context),
      child: BlocBuilder<AuthViewModelBloc, AuthViewModelState>(
        builder: (context, state) {
          final userId = Prefs.userId.get();
          if(userId.isNotEmpty){
            return const HomeScreen();
          }
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                      // 🔹 Role Switch
                      RoleSwitch(
                        selectedRole: _selectedRole,
                        onToggle: _toggleRole,
                      ),
                      const SizedBox(height: 20),
                      // Username field
                      CustomTextField(
                        controller: usernameController,
                        hintText: "Type your username",
                        labelText: "Username",
                        prefixIcon: Icons.person_outline,
                      ),
                      const SizedBox(height: 20),
              
                      // Password field
                      CustomTextField(
                        controller: passwordController,
                        hintText: "Type your password",
                        labelText: "Password",
                        prefixIcon: Icons.lock_outline,
                        obscureText: true,
                      ),
              
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: CustomTextButton(
                          text: "Forgot password?",
                          textColor: Colors.grey,
                          fontWeight: FontWeight.normal,
                          onPressed: () {
                            // Forgot password logic
                          },
                        ),
                      ),
              
                      const SizedBox(height: 20),
              
                      /// Login button (enabled/disabled)
                      CustomButton(
                        text: "LOGIN",
                        isLoading: state.pageStatus == PageStatus.loading,
                        onPressed: isButtonEnabled &&
                                state.pageStatus != PageStatus.loading
                            ? () {
                                context.read<AuthViewModelBloc>().add(
                                      AuthViewModelLoginClickEvent(
                                          LoginRequestModel(
                                        email: usernameController.text,
                                        password: passwordController.text,
                                        role: _selectedRole,
                                      )),
                                    );
                              }
                            : null, // disabled
                      ),
              
                      const SizedBox(height: 30),
                      const Text(
                        "Or Sign Up Using",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 15),
              
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildSocialButton(Icons.facebook, Colors.blue),
                          const SizedBox(width: 20),
                          _buildSocialButton(
                              Icons.alternate_email, Colors.lightBlue),
                          const SizedBox(width: 20),
                          _buildSocialButton(Icons.g_mobiledata, Colors.red),
                        ],
                      ),
              
                      AppDimens.spacerY50,
                      const Text(
                        "Or Sign Up Using",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
              
                      CustomTextButton(
                        text: "SIGN UP",
                        textColor: Colors.blue,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, Color color) {
    return CircleAvatar(
      radius: 24,
      backgroundColor: color,
      child: Icon(icon, color: Colors.white, size: 28),
    );
  }
}
