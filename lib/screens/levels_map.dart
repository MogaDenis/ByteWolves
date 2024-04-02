import 'package:byte_wolves/models/user.dart';
import 'package:byte_wolves/screens/lectures.dart';
import 'package:byte_wolves/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:level_map/level_map.dart';
import 'package:byte_wolves/constants/constants.dart';

import '../service/lecture_service.dart';

class LevelMapPage extends StatelessWidget {
  final double currentLevel;
  final User user;

  const LevelMapPage(
      {super.key, required this.currentLevel, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () async {
          final lecture = await LectureService().getById(1);
          //navigate to the lecture page
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => LecturePage(
                    lecture: lecture,
                    user: user,
                  )));
        },
        child: LevelMap(
          backgroundColor: const Color(0xFF61A4F1),
          levelMapParams: LevelMapParams(
            levelCount: 8,
            currentLevel: currentLevel,
            enableVariationBetweenCurves: false,
            firstCurveReferencePointOffsetFactor: const Offset(0.8, 0.4),
            currentLevelImage: ImageParams(
              path: ImagesConstants.logoImage,
              size: const Size(75, 75),
            ),
            lockedLevelImage: ImageParams(
              path: ImagesConstants.levelLockedImage,
              size: const Size(75, 75),
            ),
            completedLevelImage: ImageParams(
              path: ImagesConstants.levelUnlockedImage,
              size: const Size(75, 75),
            ),
            bgImagesToBePaintedRandomly: [
              ImageParams(
                  path: ImagesConstants.cloudsImage,
                  size: const Size(250, 250),
                  repeatCountPerLevel: 1,
                  imagePositionFactor: 0.1),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          // navigate to the profile page
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProfileScreen(
                    user: user,
                  )));
        },
        child: const Icon(
          Icons.person,
          color: Colors.black,
        ),
      ),
    );
  }
}
