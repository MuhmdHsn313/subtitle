import 'package:dartz/dartz.dart';

import '../../domain/entities/subtitle_list.dart';
import '../../domain/repositories/subtitle_repository.dart';
import '../../errors/exception.dart';
import '../../errors/failure.dart';
import '../../tools/subtitle_parser.dart';
import '../datasources/subtitle_local_data_source.dart';
import '../datasources/subtitle_remote_data_source.dart';

class SubtitleRepositoryImpl extends SubtitleRepository {
  final SubtitleLocalDataSource localDataSource;
  final SubtitleRemoteDataSource remoteDataSource;

  SubtitleRepositoryImpl(this.localDataSource, this.remoteDataSource);

  @override
  Future<Either<SubtitleFailure, SubtitleList>> fetchFromAssets(
      String assetPath) async {
    try {
      final data = await localDataSource.fetchFromAsset(assetPath);
      return Right(data);
    } catch (_) {
      return Left(SubtitleUnknownFailure());
    }
  }

  @override
  Future<Either<SubtitleFailure, SubtitleList>> fetchFromFile(
      String filePath) async {
    try {
      final data = await localDataSource.fetchFromFile(filePath);
      return Right(data);
    } catch (_) {
      return Left(SubtitleUnknownFailure());
    }
  }

  @override
  Future<Either<SubtitleFailure, SubtitleList>> fetchFromNetwork(
      String url) async {
    try {
      final data = await remoteDataSource.fetchSubtitle(url);
      return Right(data);
    } on SubtitleServerException {
      return Left(SubtitleServerFailure());
    } catch (_) {
      return Left(SubtitleUnknownFailure());
    }
  }

  @override
  Future<Either<SubtitleFailure, SubtitleList>> fetchFromString(
      String data) async {
    return Right(SubtitleParser().call(data));
  }
}
