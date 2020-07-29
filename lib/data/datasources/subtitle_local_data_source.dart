import 'dart:io';

import 'package:flutter/services.dart';

import '../../domain/entities/subtitle_list.dart';
import '../../tools/subtitle_parser.dart';

abstract class SubtitleLocalDataSource {
  Future<SubtitleList> fetchFromFile(String filePath);
  Future<SubtitleList> fetchFromAsset(String assetPath);
}

class SubtitleLocalDataSourceImpl implements SubtitleLocalDataSource {
  final SubtitleParser parser;

  SubtitleLocalDataSourceImpl(this.parser);

  @override
  Future<SubtitleList> fetchFromAsset(String assetPath) async {
    final data = await rootBundle.loadString(assetPath);

    return parser(data);
  }

  @override
  Future<SubtitleList> fetchFromFile(String filePath) async {
    final data = File(filePath).readAsStringSync();
    return parser(data);
  }
}
