import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:musio/screens/mainmanager.dart';
import 'package:musio/consts/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _requestPermissions());
  }

  Future<void> _requestPermissions() async {
    // Determine permissions to request depending on platform and OS version.
    try {
      if (Platform.isAndroid) {
        // Request storage and microphone. On Android 13+ the READ_MEDIA_AUDIO
        // permission replaces READ_EXTERNAL_STORAGE for audio files; permission_handler
        // exposes Permission.audio for that.
        // Request audio and storage permissions (request() is idempotent)
        await Permission.audio.request();
        await Permission.storage.request();

        // For broad file access (Android 11+) the manage external storage
        // permission may be required.
        if (await Permission.manageExternalStorage.isDenied) {
          await Permission.manageExternalStorage.request();
        }
      } else if (Platform.isIOS) {
        // iOS: request media library access and microphone if needed
        await Permission.mediaLibrary.request();
        await Permission.microphone.request();
      }
    } catch (e) {
      // ignore errors, we'll proceed to home with best-effort permissions
    }

    // After requesting, navigate to the main app
    if (!mounted) return;
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => const HomeManager()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 20.h),
            Image.asset('assets/images/logo.png', width: 120.w, height: 120.h),
            Text(
              'Musio',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.sp,
                fontFamily: 'Taile',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12.h),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
