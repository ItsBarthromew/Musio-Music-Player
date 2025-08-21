import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  // Current selected tab index
  int _selectedIndex = 0;

  // Each tab has its own Navigator state for deep navigation
  final List<GlobalKey<NavigatorState>> _navigatorKeys = List.generate(
    6, // Number of tabs
    (_) => GlobalKey<NavigatorState>(),
  );

  // Root page for each tab
  final List<Widget> _pages = [
    const Home(), // Tab 0
    const Songs(), // Tab 1
    const Albums(), // Tab 2
    const Artists(), // Tab 3
    const Playlists(), // Tab 4
    const Downloads(), // Tab 5
  ];

  // Handle tab switching
  void _onItemTapped(int index) {
    if (_selectedIndex == index) {
      // If the user taps the current tab again, pop to root
      _navigatorKeys[index].currentState?.popUntil((route) => route.isFirst);
    } else {
      setState(() => _selectedIndex = index);
    }
  }

  // Wrap each page in its own Navigator
  Widget _buildTabNavigator(int index) {
    return Navigator(
      key: _navigatorKeys[index],
      onGenerateRoute: (settings) {
        // Root of the tab
        return MaterialPageRoute(builder: (context) => _pages[index]);
      },
    );
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
        onWillPop: () async {
          // Handle back button: first try to pop in current tab
          final isFirstRouteInCurrentTab = !await _navigatorKeys[_selectedIndex]
              .currentState!
              .maybePop();

          if (isFirstRouteInCurrentTab) {
            if (_selectedIndex != 0) {
              // If not on Home tab, switch to Home tab
              setState(() => _selectedIndex = 0);
              return false;
            }
          }
          return isFirstRouteInCurrentTab;
        },
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.primary,

          // Main content: tabs + music player
          body: Stack(
            children: [
              // IndexedStack preserves state of each tab
              IndexedStack(
                index: _selectedIndex,
                children: List.generate(
                  _pages.length,
                  (index) => _buildTabNavigator(index),
                ),
              ),

              // Music player always visible
              const Positioned(
                left: 8,
                right: 8,
                bottom: 4,
                child: MusicPlayerBar(),
              ),
            ],
          ),

          // Bottom navigation bar
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
        ),
      ),
    );
  }
}
