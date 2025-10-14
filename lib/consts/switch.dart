import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedHorizontalSwitch extends StatefulWidget {
  final ValueChanged<bool>? onChanged;
  final bool initialValue;
  final String title;
  final Color activeColor;
  final Color inactiveColor;
  final Color circleColor;

  const AnimatedHorizontalSwitch({
    super.key,
    this.onChanged,
    this.initialValue = true,
    this.title = '',
    this.activeColor = Colors.green,
    this.inactiveColor = Colors.grey,
    this.circleColor = Colors.white,
  });

  @override
  State<AnimatedHorizontalSwitch> createState() =>
      _AnimatedHorizontalSwitchState();
}

class _AnimatedHorizontalSwitchState extends State<AnimatedHorizontalSwitch> {
  late bool _isLeft;

  @override
  void initState() {
    super.initState();
    _isLeft = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // The switch
        GestureDetector(
          onTap: () {
            setState(() {
              _isLeft = !_isLeft;
            });
            widget.onChanged?.call(_isLeft);
          },
          child: Container(
            width: 60.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: _isLeft ? widget.inactiveColor : widget.activeColor,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Stack(
              children: [
                // Circle container
                AnimatedAlign(
                  duration: const Duration(milliseconds: 300),
                  alignment: _isLeft
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.all(4.w),
                    child: Container(
                      width: 32.w,
                      height: 32.h,
                      decoration: BoxDecoration(
                        color: widget.circleColor,
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
        if (widget.title.isNotEmpty) ...[
          SizedBox(height: 8.h),
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 12.sp,
              fontFamily: 'Clarendon',
              color: Colors.white,
            ),
          ),
        ],
      ],
    );
  }
}

// Controller class to manage the switch state
class SwitchController {
  _AnimatedHorizontalSwitchState? _state;

  void attach(_AnimatedHorizontalSwitchState state) {
    _state = state;
  }

  void detach() {
    _state = null;
  }

  bool get value => _state?._isLeft ?? true;

  set value(bool newValue) {
    if (_state != null && _state!.mounted) {
      _state!.setState(() {
        _state!._isLeft = newValue;
      });
      _state!.widget.onChanged?.call(newValue);
    }
  }

  void toggle() {
    value = !value;
  }
}
