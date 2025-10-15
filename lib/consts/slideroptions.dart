import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Controller to manage all audio settings
class AudioSettingsController {
  bool naturalSound = true;
  bool bassBoost = false;
  bool threeDEffect = false;
  bool autoPlay = true;
  bool crossfade = false;

  VoidCallback? onSettingsChanged;

  void updateNaturalSound(bool value) {
    naturalSound = value;
    onSettingsChanged?.call();
  }

  void updateBassBoost(bool value) {
    bassBoost = value;
    onSettingsChanged?.call();
  }

  void updateThreeDEffect(bool value) {
    threeDEffect = value;
    onSettingsChanged?.call();
  }

  void updateAutoPlay(bool value) {
    autoPlay = value;
    onSettingsChanged?.call();
  }

  void updateCrossfade(bool value) {
    crossfade = value;
    onSettingsChanged?.call();
  }
}

class MoreOptionsPopup extends StatefulWidget {
  final AudioSettingsController controller;

  const MoreOptionsPopup({super.key, required this.controller});

  @override
  State<MoreOptionsPopup> createState() => _MoreOptionsPopupState();
}

class _MoreOptionsPopupState extends State<MoreOptionsPopup> {
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
                    fontFamily: 'Clarendon',
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.close, size: 24.w),
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
                  value: widget.controller.naturalSound,
                  activeColor: Colors.green,
                  inactiveColor: Colors.grey,
                  circleColor: Colors.white,
                  title: 'Natural Sound',
                  onChanged: (value) {
                    widget.controller.updateNaturalSound(value);
                    setState(() {}); // Update UI
                  },
                ),
                AnimatedHorizontalSwitch(
                  value: widget.controller.bassBoost,
                  activeColor: Colors.green,
                  inactiveColor: Colors.grey,
                  circleColor: Colors.white,
                  title: 'Bass Boost',
                  onChanged: (value) {
                    widget.controller.updateBassBoost(value);
                    setState(() {}); // Update UI
                  },
                ),
                AnimatedHorizontalSwitch(
                  value: widget.controller.threeDEffect,
                  activeColor: Colors.green,
                  inactiveColor: Colors.grey,
                  circleColor: Colors.white,
                  title: '3D Effect',
                  onChanged: (value) {
                    widget.controller.updateThreeDEffect(value);
                    setState(() {}); // Update UI
                  },
                ),
              ],
            ),

            SizedBox(height: 20.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AnimatedHorizontalSwitch(
                  value: widget.controller.autoPlay,
                  activeColor: Colors.blue,
                  inactiveColor: Colors.grey,
                  circleColor: Colors.white,
                  title: 'Auto Play',
                  onChanged: (value) {
                    widget.controller.updateAutoPlay(value);
                    setState(() {}); // Update UI
                  },
                ),
                AnimatedHorizontalSwitch(
                  value: widget.controller.crossfade,
                  activeColor: Colors.orange,
                  inactiveColor: Colors.grey,
                  circleColor: Colors.white,
                  title: 'Crossfade',
                  onChanged: (value) {
                    widget.controller.updateCrossfade(value);
                    setState(() {}); // Update UI
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

class AnimatedHorizontalSwitch extends StatelessWidget {
  final ValueChanged<bool>? onChanged;
  final bool value;
  final String title;
  final Color activeColor;
  final Color inactiveColor;
  final Color circleColor;

  const AnimatedHorizontalSwitch({
    super.key,
    this.onChanged,
    required this.value,
    this.title = '',
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.circleColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // The switch
        GestureDetector(
          onTap: () {
            onChanged?.call(!value);
          },
          child: Container(
            width: 80.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: value ? Colors.grey : Colors.green,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Stack(
              children: [
                // Circle container
                AnimatedAlign(
                  duration: const Duration(milliseconds: 300),
                  alignment: value
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.all(4.w),
                    child: Container(
                      width: 32.w,
                      height: 32.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Custom title
        if (title.isNotEmpty) ...[
          SizedBox(height: 8.h),
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: 'Cambria',
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ],
    );
  }
}
