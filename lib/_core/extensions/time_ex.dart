import 'package:timeago/timeago.dart' as timeago;
import 'package:tumi_nol/main.export.dart';

extension DateTimeEx on DateTime {
  String formatDate([String pattern = 'dd-MM-yyyy']) {
    return DateFormat(pattern).format(this);
  }

  String formatFull([String pattern = 'dd-MM-yyyy hh:mm:ss a']) {
    return DateFormat(pattern).format(this);
  }

  DateTime get justDate => DateTime(year, month, day);

  String timeAgo() => timeago.format(this);
}

extension DurationEx on Duration {
  String format() {
    final hours = inHours;
    final minutes = inMinutes.remainder(60);
    final seconds = inSeconds.remainder(60);

    if (hours > 0) {
      return '${hours.twoDigits()}:${minutes.twoDigits()}:${seconds.twoDigits()}';
    } else {
      return '${minutes.twoDigits()}:${seconds.twoDigits()}';
    }
  }

  double progressOf(Duration? total) {
    if (total == null) return 0.0;
    if (total.inMilliseconds == 0) return 0.0;
    return inMilliseconds.clamp(0, total.inMilliseconds) / total.inMilliseconds;
  }

  Duration remaining(Duration total) {
    return (total - this);
  }
}
