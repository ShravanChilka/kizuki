import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../shared/component/image/cache_network_image_widget.dart';
import '../../model/user_model.dart';
import '../../view_model/profile_view_model.dart';
import 'profile_picture_shimmer.dart';

class ProfilePictureImage extends StatelessWidget {
  const ProfilePictureImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<ProfileViewModel, UserModel?>(
      selector: (_, viewModel) => viewModel.user,
      builder: (context, user, child) {
        return CacheNetworkImageWidget(
          imageUrl: user?.avatarUrl ?? '',
          errorWidget: (_, __, ___) => const ProfilePictureShimmer(),
          placeholder: (_, __) => const ProfilePictureShimmer(),
          imageBuilder: (_, imageProvider) {
            return CircleAvatar(
              radius: 45.sp,
              backgroundImage: imageProvider,
            );
          },
        );
      },
    );
  }
}
