import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:musio/consts/colors.dart';

class Downloads extends StatefulWidget {
  const Downloads({super.key});

  @override
  State<Downloads> createState() => _DownloadsState();
}

class _DownloadsState extends State<Downloads> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Column(
          children: [
            // App Bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(LucideIcons.menu, color: Colors.white),
                  onPressed: () {},
                ),
                Column(
                  children: [
                    SizedBox(height: 8.h),
                    Image.asset(
                      'assets/images/logo.png',
                      width: 61.w,
                      height: 61.h,
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(LucideIcons.search, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
            Text(
              'DOWNLOAD YOUR MUSIC',
              style: TextStyle(
                fontFamily: "Taile",
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onPrimary,
                fontSize: 20.sp,
              ),
            ),
            SizedBox(height: 20.h),

            Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.secondary,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 60,
                  vertical: 14,
                ),
                child: Text(
                  'SEARCH MUSIC FROM YOUTUBE',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: "Taile",
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
            ),

            SizedBox(height: 50.h),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'SELECT FROM TRUSTED SITES',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontFamily: "Taile",
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 90.h,
                    width: 90.w,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.secondary,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                  Container(
                    height: 90.h,
                    width: 90.w,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.secondary,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                  Container(
                    height: 90.h,
                    width: 90.w,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.secondary,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                  Container(
                    height: 90.h,
                    width: 90.w,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.secondary,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.h),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'RECENT DOWNLOADS',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontFamily: "Taile",
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 14,
                vertical: 10,
              ),
              child: Container(
                height: 300.h,
                width: 390.w,
                decoration: BoxDecoration(
                  color: theme.colorScheme.secondary,
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
