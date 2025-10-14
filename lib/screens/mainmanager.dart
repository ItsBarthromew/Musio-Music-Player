import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:musio/consts/Musicwidget.dart';
import 'package:musio/screens/albums.dart';
import 'package:musio/screens/artists.dart';
import 'package:musio/screens/downloads.dart';
import 'package:musio/screens/home.dart';
import 'package:musio/screens/playlists.dart';
import 'package:musio/screens/songs.dart';

class HomeManager extends StatefulWidget {
  const HomeManager({super.key});

  @override
  State<HomeManager> createState() => _HomeManagerState();
}

class _HomeManagerState extends State<HomeManager> {
  int _selectedIndex = 0;

  late final List<GlobalKey<NavigatorState>> _navigatorKeys = List.generate(
    6,
    (_) => GlobalKey<NavigatorState>(),
  );

  // Remove const from pages since we'll wrap them
  final List<Widget> _pages = [
    Home(),
    Songs(),
    Albums(),
    Artists(),
    Playlists(),
    Downloads(),
  ];

  void _onItemTapped(int index) {
    if (_selectedIndex == index) {
      _navigatorKeys[index].currentState?.popUntil((route) => route.isFirst);
    } else {
      setState(() => _selectedIndex = index);
    }
  }

  // Create a method to wrap each page with the header
  Widget _buildPageWithHeader(Widget page, int index) {
    return Column(
      children: [
        // Combined Header Section
        _buildHeaderSection(index),

        SizedBox(height: 16.h), // Spacing between header and content
        // Page Content
        Expanded(child: page),
      ],
    );
  }

  // Header section with menu, logo, search and banner
  Widget _buildHeaderSection(int index) {
    return Column(
      children: [
        // Banner Ad
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            border: Border.all(
              color: Theme.of(context).colorScheme.onPrimary,
              width: 0.5,
            ),
          ),
          width: double.infinity,
          height: 50.h,
          child: Center(
            child: Text(
              "BANNER AD",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontFamily: "Cambria",
              ),
            ),
          ),
        ),

        // Top Row with Menu, Logo, Search
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: IconImage(
                'assets/images/icons/menu.png',
                width: 30.w,
                height: 30.h,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: IconImage(
                'assets/images/icons/search.png',
                width: 30.w,
                height: 30.h,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTabNavigator(int index) {
    return Navigator(
      key: _navigatorKeys[index],
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => _buildPageWithHeader(_pages[index], index),
        );
      },
    );
  }

  Future<bool> _onWillPop() async {
    final currentNavigator = _navigatorKeys[_selectedIndex].currentState;

    if (currentNavigator != null && currentNavigator.canPop()) {
      currentNavigator.pop();
      return false;
    }

    if (_selectedIndex != 0) {
      setState(() => _selectedIndex = 0);
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).colorScheme.primary,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.primary,
          body: SafeArea(
            child: Stack(
              children: [
                // Main content area
                IndexedStack(
                  index: _selectedIndex,
                  children: List.generate(
                    _pages.length,
                    (index) => _buildTabNavigator(index),
                  ),
                ),

                // Music player at the bottom
                const Positioned(
                  left: 8,
                  right: 8,
                  bottom: 1,
                  child: MusicPlayerBar(),
                ),
              ],
            ),
          ),
          bottomNavigationBar: _buildBottomNavigationBar(),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        border: Border(
          top: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 0.5,
          ),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedLabelStyle: TextStyle(
          fontFamily: "Cambria",
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: "Cambria",
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        onTap: _onItemTapped,
        selectedItemColor: Colors.white,
        unselectedItemColor: Theme.of(
          context,
        ).colorScheme.secondary.withOpacity(0.7),
        backgroundColor: Colors.transparent,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: [
          BottomNavigationBarItem(
            icon: _buildImageIcon('assets/images/icons/home.png'),
            activeIcon: _buildImageIcon(
              'assets/images/icons/home.png',
              isActive: true,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _buildImageIcon('assets/images/icons/songs.png'),
            activeIcon: _buildImageIcon(
              'assets/images/icons/songs.png',
              isActive: true,
            ),
            label: 'Songs',
          ),
          BottomNavigationBarItem(
            icon: _buildImageIcon('assets/images/icons/albums.png'),
            activeIcon: _buildImageIcon(
              'assets/images/icons/albums.png',
              isActive: true,
            ),
            label: 'Albums',
          ),
          BottomNavigationBarItem(
            icon: _buildImageIcon('assets/images/icons/artists.png'),
            activeIcon: _buildImageIcon(
              'assets/images/icons/artists.png',
              isActive: true,
            ),
            label: 'Artists',
          ),
          BottomNavigationBarItem(
            icon: _buildImageIcon('assets/images/icons/playlists.png'),
            activeIcon: _buildImageIcon(
              'assets/images/icons/playlists.png',
              isActive: true,
            ),
            label: 'Playlists',
          ),
          BottomNavigationBarItem(
            icon: _buildImageIcon('assets/images/icons/downloads.png'),
            activeIcon: _buildImageIcon(
              'assets/images/icons/downloads.png',
              isActive: true,
            ),
            label: 'Downloads',
          ),
        ],
      ),
    );
  }

  Widget _buildImageIcon(String assetPath, {bool isActive = false}) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Image.asset(
        assetPath,
        width: 24,
        height: 24,
        color: isActive
            ? Colors.white
            : Theme.of(context).colorScheme.secondary.withOpacity(0.7),
        errorBuilder: (context, error, stackTrace) {
          // Fallback to a simple icon if image fails to load
          return Icon(
            Icons.error_outline,
            size: 24,
            color: isActive
                ? Colors.white
                : Theme.of(context).colorScheme.secondary.withOpacity(0.7),
          );
        },
      ),
    );
  }
}
