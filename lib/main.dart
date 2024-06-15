import 'package:firebase_auth/firebase_auth.dart' as model;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shiv_super_app/core/error/error_text.dart';
import 'package:shiv_super_app/core/error/loader.dart';
import 'package:shiv_super_app/core/theme/app_theme.dart';
import 'package:shiv_super_app/features/auth/controller/auth_controller.dart';
import 'package:shiv_super_app/features/auth/models/user_model.dart';
import 'package:shiv_super_app/features/onboarding/screens/onboarding_screen.dart';
import 'package:shiv_super_app/features/tabbar/tabbar_screen.dart';
import 'package:shiv_super_app/firebase_options.dart';
import 'package:stream_video_flutter/stream_video_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  StreamVideo(
    'mmhfdzb5evj2',
    user: const User(
      info: UserInfo(
        name: 'John Doe',
        id: 'Darth_Maul',
      ),
    ),
    userToken:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiRGFydGhfTWF1bCIsImlzcyI6Imh0dHBzOi8vcHJvbnRvLmdldHN0cmVhbS5pbyIsInN1YiI6InVzZXIvRGFydGhfTWF1bCIsImlhdCI6MTcxODM2NTIwNSwiZXhwIjoxNzE4OTcwMDEwfQ.synqFjHVM_thqbURks61MhYHGJBrMfNr1jFq_t_mgg0',
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  UserModel? userModel;

  void getData(WidgetRef ref, model.User data) async {
    userModel = await ref
        .watch(authControllerProvider.notifier)
        .getCurrentUserDataaaa();
    ref.read(userProvider.notifier).update((state) => userModel);
    setState(() {});
  }

  // @override
  // Widget build(BuildContext context) {
  //   return ref.watch(authStateChangeProvider).when(
  //         data: (user) {
  //           return MaterialApp(
  //             debugShowCheckedModeBanner: false,
  //             title: 'Shivu',
  //             theme: AppTheme.lightModeAppTheme,
  //           );
  //           // if (user != null) {
  //           //   getData(ref, user);
  //           //   if (userModel != null) {
  //           //     return const MaterialApp(
  //           //       home: TabbarScreen(),
  //           //     );
  //           //   }
  //           // }
  //           // return const MaterialApp(
  //           //   home: LoginScreen(),
  //           // );
  //         },
  //         error: (error, st) {
  //           return ErrorScreen(
  //             error: error.toString(),
  //           );
  //         },
  //         loading: () => const LoadingScreen(),
  //       );
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shivu',
      theme: AppTheme.lightModeAppTheme,
      home: ref.watch(authStateChangeProvider).when(
            data: (user) {
              if (user != null) {
                getData(ref, user);
                return const TabbarScreen();
              } else {
                return const OnboardingScreen();
              }
            },
            error: (error, st) {
              return ErrorScreen(
                error: error.toString(),
              );
            },
            loading: () => const LoadingScreen(),
          ),
    );
  }
}


    // const String apiKey = 'AIzaSyD_j96ebqWDKf-wsPI1yG3IgOuST2RzIt8';
    // const String query = 'flutter g';  

//     post_install do |installer|
//   installer.pods_project.targets.each do |target|
//     flutter_additional_ios_build_settings(target)
//     target.build_configurations.each do |config|
//       config.build_settings["IPHONEOS_DEPLOYMENT_TARGET"] = "10.0"
//       config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
//       config.build_settings['ONLY_ACTIVE_ARCH'] = 'YES'
//     end
//   end
// end