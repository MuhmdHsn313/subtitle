import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../errors/failure.dart';
import '../entities/subtitle_list.dart';

abstract class SubtitleRepository {
  Future<Either<SubtitleFailure, SubtitleList>> fetchFromNetwork(String url);

  Future<Either<SubtitleFailure, SubtitleList>> fetchFromFile(String filePath);

  Future<Either<SubtitleFailure, SubtitleList>> fetchFromAssets(String assetPath);

  Future<Either<SubtitleFailure, SubtitleList>> fetchFromString(String data);
}
