abstract class SubtitleFailure{}

/// This failure returnd when catch [SubtitleServerException]. 
class SubtitleServerFailure extends SubtitleFailure {}

/// This failure returnd when catch [SubtitleNetworkException].
class SubtitleNetworkFailure extends SubtitleFailure {}

/// This failure returnd for other exceptions.
class SubtitleUnknownFailure extends SubtitleFailure {}