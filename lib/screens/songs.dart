// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:musio/consts/colors.dart';
import 'package:musio/consts/songview.dart';

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
            // Header with logo and controls
            Column(
              children: [
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
            Expanded(
              child: Row(
                children: [
                  // Main content area
                  Expanded(
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Column(
                        children: [
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
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return Container(
                        width: 20.w,
                        margin: EdgeInsets.only(right: 8.w),
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onVerticalDragUpdate: (details) {
                            final renderBox =
                                context.findRenderObject() as RenderBox;
                            final localPosition = renderBox.globalToLocal(
                              details.globalPosition,
                            );
                            _handleAlphabetInteraction(
                              localPosition.dy,
                              constraints.maxHeight,
                            );
                          },
                          child: AnimatedContainer(
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
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 150),
                                    padding: EdgeInsets.symmetric(
                                      vertical: 1.h,
                                    ),
                                    margin: EdgeInsets.symmetric(
                                      vertical: 0.5.h,
                                    ),
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
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
