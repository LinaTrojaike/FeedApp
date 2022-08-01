import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'FeedApp',
        style: GoogleFonts.lobster(fontSize: 28, color: Colors.white70),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
