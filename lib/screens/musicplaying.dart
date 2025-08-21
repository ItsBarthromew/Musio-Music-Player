import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class Musicplaying extends StatefulWidget {
  const Musicplaying({super.key});

  @override
  State<Musicplaying> createState() => _MusicplayingState();
}

class _MusicplayingState extends State<Musicplaying> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragEnd: (details) {
        if (details.primaryVelocity != null && details.primaryVelocity! > 0) {
          // Swiped down
          Navigator.pop(context);
        }
      },
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity != null) {
          if (details.primaryVelocity! < 0) {
            // Swiped left → next song
            print('Next song');
          } else if (details.primaryVelocity! > 0) {
            // Swiped right → previous song
            print('Previous song');
          }
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 200.h),
              SizedBox(
                height: 320.h,
                width: 320.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40.r),
                  child: Image.asset(
                    'assets/images/albumcover.jpeg',
                    width: 150.w,
                    height: 150.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              Text(
                "COUNT ON ME",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Taile",
                  fontSize: 34.sp,
                  height: 1,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Kendrick Lamar",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Cambria",
                  fontSize: 26.sp,
                  height: 0.8,
                ),
              ),
              SizedBox(height: 20.h),

              //Buttons
              SizedBox(
                width: 300.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        LucideIcons.plus,
                        size: 28.sp,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        LucideIcons.repeat,
                        size: 28.sp,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    Container(
                      padding: EdgeInsets.all(3.sp),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      child: IconButton(
                        icon: Icon(
                          LucideIcons.play,
                          size: 40.sp,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        LucideIcons.shuffle,
                        size: 28.sp,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        LucideIcons.heart,
                        size: 28.sp,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10.h),
              //Progress bar
              SizedBox(
                width: 390.w,
                child: Row(
                  children: [
                    SizedBox(width: 20.w),
                    Text(
                      "00:00:00",
                      style: TextStyle(
                        fontFamily: 'Cambria',
                        color: Colors.white,
                        fontSize: 10.sp,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Stack(
                        children: [
                          // Background bar
                          Container(
                            height: 14.h,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          // Progress bar
                          FractionallySizedBox(
                            widthFactor: 0.4, // Example: 40% progress
                            child: Container(
                              height: 14.h,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.onSurface,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      "00:03:45",
                      style: TextStyle(
                        fontFamily: 'Cambria',
                        color: Colors.white,
                        fontSize: 10.sp,
                      ),
                    ),
                    SizedBox(width: 20.w),
                  ],
                ),
              ),

              SizedBox(height: 10.h),
              Text(
                'ALBUM NAME',
                style: TextStyle(
                  fontFamily: 'Cambria',
                  color: Colors.white,
                  fontSize: 12.sp,
                ),
              ), // Album name
            ],
          ),
        ),
      ),
    );
  }
}
