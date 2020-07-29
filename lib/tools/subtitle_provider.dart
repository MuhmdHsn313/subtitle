abstract class SubtitleProvider {
  final String data;

  const SubtitleProvider(this.data);
}

/// String: use it to provide a string for generate a subtitles.
class StringSubtitle extends SubtitleProvider {
  const StringSubtitle(String data) : super(data);
}

/// Asset: use it [AssetSubtitle] to provide the assets file.
class AssetSubtitle extends SubtitleProvider {
  const AssetSubtitle(String assetPath) : super(assetPath);
}

/// File: use it [FileSubtitle] by provide the file to load subtitles.
class FileSubtitle extends SubtitleProvider {
  const FileSubtitle(String filePath) : super(filePath);
}

/// Network: use [NetworkSubtitle] and give it a url.
class NetworkSubtitle extends SubtitleProvider {
  const NetworkSubtitle(String url) : super(url);
}
