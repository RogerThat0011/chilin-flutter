import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/images/circular_image.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';

class UserProfileTitle extends StatelessWidget {
  const UserProfileTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircularImage(
          image: TImages.user, width: 50, height: 50, padding: 0),
          title: Text('Carlos Castellanos', style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),),
          subtitle: Text('carlos@outlook.com', style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),),
          trailing: IconButton(onPressed: (){}, icon: const Icon(Iconsax.edit, color: TColors.white,)),
    );
  }
}