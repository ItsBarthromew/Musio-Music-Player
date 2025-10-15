import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:musio/consts/colors.dart';
import 'package:musio/consts/songview.dart';

class Playlistview extends StatefulWidget {
  const Playlistview({super.key});

  @override
  State<Playlistview> createState() => _PlaylistviewState();
}

class _PlaylistviewState extends State<Playlistview> {
  Widget _buildControlButton(IconData icon) {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Icon(icon, color: Colors.white, size: 12.sp),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: SafeArea(
        child: Column(
          children: [
            // Header with logo and controls
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        LucideIcons.arrowLeft,
                        color: Colors.white,
                      ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildControlButton(LucideIcons.shuffle),
                    SizedBox(width: 8.w),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.secondary,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            LucideIcons.arrowDownAZ,
                            color: Colors.white,
                            size: 16.sp,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            'A-Z',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.white,
                              fontFamily: 'Cambria',
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.w),
                    _buildControlButton(LucideIcons.play),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10.h),

            ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3),
                BlendMode.darken,
              ),
              child: Image.asset(
                'assets/images/albumcover.jpg',
                width: double.infinity,
                height: 160.h,
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(height: 10.h),
            Text(
              "PLAYLIST NAME",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Taile",
                fontSize: 34.sp,
                height: 0.8,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.h),
            SizedBox(
              height: 420.h,
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: List.generate(
                      14,
                      (index) => Padding(
                        padding: EdgeInsets.only(bottom: 8.h),
                        child: const SongDisplay(
                          title: '',
                          artist: '',
                          length: '',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
