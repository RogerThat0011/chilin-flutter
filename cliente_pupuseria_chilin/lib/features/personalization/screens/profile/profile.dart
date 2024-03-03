import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/images/circular_image.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  value: 'Carlos Castellanos',
                  onPressed: () {}),
              ProfileMenu(
                  title: 'Usuario',
                  value: 'Carlos Castellanos',
                  onPressed: () {}),

              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              //HEADER PERSONAL INFO
              const TSectionHeading(
                  title: 'Información Personal', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              ProfileMenu(title: 'ID', value: '543654', onPressed: () {}),
              ProfileMenu(
                  title: 'Correo', value: 'carlos@gmail.com', onPressed: () {}),
              ProfileMenu(
                  title: 'Teléfono', value: '+503 73933502', onPressed: () {}),
              ProfileMenu(title: 'Genero', value: 'Male', onPressed: () {}),
              ProfileMenu(
                  title: 'Fecha de Nacimiento',
                  value: '24 March, 1999',
                  onPressed: () {}),

              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () {},
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
