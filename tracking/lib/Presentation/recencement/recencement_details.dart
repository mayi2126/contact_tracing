part of '../../core/cores.dart';

class RecencementDetails extends StatelessWidget {
  const RecencementDetails({super.key, required this.arguments});
  final Recensement arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Détails du recensement",
        ),
        backgroundColor: Palette.white,
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back_ios_outlined, color: Palette.primary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Palette.border, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(15),
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Palette.primary,
                          ),
                          child: Image.asset(
                            "assets/png/contacts.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        10.horizontalSpace,
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "${arguments.membrenomrec} ${arguments.membreprenomrec}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                              5.verticalSpace,
                              Text(arguments.codemembreFamille,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Palette.foreign)),
                            ]),
                      ],
                    ),
                  ),
                ),
              ),
              // 10.verticalSpace,
              Align(
                alignment: Alignment.centerRight, // Aligne le widget à droite
                child: Text(
                  dateStringFormat(arguments.daterecensement),
                  style: const TextStyle(
                       fontSize: 10,color: Palette.foreign),
                ),
              ),
              const Divider(
                color: Palette.bgGrey,
              ),
              5.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Age",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Palette.foreign)),
                  5.horizontalSpace,
                  Text("${arguments.membreagerec} (ans)",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14)),
                ],
              ),
              10.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Date de naissance",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Palette.foreign)),
                  5.horizontalSpace,
                  Text(dateStringFormat(arguments.membredatenaissrec),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Palette.primary)),
                ],
              ),
              10.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Contact",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Palette.foreign)),
                  5.horizontalSpace,
                  Text(arguments.contactrec,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Palette.primary)),
                ],
              ),
              10.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Profession",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Palette.foreign)),
                  5.horizontalSpace,
                  Text(arguments.libprofession,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Palette.primary)),
                ],
              ),
              20.verticalSpace,
              const Text("Informations additionnelles",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              20.verticalSpace,
              const Text("Observations",
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
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline_rounded,
                      color: Palette.primary,
                      size: 20,
                    ),
                    5.horizontalSpace,
                    Text(arguments.observationrec,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        )),
                  ],
                ),
              ),
              10.verticalSpace,
              const Text("Village",
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
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_pin,
                      color: Palette.primary,
                      size: 20,
                    ),
                    5.horizontalSpace,
                    Text(arguments.nomvillage,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        )),
                  ],
                ),
              ),

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
                child: Row(
                  children: [
                    const Icon(
                      Icons.local_gas_station_outlined,
                      color: Palette.primary,
                      size: 20,
                    ),
                    5.horizontalSpace,
                    Text(arguments.nomquartier,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        )),
                  ],
                ),
              ),
              10.verticalSpace,
              const Text("Commune",
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
                child: Row(
                  children: [
                    const Icon(
                      Icons.countertops,
                      color: Palette.primary,
                      size: 20,
                    ),
                    5.horizontalSpace,
                    Text(arguments.nomCommune,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        )),
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
