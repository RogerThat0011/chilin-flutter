
import 'package:get/get.dart';
import 'package:t_store/features/personalization/screens/address/address.dart';
import 'package:t_store/features/personalization/screens/profile/profile.dart';
import 'package:t_store/features/personalization/screens/settings/settings.dart';
import 'package:t_store/features/screens/login/login.dart';
import 'package:t_store/features/screens/onboarding.dart';
import 'package:t_store/features/screens/password_configuration/forget_password.dart';
import 'package:t_store/features/screens/signup/widgets/signup.dart';
import 'package:t_store/features/screens/signup/widgets/verify_email.dart';
import 'package:t_store/features/shop/screens/cart/widgets/cart.dart';
import 'package:t_store/features/shop/screens/checkout/checkout.dart';
import 'package:t_store/features/shop/screens/home/home.dart';
import 'package:t_store/features/shop/screens/order/order.dart';
import 'package:t_store/features/shop/screens/product_reviews/widgets/product_reviews.dart';
import 'package:t_store/features/shop/screens/store/store.dart';
import 'package:t_store/features/shop/screens/wishlist/whislist.dart';
import 'package:t_store/routes/routes.dart';

class AppRoutes{
  static final pages = [
    GetPage(name: CRoutes.home, page: () => const HomeScreen()),
    GetPage(name: CRoutes.store, page: () => const Store()),
    GetPage(name: CRoutes.favourites, page: () => const FavoriteScreen()),
    GetPage(name: CRoutes.settings, page: () => const SettingScreen()),
    GetPage(name: CRoutes.productReviews, page: () => const ProductReviewScreen()),
    GetPage(name: CRoutes.order, page: () => const OrderScreen()),
    GetPage(name: CRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: CRoutes.cart, page: () => const CartScreen()),
    GetPage(name: CRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: CRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: CRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: CRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: CRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: CRoutes.forgetPassword, page: () => const ForgetPassword()),
    GetPage(name: CRoutes.onBoarding, page: () => const OnBoardingScreen()),
  ];
}