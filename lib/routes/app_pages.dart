import 'package:get/get.dart';
import '../view/login_view.dart';
import '../view/signup_view.dart';
import '../view/profile_view.dart';
import '../binding/login_binding.dart';
import '../binding/signup_binding.dart';
import '../binding/profile_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(name: _Paths.SIGNUP, page: () => const SignupView()),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
