import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musio/consts/moreoptions.dart';

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
        body: Hero(
          tag: 'music-player',
          flightShuttleBuilder:
              (
                flightContext,
                animation,
                flightDirection,
                fromHeroContext,
                toHeroContext,
              ) {
                final Widget hero = flightDirection == HeroFlightDirection.push
                    ? toHeroContext.widget
                    : fromHeroContext.widget;

                return Material(color: Colors.transparent, child: hero);
              },
          child: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Playing From",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Clarendon",
                        fontSize: 14.sp,
                      ),
                    ),
                    Text(
                      "PLAYLIST NAME",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Clarendon",
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.onPrimary,
                          width: 0.5,
                        ),
                      ),
                      width: double.infinity,
                      height: 50.h,
                      child: Center(
                        child: Text(
                          "BANNER AD",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontFamily: "Cambria",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 60.h),
                    SizedBox(
                      height: 350.h,
                      width: 350.w,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.r),
                        child: Image.asset(
                          'assets/images/albumcover.jpeg',
                          width: 350.w,
                          height: 350.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      "COUNT ON ME",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Clarendon",
                        fontSize: 34.sp,
                        height: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Kendrick Lamar",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Clarendon",
                        fontSize: 22.sp,
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
                            icon: ImageIcon(
                              AssetImage("assets/images/add.png"),
                              size: 30.sp,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: ImageIcon(
                              AssetImage("assets/images/repeatall.png"),
                              size: 30.sp,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: ImageIcon(
                              AssetImage("assets/images/pause.png"),
                              size: 60.sp,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: ImageIcon(
                              AssetImage("assets/images/shuffle.png"),
                              size: 30.sp,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: ImageIcon(
                              AssetImage("assets/images/like.png"),
                              size: 30.sp,
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
                              fontFamily: 'Clarendon',
                              color: Colors.white,
                              fontSize: 12.sp,
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
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                    borderRadius: BorderRadius.circular(4.r),
                                  ),
                                ),
                                // Progress bar
                                FractionallySizedBox(
                                  widthFactor: 0.4, // Example: 40% progress
                                  child: Container(
                                    height: 14.h,
                                    decoration: BoxDecoration(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurface,
                                      borderRadius: BorderRadius.circular(4.r),
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
                              fontFamily: 'Clarendon',
                              color: Colors.white,
                              fontSize: 12.sp,
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
                        fontFamily: 'Clarendon',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    // Simple icon button approach
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => MoreOptionsPopup(),
                        );
                      },
                      icon: Text(
                        'More Options',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Clarendon',
                          fontSize: 16.sp,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),

                    SizedBox(height: 40.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ImageIcon(
                            AssetImage("assets/images/export.png"),
                            size: 30.sp,
                            color: Colors.white,
                          ),
                          ImageIcon(
                            AssetImage("assets/images/music-filter.png"),
                            size: 30.sp,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
