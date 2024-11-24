part of '../../../core/cores.dart';

class RecentTrackingWidget extends StatelessWidget {
  const RecentTrackingWidget({super.key, required this.cards});
  final List<TrackingCard> cards;

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: cards
              .map((card) => card)
              .toList(),
        ),
      ),
    );
  }
}