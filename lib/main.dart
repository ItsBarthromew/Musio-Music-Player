import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musio/consts/colors.dart';
import 'package:musio/screens/mainmanager.dart';
import 'package:on_audio_query/on_audio_query.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const PermissionPage(),
        theme: theme,
      ),
    );
  }
}

class PermissionPage extends StatefulWidget {
  const PermissionPage({super.key});

  @override
  State<PermissionPage> createState() => _PermissionPageState();
}

class _PermissionPageState extends State<PermissionPage> {
  final OnAudioQuery _audioQuery = OnAudioQuery();

  @override
  void initState() {
    super.initState();
    requestPermission();
  }

  Future<void> requestPermission() async {
    bool permissionStatus = await _audioQuery.permissionsStatus();
    if (!permissionStatus) {
      bool granted = await _audioQuery.permissionsRequest();
      if (granted) {
        // Permission granted, move to main app
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeManager()),
        );
      } else {
        // Permission denied, show message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Permission denied. Cannot continue.")),
        );
      }
    } else {
      // Already granted
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeManager()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: Center(
        child: Text(
          "Requesting Permission...",
          style: TextStyle(color: Colors.white, fontSize: 20.sp),
        ),
      ),
    );
  }
}
