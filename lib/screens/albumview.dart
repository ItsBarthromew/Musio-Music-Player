import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            body: Column(
              children: [
                // Image header section (fixed height)
                SizedBox(
                  height: 200.h,
                  child: Stack(
                    children: [
                      ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.3),
                          BlendMode.darken,
                        ),
                        child: Image.asset(
                          'assets/images/albumcover.jpeg',
                          width: double.infinity,
                          height: 250.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),

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
                            fontSize: 24.sp,
                            height: 1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
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
