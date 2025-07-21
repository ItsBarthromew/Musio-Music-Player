import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:musio/screens/albums.dart';
import 'package:musio/screens/artists.dart';
import 'package:musio/screens/downloads.dart';
import 'package:musio/screens/home.dart';
import 'package:musio/screens/playlists.dart';
import 'package:musio/screens/songs.dart';

class BottomNavigationBarPlug extends StatefulWidget {
  const BottomNavigationBarPlug({super.key});

  @override
  State<BottomNavigationBarPlug> createState() =>
      _BottomNavigationBarPlugState();
}

class _BottomNavigationBarPlugState extends State<BottomNavigationBarPlug> {
  int? _myIndex;

  List<Widget> widgetList = [
    const Home(),
    const Downloads(),
    const Albums(),
    const Artists(),
    const Playlists(),
    const Songs(),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 1,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(LucideIcons.discAlbum),
          label: 'Albums',
        ),
        BottomNavigationBarItem(icon: Icon(LucideIcons.music2), label: 'Songs'),
        BottomNavigationBarItem(icon: Icon(LucideIcons.house), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(LucideIcons.listMusic),
          label: 'Playlists',
        ),
        BottomNavigationBarItem(
          icon: Icon(LucideIcons.users),
          label: 'Artists',
        ),
        BottomNavigationBarItem(
          icon: Icon(LucideIcons.download),
          label: 'Downloads',
        ),
      ],
      selectedLabelStyle: const TextStyle(
        fontFamily: 'show',
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      unselectedLabelStyle: const TextStyle(
        fontFamily: 'show',
        fontWeight: FontWeight.normal,
        fontSize: 12,
      ),
      currentIndex: _myIndex ?? 0,
      iconSize: 32,
      selectedItemColor: Theme.of(context).colorScheme.onSurface,
      unselectedItemColor: Theme.of(context).colorScheme.secondary,
      backgroundColor: Theme.of(context).colorScheme.primary,
      onTap: (index) {
        setState(() {
          _myIndex = index;
        });
      },
    );
  }
}
