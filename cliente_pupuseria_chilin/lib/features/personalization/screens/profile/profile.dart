import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/images/circular_image.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

import 'widgets/change_name.dart';

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
                    const CircularImage(
                        image: TImages.user, width: 80, height: 80),
                    TextButton(
                        onPressed: () {},
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
                  onPressed: () {}),

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
                  onPressed: () {}),
              ProfileMenu(
                  title: 'Correo',
                  value: controller.user.value.email,
                  onPressed: () {}),
              ProfileMenu(
                  title: 'Teléfono',
                  value: '+503 ${controller.user.value.phoneNumber}',
                  onPressed: () {}),
              ProfileMenu(title: 'Genero', value: 'Male', onPressed: () {}),
              ProfileMenu(
                  title: 'Fecha de Nacimiento',
                  value: '24 March, 1999',
                  onPressed: () {}),

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
