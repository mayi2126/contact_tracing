part of '../../core/cores.dart';

class ReferencementCard extends StatelessWidget {
  const ReferencementCard(
      {super.key, required this.referencement, this.onDoubleTap, this.onTap});
  final Referencement referencement;
  final VoidCallback? onDoubleTap;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            //  color: Colors.red,
            color: Palette.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(2, 3), // changes position of shadow
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //
            children: [
              GestureDetector(
                onDoubleTap: onDoubleTap,
                onTap: onTap,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(5),
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    // border: Border.all(color: Palette.stroke, width: 2),
                    color: const Color.fromARGB(57, 33, 149, 243),
                  ),
                  child: Stack(children: [
                    Center(
                      child: SizedBox(
                          height: 80,
                          width: 80,
                          child: Image.asset(
                            "assets/png/woman.png",
                            fit: BoxFit.fill,
                          )),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Palette.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: Text(
                          referencement.membreagerec.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                      ),
                    )
                  ]),
                ),
              ),
              5.verticalSpace,
              Text(
                referencement.fullName ?? "",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              2.verticalSpace,
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Détails de ",
                              style: TextStyle(fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Palette.foreign),
                            ),
                            TextSpan(
                              text: referencement.fullName ?? "",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Palette.primary,
                                  fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            const Divider(color: Palette.foreign, height: 5,endIndent: 10,indent: 10,),

                            referencement.recommandation != null
                                ? const Text("Recommandation ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Palette.foreign
                                    ))
                                : SizedBox(),
                            referencement.recommandation != null
                                ? Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      " ${referencement.recommandation}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                : SizedBox(),
                            10.verticalSpace,
                            referencement.agegrossesse != null
                                ? const Text("Age du grossesse ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Palette.foreign
                                    ))
                                : SizedBox(),
                            referencement.agegrossesse != null
                                ? Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      " ${referencement.agegrossesse}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                : SizedBox(),
                            10.verticalSpace,
                            referencement.dateref != null
                                ? const Text("Date du referencement ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Palette.foreign
                                    ))
                                : SizedBox(),
                            referencement.dateref != null
                                ? Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      dateStringFormat(referencement.dateref!),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                : SizedBox(),
                            10.verticalSpace,
                            const Text("Quartier",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Palette.foreign)),
                            3.verticalSpace,
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Palette.bgGrey,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(children: [
                                const Icon(
                                  Icons.local_gas_station_outlined,
                                  color: Palette.primary,
                                  size: 20,
                                ),
                                5.horizontalSpace,
                                Text(referencement.nomquartier!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    )),
                              ]),
                            ),
                          ]),
                    ),
                  );
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: Palette.primary,
                      size: 15,
                    ),
                    2.horizontalSpace,
                    Text(
                      referencement.nomvillage ?? "",
                      style: TextStyle(color: Palette.foreign, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
