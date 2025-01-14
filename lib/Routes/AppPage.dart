import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:job_posting_application/Bindings/HomeBinding.dart';
import 'package:job_posting_application/Bindings/ProfileBinding.dart';
import 'package:job_posting_application/Bindings/WishlistBinding.dart';
import 'package:job_posting_application/Views/HomePage.dart';
import 'package:job_posting_application/Views/WishlistPage.dart';

import '../Bindings/JobsBinding.dart';
import '../Bindings/LoginBinding.dart';
import '../Bindings/RegistrationBinding.dart';
import '../Views/Login.dart';
import '../Views/ProfilePage.dart';
import '../Views/Registration.dart';
import '../Views/JobsPage.dart';
import 'AppRoute.dart';

class AppPage {
static final List<GetPage> pages = [
  GetPage(name: AppRoute.register, page: ()=> const Registration(), binding: RegistrationBinding()),
  GetPage(name: AppRoute.login, page: ()=> const Login(), binding: LoginBinding()),
  GetPage(name: AppRoute.jobsPage, page: () =>  JobsPage(), binding: JobPageBinding()),
  GetPage(name: AppRoute.wishlist, page: () => const WishlistPage(), binding: WishlistBinding()),
  GetPage(name: AppRoute.profile, page: () => const ProfilePage(), binding: ProfileBinding()),
  GetPage(name: AppRoute.home, page: () => const HomePage(), binding: HomeBinding())
];
}

