import 'common_libraries.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ApiClientService.init();
  await Prefs.init();
  // Set status bar color and icon brightness
  SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
    statusBarColor: Colors.blue.shade50, // Status bar background color
    statusBarIconBrightness: Brightness.light, // For Android
    statusBarBrightness: Brightness.dark, // For iOS
  ));
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepository(),
        ),
        RepositoryProvider<ChatRepository>(
          create: (context) => ChatRepository(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false, // switch to true if you want Material3
        ),
        home: const SignInScreen(),
      ),
    );
  }
}
