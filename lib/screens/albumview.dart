import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:musio/consts/songview.dart';

class Albumview extends StatefulWidget {
  const Albumview({super.key});

  @override
  State<Albumview> createState() => _AlbumviewState();
}

class _AlbumviewState extends State<Albumview> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Theme.of(context).colorScheme.primary,
            body: Column(
              children: [
                // Image header section (fixed height)
                SizedBox(
                  height: 220.h,
                  child: Stack(
                    children: [
                      ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.3),
                          BlendMode.darken,
                        ),
                        child: Image.asset(
                          'assets/images/albumcover.jpg',
                          width: double.infinity,
                          height: 250.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Back button
                      Positioned(
                        top: 30.h,
                        left: 8.w,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(10.w),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surface,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              LucideIcons.arrowLeft,
                              color: Theme.of(context).colorScheme.onSurface,
                              size: 26.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 560.h,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(height: 10.h),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "MR MORALE AND THE BIG",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Taile",
                                    fontSize: 34.sp,
                                    height: 0.8,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "BY KENDRICK LAMAR",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Taile",
                                    fontSize: 18.sp,
                                    height: 1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Center(
                          child: Column(
                            children: List.generate(
                              14,
                              (index) => Padding(
                                padding: EdgeInsets.only(bottom: 8.h),
                                child: const SongDisplay(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
