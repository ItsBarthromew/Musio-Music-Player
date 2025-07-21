// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:musio/consts/colors.dart';

class Songs extends StatefulWidget {
  const Songs({super.key});

  @override
  State<Songs> createState() => _SongsState();
}

class _SongsState extends State<Songs> {
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

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _handleAlphabetInteraction(double dy, BoxConstraints constraints) {
    final itemHeight = constraints.maxHeight / alphabet.length;
    final index = (dy / itemHeight).clamp(0, alphabet.length - 1).floor();

    if (index >= 0 &&
        index < alphabet.length &&
        currentLetter != alphabet[index]) {
      setState(() {
        currentLetter = alphabet[index];
        // Here you would implement actual scrolling to the letter section
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: SafeArea(
        child: Row(
          children: [
            // Main content area
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    // Header with logo and buttons
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(
                              LucideIcons.menu,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                          Column(
                            children: [
                              Image.asset(
                                'assets/images/logo.png',
                                width: 61.w,
                                height: 61.h,
                              ),
                              SizedBox(height: 8.h),
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
                                        const Icon(
                                          LucideIcons.arrowDownAZ,
                                          color: Colors.white,
                                          size: 16,
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
                          IconButton(
                            icon: const Icon(
                              LucideIcons.search,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),

                    // Song list
                    ...List.generate(
                      20,
                      (index) => Padding(
                        padding: EdgeInsets.only(bottom: 8.h),
                        child: const SongDisplay(),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Alphabet scrollbar
            Container(
              width: 10.w,
              margin: EdgeInsets.only(right: 8.w),
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onVerticalDragUpdate: (details) {
                  final renderBox = context.findRenderObject() as RenderBox;
                  _handleAlphabetInteraction(
                    details.localPosition.dy,
                    renderBox.constraints,
                  );
                },
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: alphabet.map((letter) {
                          final isSelected = currentLetter == letter;
                          return GestureDetector(
                            onTap: () {
                              setState(() => currentLetter = letter);
                              // Scroll to letter section
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 150),
                              padding: EdgeInsets.symmetric(vertical: 1.h),
                              margin: EdgeInsets.symmetric(vertical: 0.5.h),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? theme.colorScheme.secondary
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                              child: Center(
                                child: Text(
                                  letter,
                                  style: TextStyle(
                                    fontSize: isSelected ? 14.sp : 12.sp,
                                    fontWeight: isSelected
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    color: theme.colorScheme.onSurface,

                                    height: 0.9,
                                    fontFamily: 'Cambria',
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SongDisplay extends StatelessWidget {
  const SongDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        height: 60.h,
        decoration: BoxDecoration(
          color: theme.colorScheme.secondary,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            SizedBox(width: 12.w),
            SizedBox(
              width: 50.w,
              height: 50.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.asset(
                  'assets/images/albumcover.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'COUNT ON ME',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Taile',
                    ),
                  ),
                  Text(
                    'Kendrick Lamar',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 12.sp,
                      fontFamily: 'Cambria',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: Text(
                "03:32",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 12.sp,
                  fontFamily: 'Cambria',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
