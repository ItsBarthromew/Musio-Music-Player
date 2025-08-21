import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musio/screens/albumview.dart';
import 'package:musio/screens/artistview.dart';
import 'package:musio/screens/playlistview.dart';

class SmallSongDisplay extends StatefulWidget {
  const SmallSongDisplay({super.key});

  @override
  State<SmallSongDisplay> createState() => _SmallSongDisplayState();
}

class _SmallSongDisplayState extends State<SmallSongDisplay> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 300.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '1',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontSize: 24.sp,
                      fontFamily: 'Cambria',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(
                  height: 35.h,
                  width: 35.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Image.asset(
                      'assets/images/albumcover.jpeg',
                      width: 50.w,
                      height: 50.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'BACK TO THE MOON',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontSize: 18.sp,
                          height: 0.8,
                          fontFamily: 'Taile',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Gunna',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontSize: 16.sp,
                            height: 0.8,

                            fontFamily: 'Cambria',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Text(
              "65",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondary,
                fontSize: 20.sp,
                fontFamily: 'Cambria',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//Songs Viewer
class SongDisplay extends StatefulWidget {
  const SongDisplay({super.key});

  @override
  State<SongDisplay> createState() => _SongDisplayState();
}

class _SongDisplayState extends State<SongDisplay> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 360.w,
            height: 60.h,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontSize: 24.sp,
                      fontFamily: 'Cambria',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(
                  height: 50.h,
                  width: 50.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Image.asset(
                      'assets/images/albumcover.jpg',
                      width: 50.w,
                      height: 50.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'COUNT ON ME',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontSize: 20.sp,
                          height: 0.8,
                          fontFamily: 'Taile',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Kendrick Lamar',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontSize: 12.sp,
                          height: 0.8,
                          fontFamily: 'Cambria',
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 12.w),
                      child: Text(
                        "03:32",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontSize: 10.sp,
                          fontFamily: 'Cambria',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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

// Album Display
class AlbumPreview extends StatelessWidget {
  final String title;
  final String artist;
  final String imagePath;

  const AlbumPreview({
    super.key,
    required this.title,
    required this.artist,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Albumview()),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 150.h,
              width: 150.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.asset(
                  imagePath,
                  width: 150.w,
                  height: 150.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 6.h),
            Text(
              title,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondary,
                fontSize: 18.sp,
                height: 0.8,
                fontFamily: 'Taile',
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              artist,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondary,
                fontSize: 16.sp,
                height: 0.8,
                fontFamily: 'Cambria',
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

//Artist Display
class ArtistPreview extends StatelessWidget {
  final String name;
  final String imagePath;

  const ArtistPreview({super.key, required this.name, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(
              context,
              rootNavigator: false,
            ).push(MaterialPageRoute(builder: (context) => const Artistview()));
          },
          child: Container(
            height: 120.h,
            width: 120.w,
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: ClipOval(
              child: Image.asset(
                imagePath,
                width: 120.w,
                height: 120.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 2.h),
        Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            fontFamily: 'Taile',
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

// Playlist Display
class PlaylistPreview extends StatelessWidget {
  const PlaylistPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(
          context,
          rootNavigator: false,
        ).push(MaterialPageRoute(builder: (context) => const Playlistview()));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 150.h,
              width: 150.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.asset(
                  'assets/images/albumcover.jpeg',
                  width: 150.w,
                  height: 150.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 6.h),
            Text(
              "100% Hits",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondary,
                fontSize: 18.sp,
                height: 0.8,
                fontFamily: 'Taile',
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
