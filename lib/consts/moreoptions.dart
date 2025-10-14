import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:musio/consts/switch.dart';

class MoreOptionsPopup extends StatefulWidget {
  const MoreOptionsPopup({super.key});

  @override
  State<MoreOptionsPopup> createState() => _MoreOptionsPopupState();
}

class _MoreOptionsPopupState extends State<MoreOptionsPopup> {
  bool _naturalSound = true;
  bool _bassBoost = false;
  bool _threeDEffect = false;
  bool _autoPlay = true;
  bool _crossfade = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(20.w),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Audio Settings',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontFamily: "Clarendon",
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(LucideIcons.x, size: 24.w),
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(minWidth: 40.w, minHeight: 40.h),
                ),
              ],
            ),

            SizedBox(height: 20.h),

            // Switches
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AnimatedHorizontalSwitch(
                  initialValue: _naturalSound,
                  activeColor: Colors.green,
                  inactiveColor: Colors.grey,
                  circleColor: Colors.white,
                  title: 'Natural Sound',
                  onChanged: (value) {
                    setState(() {
                      _naturalSound = value;
                    });
                    print('Natural Sound: $value');
                  },
                ),
                AnimatedHorizontalSwitch(
                  initialValue: _bassBoost,
                  activeColor: Colors.green,
                  inactiveColor: Colors.grey,
                  circleColor: Colors.white,
                  title: 'Bass Boost',
                  onChanged: (value) {
                    setState(() {
                      _bassBoost = value;
                    });
                    print('Bass Boost: $value');
                  },
                ),
                AnimatedHorizontalSwitch(
                  initialValue: _threeDEffect,
                  activeColor: Colors.green,
                  inactiveColor: Colors.grey,
                  circleColor: Colors.white,
                  title: '3D Effect',
                  onChanged: (value) {
                    setState(() {
                      _threeDEffect = value;
                    });
                    print('3D Effect: $value');
                  },
                ),
              ],
            ),

            SizedBox(height: 20.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AnimatedHorizontalSwitch(
                  initialValue: _autoPlay,
                  activeColor: Colors.green,
                  inactiveColor: Colors.grey,
                  circleColor: Colors.white,
                  title: 'Auto Play',
                  onChanged: (value) {
                    setState(() {
                      _autoPlay = value;
                    });
                    print('Auto Play: $value');
                  },
                ),
                AnimatedHorizontalSwitch(
                  initialValue: _crossfade,
                  activeColor: Colors.green,
                  inactiveColor: Colors.grey,
                  circleColor: Colors.white,
                  title: 'Crossfade',
                  onChanged: (value) {
                    setState(() {
                      _crossfade = value;
                    });
                    print('Crossfade: $value');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
