import 'package:equatable/equatable.dart';

import 'subtitle.dart';

class SubtitleList extends Equatable {
  final List<Subtitle> subtitles;

  const SubtitleList(this.subtitles);

  @override
  List<Object> get props => subtitles;
}
