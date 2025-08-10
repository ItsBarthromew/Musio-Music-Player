import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:musio/consts/Musicwidget.dart';
import 'package:musio/screens/albums.dart';
import 'package:musio/screens/artists.dart';
import 'package:musio/screens/downloads.dart';
import 'package:musio/screens/home.dart';
import 'package:musio/screens/playlists.dart';
import 'package:musio/screens/songs.dart'; // add more if needed

class HomeManager extends StatefulWidget {
  const HomeManager({super.key});

  @override
  State<HomeManager> createState() => _HomeManagerState();
}

class _HomeManagerState extends State<HomeManager> {
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
        statusBarColor: Theme.of(context).colorScheme.primary, // Match your bg
        statusBarIconBrightness: Brightness.light, // Light icons for dark bg
        statusBarBrightness: Brightness.dark, // For iOS
      ),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Stack(
          children: [
            // Main page switcher
            IndexedStack(index: _selectedIndex, children: _pages),

            // Music player floating above all pages
            const Positioned(
              left: 8,
              right: 8,
              bottom: 4,
              child: MusicPlayerBar(),
            ),
          ],
        ),

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
      ),
    );
  }
}
