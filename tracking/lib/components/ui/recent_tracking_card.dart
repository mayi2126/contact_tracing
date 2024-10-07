part of '../../core/cores.dart';

class TrackingCard extends StatelessWidget {
  const TrackingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Palette.white,
          border: Border.all(color: Palette.primary),
          borderRadius: BorderRadius.circular(10),
          // boxShadow: [BoxShadow(color: Palette.dark2,blurRadius: 2,offset: Offset(0,5))]
        ),
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          children: [
            const Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "12 Sept, 2022",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Palette.foreign),
                    ),
                    Text(
                      "Far Jeep",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ],
                )),
            Expanded(
                child: Container(
                    height: getHeight(100),
                    width: getWidth(100),
                    child: Image.asset("assets/jpg/map.jpg"))),
            Expanded(
              child: Column(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit_outlined,
                        color: Palette.primary,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
