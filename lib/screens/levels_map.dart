import 'package:flutter/material.dart';
import 'package:level_map/level_map.dart';
import 'package:byte_wolves/constants/constants.dart';

class LevelMapPage extends StatelessWidget {
    final double currentLevel;

    const LevelMapPage(
        {super.key,
          required this.currentLevel});

    @override
    Widget build(BuildContext context) {
        return LevelMap(
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
                    imagePositionFactor: 0.1
                  ),
              ],
            ),
        );
    }
}