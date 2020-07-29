import 'package:dartz/dartz.dart';
import 'package:subtitle/domain/repositories/subtitle_repository.dart';

import '../../errors/failure.dart';
import '../../tools/subtitle_provider.dart';
import '../entities/subtitle_list.dart';

class GetSubtitles {
  final SubtitleRepository repository;

  const GetSubtitles(this.repository);

  Future<Either<SubtitleFailure, SubtitleList>> call(
      SubtitleProvider provider) {
    if (provider is StringSubtitle)
      return repository.fetchFromString(provider.data);
    else if (provider is AssetSubtitle)
      return repository.fetchFromAssets(provider.data);
    else if (provider is FileSubtitle)
      return repository.fetchFromFile(provider.data);
    else
      return repository.fetchFromNetwork(provider.data);
  }
}
