import 'package:http/http.dart';
import 'package:subtitle/errors/exception.dart';
import 'package:subtitle/tools/subtitle_parser.dart';

import '../../domain/entities/subtitle_list.dart';

abstract class SubtitleRemoteDataSource {
  Future<SubtitleList> fetchSubtitle(String url);
}

class SubtitleRemoteDataSourceImpl extends SubtitleRemoteDataSource {
  final SubtitleParser parser;

  SubtitleRemoteDataSourceImpl(this.parser);

  @override
  Future<SubtitleList> fetchSubtitle(String url) async {
    final response = await get(url);

    if (response.statusCode != 200) throw SubtitleServerException();

    return parser(response.body);
  }
}
