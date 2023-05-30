import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';
import 'package:flutter_spotify_ui/models/current_track_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TrackList extends StatelessWidget {
  final List<Song> tracks;
  const TrackList({required this.tracks, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      headingTextStyle: GoogleFonts.montserrat(
          fontSize: 20,
          // fontWeight: FontWeight.bold,
          fontWeight: FontWeight.w200,
          color: Colors.white),
      dataRowHeight: 54,
      showCheckboxColumn: false,
      columns: [
        DataColumn(
          label: Text(
            'TITLE',
            style: GoogleFonts.montserrat(
                // fontSize: 20,
                // fontWeight: FontWeight.bold,
                fontWeight: FontWeight.w200,
                color: Colors.white),
          ),
        ),
        DataColumn(
          label: Text(
            'ARTIST',
            style: GoogleFonts.montserrat(
                // fontSize: 20,
                // fontWeight: FontWeight.bold,
                fontWeight: FontWeight.w200,
                color: Colors.white),
          ),
        ),
        DataColumn(
          label: Text(
            'ALBUM',
            style: GoogleFonts.montserrat(
                // fontWeight: FontWeight.bold,
                fontWeight: FontWeight.w200,
                color: Colors.white),
          ),
        ),
        DataColumn(
          label: Icon(
            Icons.access_time,
            color: Colors.white,
          ),
        ),
      ],
      rows: tracks.map(
        (e) {
          final selected =
              context.watch<CurrentTrackModel>().selected?.id == e.id;
          final textStyle =
              TextStyle(color: selected ? Colors.green : Colors.white);
          return DataRow(
            cells: [
              DataCell(
                Text(
                  e.title,
                  style: textStyle,
                ),
              ),
              DataCell(
                Text(
                  e.artist,
                  style: textStyle,
                ),
              ),
              DataCell(
                Text(
                  e.album,
                  style: textStyle,
                ),
              ),
              DataCell(
                Text(
                  e.duration,
                  style: textStyle,
                ),
              ),
            ],
            selected: selected,
            onSelectChanged: (_) =>
                context.read<CurrentTrackModel>().selectTrack(e),
          );
        },
      ).toList(),
    );
  }
}
