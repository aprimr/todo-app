import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_info_plus/package_info_plus.dart';

class Version extends StatelessWidget {
  Version({super.key});

  final Future<String> _versionFuture = _getVersion();

  static Future<String> _getVersion() async {
    final info = await PackageInfo.fromPlatform();
    return info.version;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _versionFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox();
        }

        if (snapshot.hasError) {
          return Text(
            "Version error",
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.primary,
              fontFamily: GoogleFonts.rubik().fontFamily,
            ),
          );
        }

        return Text(
          "v ${snapshot.data}",
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).colorScheme.primary,
            fontFamily: GoogleFonts.rubik().fontFamily,
          ),
        );
      },
    );
  }
}
