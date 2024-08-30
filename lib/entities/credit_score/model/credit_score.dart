import 'package:equatable/equatable.dart';

class CreditScore implements Equatable {
  const CreditScore({
    required this.changeSinceLast,
    required this.lastUpdate,
    required this.nextUpdate,
    required this.quality,
    required this.score,
  });

  final int changeSinceLast;
  final DateTime lastUpdate;
  final DateTime nextUpdate;
  final String quality;
  final int score;

  @override
  List<Object?> get props => [
        changeSinceLast,
        lastUpdate,
        nextUpdate,
        quality,
        score,
      ];

  @override
  bool get stringify => true;
}
