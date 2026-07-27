class Durationformater {
  Durationformater._();

  static String formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');

    if (hours > 0) {
      return '$hours:$minutes:$seconds';
    }

    return '$minutes:$seconds';
  }
  static String getDurationText(Duration duration){
    final hours = duration.inHours;
    final minutes = duration.inMinutes;
    return '${hours}h:${minutes.remainder(60)}m';
  }
}
