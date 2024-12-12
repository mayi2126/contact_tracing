part of '../../core/cores.dart';

class TrackingCard extends StatelessWidget {
  const TrackingCard({super.key, required this.recensement});
  final Recensement recensement;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        // width: double.infinity,
        decoration: BoxDecoration(
            color: Palette.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow:  [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 4,
                blurRadius: 5,
                offset: const Offset(2, 8),
              ),
            ]),
        padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 15,
              backgroundColor: Palette.primary,
              child: Text(
                "FJ",
                style: TextStyle(color: Palette.white),
              ),
            ),
            7.horizontalSpace,
             Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                       "${recensement.membrenomrec} ${recensement.membreprenomrec}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    3.verticalSpace,
                    Text(
                      recensement.libprofession,
                      style: TextStyle(color: Palette.foreign),
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
