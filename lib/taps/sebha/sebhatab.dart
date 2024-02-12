import 'package:flutter/material.dart';
import 'package:islamic/utils/aap_theme.dart';
import 'package:islamic/utils/app_assets.dart';
import 'package:islamic/utils/app_colors.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int prayerIndex = 0;
  double _turns = 0;
  final List<String> prayers = ["سُـبْحانَ اللهِ", "الحَمْـدُ لله ", "اللهُ أكْـبَر"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50,),
        Center(
          child: Column(
            children: [
              buildAnimationImage(),
            ],
          ),
        ),
        SizedBox(height: 50,),
        Text("عدد التسبيحات", style: AppTheme.mediumTitleTextStyle,),
        SizedBox(height: 30,),
        Container(
          width: 69,
          height: 81,
          child: Center(child: Text("${counter + 1}", style: AppTheme.smallTitleTextStyle,)),
          decoration: BoxDecoration(
            color: AppColors.brownlight,
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        SizedBox(height: 22,),
        Container(
          width: 137,
          height: 51,
          child: Center(child: Text(prayers[prayerIndex], style: AppTheme.smallTitleTextStyle2,)),
          decoration: BoxDecoration(
            color: AppColors.brown,
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ],
    );
  }

  Container buildAnimationImage() {
    return Container(
              child: RotationTransition(
                turns: AlwaysStoppedAnimation(_turns),
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      counter++;
                      if (counter == 33) {
                        counter = 0;
                        prayerIndex++;
                        if (prayerIndex == prayers.length) {
                          prayerIndex = 0;
                        }
                      }
                      _turns += 0.031;
                    });
                  },
                  child: Image.asset(AppAssets.sebha),
                ),
              ),
            );
  }
}