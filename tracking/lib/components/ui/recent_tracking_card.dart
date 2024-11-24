part of '../../core/cores.dart';

class TrackingCard extends StatelessWidget {
  const TrackingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Palette.white,
            border: Border.all(color: Palette.cardBorderColor, width: 2),
            borderRadius: BorderRadius.circular(10),
            // boxShadow: const [
            //   BoxShadow(
            //     color: Palette.dark2,
            //     blurRadius: 3,
            //     offset:  Offset(0, 2),
            //   ),
            // ]
            ),
        padding: const EdgeInsets.only(left: 10, right: 10,top: 2,bottom: 3),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 25,
               backgroundColor: Palette.primary,
               child: Text("FJ",style: TextStyle(color: Palette.white),),
            ),
            7.horizontalSpace,

            const Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Far Jeep",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      "Age : 12 ans",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Palette.foreign),
                    ),
                    Text(
                      "Date de naissance : 12/12/2022",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Palette.foreign),
                    ),
                    Text(
                      "Sexe : Feminin",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Palette.foreign),
                    ),
                    
                  ],
                )),

            Column(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Palette.contentPrimary,
                      size: 15,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
