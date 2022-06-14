import 'package:flutter/material.dart';

class CircleAvatarWidget extends StatelessWidget {
  const CircleAvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      child: const CircleAvatar(
        backgroundImage: NetworkImage(
          'https://mir-s3-cdn-cf.behance.net/project_modules/1400/fc6b1238650505.598fa11a29a17.png',
        ),
      ),
    );
  }
}
