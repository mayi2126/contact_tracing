part of '../../../core/cores.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
  
    
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Catégories",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          10.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
            children: [
              const Expanded(
                  child: CardWidget(
                icon: Icons.recent_actors,
                title: "Récencements",
              )),
              15.horizontalSpace,
              const Expanded(
                  child: CardWidget(
                icon: Icons.local_activity_outlined,
                title: "Activité ASC/AC",
              )),
              15.horizontalSpace,
              const Expanded(
                  child: CardWidget(
                icon: Icons.people_sharp,
                title: "Activité Préventives",
              )),
            ],
          ),
          10.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
            children: [
              const Expanded(
                  child: CardWidget(
                icon: Icons.health_and_safety_outlined,
                title: "Visite A Domicile",
              )),
              15.horizontalSpace,
              const Expanded(
                  child: CardWidget(
                icon: Icons.chat,
                title: "Dialogues",
              )),
              15.horizontalSpace,
              const Expanded(
                  child: CardWidget(
                icon: Icons.handshake,
                title: "Causeries Éducatives",
              )),
            ],
          ),
          10.verticalSpace,
          const Text(
            "Récencements récents",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          10.verticalSpace,

          const RecentTrackingWidget(),
        ],
      ),
    );
  }
}