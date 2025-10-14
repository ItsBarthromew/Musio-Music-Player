import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musio/screens/musicplaying.dart';
import 'package:stroke_text/stroke_text.dart';

class MusicPlayerBar extends StatelessWidget {
  const MusicPlayerBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // In your MusicPlayerBar's onTap:
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const Musicplaying(),
            transitionDuration: const Duration(
              milliseconds: 600,
            ), // Slowed down to 1 second
            reverseTransitionDuration: const Duration(milliseconds: 600),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  final curvedAnimation = CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeInOut,
                  );
                  return FadeTransition(opacity: curvedAnimation, child: child);
                },
          ),
        );
      },
      child: Hero(
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
        child: Material(
          color: Colors.transparent,
          child: SizedBox(
            height: 100.h,
            width: 300.w,
            child: Stack(
              children: [
                // Your existing stack content
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                      'assets/images/albumcover.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Progress indicator with white border
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double progress = 0.4; // Example: 20% song progress
                        return Row(
                          children: [
                            Container(
                              width: constraints.maxWidth * progress,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),

                // All text content
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Time at the top (centered)
                        StrokeText(
                          text: "00:01:30/00:03:24",
                          textStyle: TextStyle(
                            fontSize: 8.sp,
                            fontFamily: 'Cambria',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                          strokeColor: Colors.black,
                          strokeWidth: 2,
                        ),

                        Spacer(),

                        // Song name (centered)
                        StrokeText(
                          text: "SONG NAME",
                          textStyle: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: 'Cambria',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                          strokeColor: Colors.black,
                          strokeWidth: 2,
                        ),

                        // Artist (centered)
                        StrokeText(
                          text: "Artist Name",
                          textStyle: TextStyle(
                            fontSize: 10.sp,
                            fontFamily: 'Cambria',
                            height: 0.01,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                          strokeColor: Colors.black,
                          strokeWidth: 2,
                        ),

                        Spacer(),

                        // Album name at the bottom (centered)
                        StrokeText(
                          text: "Album Name",
                          textStyle: TextStyle(
                            fontSize: 8.sp,
                            fontFamily: 'Cambria',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                          strokeColor: Colors.black,
                          strokeWidth: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
