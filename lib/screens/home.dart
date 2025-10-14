import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:musio/consts/colors.dart';
import 'package:musio/consts/songview.dart';

// Add this IconImage widget if it's not defined elsewhere
class IconImage extends StatelessWidget {
  final String assetPath;
  final double width;
  final double height;
  final Color? color;

  const IconImage(
    this.assetPath, {
    Key? key,
    required this.width,
    required this.height,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(assetPath, width: width, height: height, color: color);
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text(
                  'GOOD EVENING',
                  style: TextStyle(
                    fontFamily: "Cambria",
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onPrimary,
                    fontSize: 20.sp,
                  ),
                ),
              ),

              SizedBox(height: 10.h),

              //Stats Section
              Container(
                width: 416.w,
                height: 100.h,
                decoration: BoxDecoration(
                  color: theme.colorScheme.secondary,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  children: [
                    //Songs Count
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10.w,
                        right: 4.w,
                        top: 10.h,
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 10.h),
                          Text(
                            'Songs',
                            style: TextStyle(
                              color: theme.colorScheme.onSecondary,
                              fontSize: 18.sp,
                              fontFamily: 'Cambria',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            '12',
                            style: TextStyle(
                              color: theme.colorScheme.onSecondary,
                              fontSize: 24.sp,
                              fontFamily: 'Taile',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    VerticalDivider(
                      color: theme.colorScheme.primary,
                      thickness: 2.w,
                      indent: 10.h,
                      endIndent: 10.h,
                    ),

                    //Albums Count
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Column(
                        children: [
                          SizedBox(height: 10.h),
                          Text(
                            'Albums',
                            style: TextStyle(
                              color: theme.colorScheme.onSecondary,
                              fontSize: 18.sp,
                              fontFamily: 'Cambria',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            '5',
                            style: TextStyle(
                              color: theme.colorScheme.onSecondary,
                              fontSize: 24.sp,
                              fontFamily: 'Taile',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    VerticalDivider(
                      color: theme.colorScheme.primary,
                      thickness: 2.w,
                      indent: 10.h,
                      endIndent: 10.h,
                    ),

                    //Listened Count
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Column(
                        children: [
                          SizedBox(height: 10.h),
                          Text(
                            'Listening Time',
                            style: TextStyle(
                              color: theme.colorScheme.onSecondary,
                              fontSize: 18.sp,
                              fontFamily: 'Cambria',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                child: Column(
                                  children: [
                                    SizedBox(height: 10.h),
                                    Text(
                                      '00',
                                      style: TextStyle(
                                        color: theme.colorScheme.onSecondary,
                                        fontSize: 24.sp,
                                        fontFamily: 'Taile',
                                        height: 0.8,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Days',
                                      style: TextStyle(
                                        color: theme.colorScheme.onSecondary,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Cambria',
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                child: Column(
                                  children: [
                                    SizedBox(height: 10.h),
                                    Text(
                                      '00',
                                      style: TextStyle(
                                        color: theme.colorScheme.onSecondary,
                                        fontSize: 24.sp,
                                        fontFamily: 'Taile',
                                        height: 0.8,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Hours',
                                      style: TextStyle(
                                        color: theme.colorScheme.onSecondary,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Cambria',
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                child: Column(
                                  children: [
                                    SizedBox(height: 10.h),
                                    Text(
                                      '00',
                                      style: TextStyle(
                                        color: theme.colorScheme.onSecondary,
                                        fontSize: 24.sp,
                                        fontFamily: 'Taile',
                                        height: 0.8,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Minutes',
                                      style: TextStyle(
                                        color: theme.colorScheme.onSecondary,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Cambria',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    VerticalDivider(
                      color: theme.colorScheme.primary,
                      thickness: 2.w,
                      indent: 10.h,
                      endIndent: 10.h,
                    ),

                    //Artist Count
                    Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Column(
                        children: [
                          SizedBox(height: 10.h),
                          Text(
                            'Artists',
                            style: TextStyle(
                              color: theme.colorScheme.onSecondary,
                              fontSize: 18.sp,
                              fontFamily: 'Cambria',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            '12',
                            style: TextStyle(
                              color: theme.colorScheme.onSecondary,
                              fontSize: 24.sp,
                              fontFamily: 'Taile',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    VerticalDivider(
                      color: theme.colorScheme.primary,
                      thickness: 2.w,
                      indent: 10.h,
                      endIndent: 10.h,
                    ),

                    //Playlists Count
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Column(
                        children: [
                          SizedBox(height: 10.h),
                          Text(
                            'Playlists',
                            style: TextStyle(
                              color: theme.colorScheme.onSecondary,
                              fontSize: 18.sp,
                              fontFamily: 'Cambria',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            '5',
                            style: TextStyle(
                              color: theme.colorScheme.onSecondary,
                              fontSize: 24.sp,
                              fontFamily: 'Taile',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10.h),
              //Most Played Section
              Container(
                width: 416.w,
                height: 280.h,
                decoration: BoxDecoration(
                  color: theme.colorScheme.secondary,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  children: [
                    Text(
                      'MOST PLAYED SONGS',
                      style: TextStyle(
                        color: theme.colorScheme.onSecondary,
                        fontSize: 24.sp,
                        height: 2,
                        fontFamily: 'Taile',
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Divider(
                      color: theme.colorScheme.primary,
                      thickness: 3.w,
                      indent: 10.h,
                      endIndent: 10.h,
                    ),

                    // List of most played songs
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SmallSongDisplay(),
                        SizedBox(height: 5.h),
                        SmallSongDisplay(),
                        SizedBox(height: 5.h),
                        SmallSongDisplay(),
                        SizedBox(height: 5.h),
                        SmallSongDisplay(),
                        SizedBox(height: 5.h),
                        SmallSongDisplay(),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10.h),
              //Recently Played Section
              Text(
                'RECENTLY PLAYED',
                style: TextStyle(
                  color: theme.colorScheme.onSecondary,
                  fontSize: 24.sp,
                  height: 2,
                  fontFamily: 'Taile',
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10.h),
              //Recently Played Section
              Text(
                'RECENTLY ADDED',
                style: TextStyle(
                  color: theme.colorScheme.onSecondary,
                  fontSize: 24.sp,
                  height: 2,
                  fontFamily: 'Taile',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
