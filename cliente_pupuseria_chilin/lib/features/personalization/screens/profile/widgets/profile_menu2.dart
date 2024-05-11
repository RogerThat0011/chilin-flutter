import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ProfileMenu2 extends StatelessWidget {
  const ProfileMenu2({
    super.key,
    this.icon = Iconsax.arrow_right_34,
    required this.onPressed,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems / 1),
        child: Row(
          children: [
            Expanded(
                flex: 0,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodySmall,
                )),
            Expanded(
                flex: 5,
                child: Text(
                  value,
                  style: Theme.of(context).textTheme.bodyMedium,
                )),
            Expanded(child:
            Padding(
              padding: const EdgeInsets.only(left: 0),
                child: Icon(icon, size: 18)),
            ),

          ],
        ),
      ),
    );
  }
}
