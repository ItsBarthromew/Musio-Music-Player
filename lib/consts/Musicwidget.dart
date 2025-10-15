import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musio/screens/musicplaying.dart';
import 'package:stroke_text/stroke_text.dart';

class MusicPlayerBar extends StatelessWidget {
  const MusicPlayerBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Use a custom PageRouteBuilder so we can combine Hero animation with
        // a subtle fade+scale transition. Duration ~600ms for a "slow but
        // snappy" feel.
        Navigator.of(context, rootNavigator: false).push(
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 400),
            reverseTransitionDuration: const Duration(milliseconds: 400),
            pageBuilder: (context, animation, secondaryAnimation) =>
                const Musicplaying(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              // Fade + scale while Hero handles the shared element animation
              final fade = CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut,
              );
              final scale = Tween<double>(begin: 0.98, end: 1.0).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
              );
              return FadeTransition(
                opacity: fade,
                child: ScaleTransition(scale: scale, child: child),
              );
            },
          ),
        );
      },
      child: SizedBox(
        height: 100.h,
        width: 300.w,
        child: Stack(
          children: [
            // Background image wrapped with Hero for smooth transition
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Hero(
                  tag: 'music_hero',
                  flightShuttleBuilder:
                      (
                        flightContext,
                        animation,
                        direction,
                        fromContext,
                        toContext,
                      ) {
                        // Use the default Hero animation but ensure we scale nicely
                        return ScaleTransition(
                          scale: Tween<double>(
                            begin: 1.0,
                            end: 1.0,
                          ).animate(animation),
                          child: fromContext.widget,
                        );
                      },
                  child: Image.asset(
                    'assets/images/albumcover.jpg',
                    fit: BoxFit.cover,
                  ),
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
                            border: Border.all(color: Colors.white, width: 2),
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
    );
  }
}
