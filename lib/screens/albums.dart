import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:musio/consts/colors.dart';
import 'package:musio/consts/songview.dart';
import 'package:musio/screens/home.dart';

class Albums extends StatefulWidget {
  const Albums({super.key});

  @override
  State<Albums> createState() => _AlbumsState();
}

class _AlbumsState extends State<Albums> {
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

  final List<String> alphabet = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z',
  ];

  String currentLetter = 'A';
  final ScrollController _scrollController = ScrollController();

  final List<Map<String, String>> demoAlbums = List.generate(20, (index) {
    return {
      'title': 'ALBUM ${index + 1}',
      'artist': 'Artist ${index + 1}',
      'image': 'assets/images/albumcover.jpeg',
    };
  });

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _handleAlphabetInteraction(double dy, double totalHeight) {
    final itemHeight = totalHeight / alphabet.length;
    final index = (dy / itemHeight).clamp(0, alphabet.length - 1).floor();

    if (index >= 0 &&
        index < alphabet.length &&
        currentLetter != alphabet[index]) {
      setState(() {
        currentLetter = alphabet[index];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: SafeArea(
        child: Column(
          children: [
            // Control Buttons
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
            SizedBox(height: 10.h),

            // Albums Grid and Alphabet Scroller
            Expanded(
              child: Stack(
                children: [
                  // Albums Grid View
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.w),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 4.w,
                        mainAxisSpacing: 1.h,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: demoAlbums.length,
                      itemBuilder: (context, index) {
                        final album = demoAlbums[index];
                        return AlbumPreview(
                          title: album['title']!,
                          artist: album['artist']!,
                          imagePath: album['image']!,
                        );
                      },
                    ),
                  ),

                  // Alphabet scroll indicator (still functional but doesn't affect display)
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onVerticalDragUpdate: (details) {
                        final box = context.findRenderObject() as RenderBox;
                        final localOffset = box.globalToLocal(
                          details.globalPosition,
                        );
                        _handleAlphabetInteraction(
                          localOffset.dy,
                          box.size.height,
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 8.w),
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: alphabet.map((letter) {
                            return Text(
                              letter,
                              style: TextStyle(
                                color: currentLetter == letter
                                    ? theme.colorScheme.secondary
                                    : Colors.white,
                                fontSize: 12.sp,
                                fontWeight: currentLetter == letter
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }
}
