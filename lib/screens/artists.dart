import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:musio/consts/colors.dart';
import 'package:musio/consts/songview.dart';

class Artists extends StatefulWidget {
  const Artists({super.key});

  @override
  State<Artists> createState() => _ArtistsState();
}

class _ArtistsState extends State<Artists> {
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

  // Demo artist data
  final List<Map<String, String>> demoArtists = List.generate(20, (index) {
    return {
      'name': 'Artist ${index + 1}',
      'image': 'assets/images/artistcover.jpeg',
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

            // Artists Grid and Alphabet Scroller
            Expanded(
              child: Stack(
                children: [
                  // Artists Grid View
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 1.w,
                        mainAxisSpacing: 18.h,
                        childAspectRatio: 0.9,
                      ),
                      itemCount: demoArtists.length,
                      itemBuilder: (context, index) {
                        return ArtistPreview(
                          name: demoArtists[index]['name']!,
                          imagePath: demoArtists[index]['image']!,
                        );
                      },
                    ),
                  ),

                  // Alphabet scroll indicator
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
            SizedBox(height: 120.h),
          ],
        ),
      ),
    );
  }
}
