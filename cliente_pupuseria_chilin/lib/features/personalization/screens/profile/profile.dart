import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/images/circular_image.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/popups/loaders.dart';
import 'package:t_store/utils/shimmers/ShimmerEffect.dart';
import 'package:flutter/services.dart';

import 'widgets/change_name.dart';
import 'widgets/change_phone_number.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Perfil'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  //PROFILE PICTURE
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image =
                      networkImage.isNotEmpty ? networkImage : TImages.user;
                      return controller.imageUploading.value
                          ? const ShimmerEffect(
                          width: 80, height: 80, radius: 80)
                          : CircularImage(
                          image: image,
                          width: 80,
                          height: 80,
                          isNetworkImage: networkImage.isNotEmpty);
                    }),
                    TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(),
                        child: const Text('Cambiar Foto de Perfil')),
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              //HEADER PROFILE INFO
              const TSectionHeading(
                  title: 'Información Principal', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              ProfileMenu(
                  title: 'Nombre',
                  value: controller.user.value.fullName,
                  onPressed: () => Get.to(() => const ChangeName())),
              ProfileMenu(
                  title: 'Usuario',
                  value: controller.user.value.username,
                  icon: Iconsax.copy,
                  onPressed: () {
                    Clipboard.setData(
                        ClipboardData(text: controller.user.value.username));
                    Loaders.warningSnackBar(title: "¡Nombre de usuario copiado!");
                  }),

              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              //HEADER PERSONAL INFO
              const TSectionHeading(
                  title: 'Información Personal', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              ProfileMenu(
                  title: 'ID',
                  value: controller.user.value.id,
                  icon: Iconsax.copy,
                  onPressed: () {
                    Clipboard.setData(
                        ClipboardData(text: controller.user.value.id));
                    Loaders.warningSnackBar(title: "¡Id de usuario copiado!");
                  }),
              ProfileMenu(
                  title: 'Correo',
                  value: controller.user.value.email,
                  icon: Iconsax.copy,
                  onPressed: () {
                    Clipboard.setData(
                        ClipboardData(text: controller.user.value.email));
                    Loaders.warningSnackBar(title: "¡Correo del usuario copiado!");
                  }),
              ProfileMenu(
                  title: 'Teléfono',
                  value: '+503 ${controller.user.value.phoneNumber}',
                  onPressed: () => Get.to(() => const ChangePhoneNumber())),

              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text('Cerrar Cuenta',
                      style: TextStyle(color: Colors.red)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
