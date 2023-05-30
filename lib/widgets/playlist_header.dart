import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';
import 'package:google_fonts/google_fonts.dart';

class PlaylistHeader extends StatelessWidget {
  final Playlist playlist;
  const PlaylistHeader({required this.playlist, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              playlist.imageURL,
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PLAYLIST',
                    style: GoogleFonts.montserrat(
                        fontSize: 20,
                        // fontWeight: FontWeight.bold,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    playlist.name,
                    style: GoogleFonts.montserrat(
                        fontSize: 20,
                        // fontWeight: FontWeight.bold,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    playlist.description,
                    style: GoogleFonts.montserrat(
                        fontSize: 20,
                        // fontWeight: FontWeight.bold,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Created by ${playlist.creator} *  ${playlist.songs.length} Songs, ${playlist.duration}',
                    style: GoogleFonts.montserrat(
                        fontSize: 20,
                        // fontWeight: FontWeight.bold,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        _PlaylistButtons(followers: playlist.followers),
      ],
    );
  }
}

class _PlaylistButtons extends StatelessWidget {
  final String followers;
  const _PlaylistButtons({required this.followers, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () {},
          child: Text('PLAY'),
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 38),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: Colors.green,
            primary: Colors.white,
            textStyle: GoogleFonts.montserrat(
              fontSize: 20,
              // fontWeight: FontWeight.bold,
              fontWeight: FontWeight.w400,
              color: Colors.white,
              letterSpacing: 2,
            ),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.favorite_border,
            color: Colors.white,
          ),
          iconSize: 30,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_horiz,
            color: Colors.white,
          ),
          iconSize: 30,
        ),
        Spacer(),
        Text(
          'Followers\n$followers',
          style: GoogleFonts.montserrat(
              fontSize: 12,
              // fontWeight: FontWeight.bold,
              fontWeight: FontWeight.w400,
              color: Colors.white),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}
