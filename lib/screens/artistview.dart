import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:musio/consts/Musicwidget.dart';
import 'package:musio/consts/songview.dart';
import 'package:musio/screens/albums.dart';
import 'package:musio/screens/artists.dart';
import 'package:musio/screens/downloads.dart';
import 'package:musio/screens/home.dart';
import 'package:musio/screens/playlists.dart';
import 'package:musio/screens/songs.dart';

class Artistview extends StatefulWidget {
  const Artistview({super.key});

  @override
  State<Artistview> createState() => _ArtistviewState();
}

class _ArtistviewState extends State<Artistview> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Home(),
    const Songs(),
    const Albums(),
    const Artists(),
    const Playlists(),
    const Downloads(),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

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
            // Working nav bar
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              selectedItemColor: Colors.white,
              unselectedItemColor: Theme.of(context).colorScheme.secondary,
              backgroundColor: Theme.of(context).colorScheme.primary,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(LucideIcons.house),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(LucideIcons.music2),
                  label: 'Songs',
                ),
                BottomNavigationBarItem(
                  icon: Icon(LucideIcons.discAlbum),
                  label: 'Albums',
                ),
                BottomNavigationBarItem(
                  icon: Icon(LucideIcons.users),
                  label: 'Artists',
                ),
                BottomNavigationBarItem(
                  icon: Icon(LucideIcons.listMusic),
                  label: 'Playlists',
                ),
                BottomNavigationBarItem(
                  icon: Icon(LucideIcons.download),
                  label: 'Downloads',
                ),
              ],
            ),

            backgroundColor: Theme.of(context).colorScheme.primary,
            body: Column(
              children: [
                // Image header section (fixed height)
                SizedBox(
                  height: 250.h,
                  child: Stack(
                    children: [
                      ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.3),
                          BlendMode.darken,
                        ),
                        child: Image.asset(
                          'assets/images/artistcover.jpeg',
                          width: double.infinity,
                          height: 250.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        left: 8.w,
                        bottom: 4.h,
                        child: Text(
                          "KENDRICK LAMAR",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Taile",
                            fontSize: 34.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Scrollable content section
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h),

                        // Details section
                        Text(
                          'Details Details Details Details...',
                          style: TextStyle(
                            fontFamily: "Taile",
                            fontSize: 10.sp,
                            color: const Color.fromARGB(255, 102, 102, 102),
                          ),
                        ),
                        SizedBox(height: 5.h),

                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            'READ MORE',
                            style: TextStyle(
                              fontFamily: "Cambria",
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                        ),

                        SizedBox(height: 20.h),

                        // Albums section
                        Text(
                          'ALBUMS',
                          style: TextStyle(
                            fontFamily: "Taile",
                            fontSize: 26.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.h),

                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              4,
                              (index) => AlbumPreview(
                                artist: 'Kendrick Lamar',
                                imagePath: 'assets/images/albumcover.jpeg',
                                title: 'MR. MORALE',
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 20.h),

                        // Songs section
                        Text(
                          'SONGS',
                          style: TextStyle(
                            fontFamily: "Taile",
                            fontSize: 26.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.h),

                        Center(
                          child: Column(
                            children: List.generate(
                              8,
                              (index) => Padding(
                                padding: EdgeInsets.only(bottom: 8.h),
                                child: const SongDisplay(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Music player floating above all pages
          const Positioned(
            left: 8,
            right: 8,
            bottom: 60,
            child: MusicPlayerBar(),
          ),
        ],
      ),
    );
  }
}
