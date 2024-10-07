part of '../../../core/cores.dart';

class RecentTrackingWidget extends StatelessWidget {
  const RecentTrackingWidget({super.key});

  @override
  Widget build(BuildContext context) {

    const List<Widget> items = [
      TrackingCard(),
      TrackingCard(),
      TrackingCard(),
      TrackingCard(),
      TrackingCard(),
    ];
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: items
              .map((item) => item)
              .toList(),
        ),
      ),
    );
  }
}