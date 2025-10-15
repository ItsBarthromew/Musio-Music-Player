// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musio/consts/colors.dart';
import 'package:musio/consts/songview.dart';

class Songs extends StatefulWidget {
  const Songs({super.key});

  @override
  State<Songs> createState() => _SongsState();
}

class _SongsState extends State<Songs> {
  // Sample song data - replace with your actual data
  final List<Map<String, dynamic>> _songs = [
    {'title': 'Anti-Hero', 'artist': 'Taylor Swift', 'letter': 'A'},
    {'title': 'Blinding Lights', 'artist': 'The Weeknd', 'letter': 'B'},
    {'title': 'Cruel Summer', 'artist': 'Taylor Swift', 'letter': 'C'},
    {'title': 'Dance Monkey', 'artist': 'Tones and I', 'letter': 'D'},
    {'title': 'Enchanted', 'artist': 'Taylor Swift', 'letter': 'E'},
    {'title': 'Flowers', 'artist': 'Miley Cyrus', 'letter': 'F'},
    {'title': 'God\'s Plan', 'artist': 'Drake', 'letter': 'G'},
    {'title': 'Heat Waves', 'artist': 'Glass Animals', 'letter': 'H'},
    {'title': 'Industry Baby', 'artist': 'Lil Nas X', 'letter': 'I'},
    {'title': 'Just the Way You Are', 'artist': 'Bruno Mars', 'letter': 'J'},
    {'title': 'Kill Bill', 'artist': 'SZA', 'letter': 'K'},
    {'title': 'Levitating', 'artist': 'Dua Lipa', 'letter': 'L'},
    {'title': 'Midnight Rain', 'artist': 'Taylor Swift', 'letter': 'M'},
    {'title': 'No Role Modelz', 'artist': 'J. Cole', 'letter': 'N'},
    {'title': 'One Dance', 'artist': 'Drake', 'letter': 'O'},
    {'title': 'Paint The Town Red', 'artist': 'Doja Cat', 'letter': 'P'},
    {'title': 'Queencard', 'artist': '(G)I-DLE', 'letter': 'Q'},
    {'title': 'Running Up That Hill', 'artist': 'Kate Bush', 'letter': 'R'},
    {'title': 'Stay', 'artist': 'The Kid LAROI', 'letter': 'S'},
    {'title': 'Titanium', 'artist': 'David Guetta', 'letter': 'T'},
    {'title': 'Unholy', 'artist': 'Sam Smith', 'letter': 'U'},
    {'title': 'Vampire', 'artist': 'Olivia Rodrigo', 'letter': 'V'},
    {'title': 'Watermelon Sugar', 'artist': 'Harry Styles', 'letter': 'W'},
    {'title': 'X', 'artist': 'Nicky Jam', 'letter': 'X'},
    {'title': 'Yellow', 'artist': 'Coldplay', 'letter': 'Y'},
    {'title': 'Zombie', 'artist': 'The Cranberries', 'letter': 'Z'},
  ];

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
    '#',
  ];

  String currentLetter = 'A';
  final ScrollController _scrollController = ScrollController();
  final Map<String, GlobalKey> _sectionKeys = {};

  @override
  void initState() {
    super.initState();
    // Create keys for each alphabet section
    for (final letter in alphabet) {
      _sectionKeys[letter] = GlobalKey();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // Reusable song widget function
  Widget _buildSongItem(Map<String, dynamic> song, int index) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: GestureDetector(
        onTap: () {
          // Handle song tap
          print('Tapped: ${song['title']}');
        },
        onLongPress: () {
          // Handle long press for options
          _showSongOptions(song);
        },
        child: SongDisplay(
          imagePath: song['cover'] ?? song['image'] ?? '',
          title: song['title'] ?? '',
          artist: song['artist'] ?? '',
          length: song['length'] ?? '',
        ),
      ),
    );
  }

  void _showSongOptions(Map<String, dynamic> song) {
    // Show a centered dialog with options instead of a bottom sheet.
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: theme.colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                song['title'],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cambria',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 6.h),
              Text(
                song['artist'],
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14.sp,
                  fontFamily: 'Cambria',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.h),
              _buildDialogOption('Add to Playlist', Icons.playlist_add, () {
                Navigator.pop(context);
                // Add to playlist logic
              }),
              SizedBox(height: 8.h),
              _buildDialogOption('Add to Queue', Icons.queue_music, () {
                Navigator.pop(context);
                // Add to queue logic
              }),
              SizedBox(height: 8.h),
              _buildDialogOption('Share', Icons.share, () {
                Navigator.pop(context);
                // Share logic
              }),
              SizedBox(height: 8.h),
              _buildDialogOption('View Album', Icons.album, () {
                Navigator.pop(context);
                // View album logic
              }),
            ],
          ),
        );
      },
    );
  }

  /// Helper used by the centered dialog to create full-width option buttons.
  Widget _buildDialogOption(String text, IconData icon, VoidCallback onTap) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: Icon(icon, size: 18.sp, color: Colors.white),
        label: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontFamily: 'Cambria',
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.secondary,
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        onPressed: onTap,
      ),
    );
  }

  void _handleAlphabetInteraction(double dy, double totalHeight) {
    final itemHeight = totalHeight / alphabet.length;
    final index = (dy / itemHeight).clamp(0, alphabet.length - 1).floor();

    if (index >= 0 && index < alphabet.length) {
      final selectedLetter = alphabet[index];
      if (currentLetter != selectedLetter) {
        setState(() {
          currentLetter = selectedLetter;
        });
        _scrollToSection(selectedLetter);
      }
    }
  }

  void _scrollToSection(String letter) {
    // Scroll to the first song that starts with [letter]. Build an index map
    // from letters to list indices and scroll to that position if present.
    final map = _buildLetterIndexMap();
    if (map.containsKey(letter)) {
      final targetIndex = map[letter]!;
      // Estimate offset using item height. SongDisplay height is ~60.h + padding
      final itemHeight = 60.h + 8.h; // matches _buildSongItem padding
      final offset = targetIndex * itemHeight;
      _scrollController.animateTo(
        offset,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  /// Build a map from alphabet letter to the first index in _songs that
  /// starts with that letter. '#' maps to non A-Z starters.
  Map<String, int> _buildLetterIndexMap() {
    final map = <String, int>{};
    for (var i = 0; i < _songs.length; i++) {
      final title = (_songs[i]['title'] as String).trim();
      if (title.isEmpty) continue;
      final first = title[0].toUpperCase();
      final key = RegExp(r'[A-Z]').hasMatch(first) ? first : '#';
      if (!map.containsKey(key)) map[key] = i;
    }
    return map;
  }

  List<Map<String, dynamic>> _getSongsForLetter(String letter) {
    if (letter == '#') {
      // Return songs that don't start with A-Z (numbers, symbols, etc.)
      return _songs.where((song) {
        final firstChar = song['title'][0].toUpperCase();
        return !alphabet.contains(firstChar);
      }).toList();
    }
    return _songs.where((song) => song['letter'] == letter).toList();
  }

  bool _hasSongsForLetter(String letter) {
    return _getSongsForLetter(letter).isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: SafeArea(
        child: Column(
          children: [
            // Header section
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10.h, bottom: 6.h),
                      width: 30.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.secondary,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: ImageIcon(
                          AssetImage('assets/images/icons/shuffle.png'),
                          size: 18.sp,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          // Liked songs logic
                        },
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Container(
                      margin: EdgeInsets.only(top: 10.h, bottom: 6.h),
                      height: 30.h,
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
                          Image.asset(
                            'assets/images/icons/music-filter.png',
                            width: 16.w,
                            height: 16.w,
                            color: Colors.white,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            'A-Z',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.white,
                              fontFamily: 'Cambria',
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.w),

                    Container(
                      margin: EdgeInsets.only(top: 10.h, bottom: 6.h),
                      width: 30.w,
                      height: 30.w,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.secondary,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: ImageIcon(
                          AssetImage('assets/images/icons/play.png'),
                          size: 18.sp,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          // Liked songs logic
                        },
                      ),
                    ),
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
                      child: Center(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 420.w),
                          child: Column(
                            children: [
                              // Render songs sequentially (song 1,2,3...)
                              for (var i = 0; i < _songs.length; i++)
                                _buildSongItem(_songs[i], i),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Alphabet scrollbar
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return Container(
                        width: 24.w,
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
                          onTapDown: (details) {
                            final itemHeight =
                                constraints.maxHeight / alphabet.length;
                            final index =
                                (details.localPosition.dy / itemHeight)
                                    .clamp(0, alphabet.length - 1)
                                    .floor();
                            final selectedLetter = alphabet[index];
                            setState(() => currentLetter = selectedLetter);
                            _scrollToSection(selectedLetter);
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
                                final hasSongs = _hasSongsForLetter(letter);
                                return GestureDetector(
                                  onTap: hasSongs
                                      ? () {
                                          setState(
                                            () => currentLetter = letter,
                                          );
                                          _scrollToSection(letter);
                                        }
                                      : null,
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
                                          color: hasSongs
                                              ? theme.colorScheme.onSurface
                                              : theme.colorScheme.onSurface
                                                    .withOpacity(0.3),
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
