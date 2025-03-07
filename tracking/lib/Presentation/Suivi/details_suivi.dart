part of '../../core/cores.dart';

class DetailsSuivi extends StatelessWidget {
  const DetailsSuivi({super.key, required this.arguments});
  final PatientSuivi arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Détails du suivi",
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
                          child: const Icon(
                            Icons.person,
                            color: Palette.white,
                            size: 40,
                          ),
                        ),
                        10.horizontalSpace,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              arguments.fullName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            8.verticalSpace,
                            Text(
                              arguments.statutref,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Palette.warningText),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              2.verticalSpace,
              Container(
                // height: double.infinity,
                // margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Palette.bgGrey,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "CPN effectuées avant 12 SA",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        const Spacer(),
                        arguments.cpnavantdouzsa == "Oui"
                            ? const Icon(
                                Icons.check_outlined,
                                color: Palette.primary,
                                size: 20,
                              )
                            : const Icon(
                                Icons.close_outlined,
                                color: Palette.danger,
                                size: 20,
                              ),
                      ],
                    ),
                    10.verticalSpace,
                    Row(
                      children: [
                        const Text(
                          "Rendez-vous respecté",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        const Spacer(),
                        arguments.rdvrespecte == "Oui"
                            ? const Icon(
                                Icons.check_outlined,
                                color: Palette.primary,
                                size: 20,
                              )
                            : const Icon(
                                Icons.close_outlined,
                                color: Palette.danger,
                                size: 20,
                              ),
                      ],
                    ),
                    10.verticalSpace,
                    Row(
                      children: [
                        const Text(
                          "Medicament diponible",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        const Spacer(),
                        arguments.dispomedicament == "Oui"
                            ? const Icon(
                                Icons.check_outlined,
                                color: Palette.primary,
                                size: 20,
                              )
                            : const Icon(
                                Icons.close_outlined,
                                color: Palette.danger,
                                size: 20,
                              ),
                      ],
                    ),
                    10.verticalSpace,
                    Row(
                      children: [
                        const Text(
                          "Mi disponible",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        const Spacer(),
                        arguments.palumiidisponible == "Oui"
                            ? const Icon(
                                Icons.check_outlined,
                                color: Palette.primary,
                                size: 20,
                              )
                            : const Icon(
                                Icons.close_outlined,
                                color: Palette.danger,
                                size: 20,
                              ),
                      ],
                    ),
                    10.verticalSpace,
                    Row(
                      children: [
                        const Text(
                          "Statut de vac correct",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        const Spacer(),
                        arguments.statuvaccorrect == "Oui"
                            ? const Icon(
                                Icons.check_outlined,
                                color: Palette.primary,
                                size: 20,
                              )
                            : const Icon(
                                Icons.close_outlined,
                                color: Palette.danger,
                                size: 20,
                              ),
                      ],
                    ),
                    10.verticalSpace,
                    Row(
                      children: [
                        const Text(
                          "Analyse réalisée",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        const Spacer(),
                        arguments.analysemedrealise == "Oui"
                            ? const Icon(
                                Icons.check_outlined,
                                color: Palette.primary,
                                size: 20,
                              )
                            : const Icon(
                                Icons.close_outlined,
                                color: Palette.danger,
                                size: 20,
                              ),
                      ],
                    ),
                    10.verticalSpace,
                    Row(
                      children: [
                        const Text(
                          "Dormir sous MI",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        const Spacer(),
                        arguments.paludormirsousmii == "Oui"
                            ? const Icon(
                                Icons.check_outlined,
                                color: Palette.primary,
                                size: 20,
                              )
                            : const Icon(
                                Icons.close_outlined,
                                color: Palette.danger,
                                size: 20,
                              ),
                      ],
                    ),
                    10.verticalSpace,
                    Row(
                      children: [
                        const Text(
                          "A un formation Sanitaire",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        const Spacer(),
                        arguments.lieuaccouchementfs == "Oui"
                            ? const Icon(
                                Icons.check_outlined,
                                color: Palette.primary,
                                size: 20,
                              )
                            : const Icon(
                                Icons.close_outlined,
                                color: Palette.danger,
                                size: 20,
                              ),
                      ],
                    ),
                  ],
                ),
              ),
              10.verticalSpace,
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Palette.bgGrey,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          "TPI 1",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        const Spacer(),
                        arguments.palutpiun == "Oui"
                            ? const Icon(
                                Icons.check_outlined,
                                color: Palette.primary,
                                size: 20,
                              )
                            : const Icon(
                                Icons.close_outlined,
                                color: Palette.danger,
                                size: 20,
                              ),
                      ],
                    ),
                    10.verticalSpace,
                    Row(
                      children: [
                        const Text(
                          "TPI 2",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        const Spacer(),
                        arguments.palutpideux == "Oui"
                            ? const Icon(
                                Icons.check_outlined,
                                color: Palette.primary,
                                size: 20,
                              )
                            : const Icon(
                                Icons.close_outlined,
                                color: Palette.danger,
                                size: 20,
                              ),
                      ],
                    ),
                    10.verticalSpace,
                    Row(
                      children: [
                        const Text(
                          "TPI 3",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        const Spacer(),
                        arguments.palutpitrois == "Oui"
                            ? const Icon(
                                Icons.check_outlined,
                                color: Palette.primary,
                                size: 20,
                              )
                            : const Icon(
                                Icons.close_outlined,
                                color: Palette.danger,
                                size: 20,
                              ),
                      ],
                    ),
                    10.verticalSpace,
                    Row(
                      children: [
                        const Text(
                          "TPI 4",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        const Spacer(),
                        arguments.palutpiquatre == "Oui"
                            ? const Icon(
                                Icons.check_outlined,
                                color: Palette.primary,
                                size: 20,
                              )
                            : const Icon(
                                Icons.close_outlined,
                                color: Palette.danger,
                                size: 20,
                              ),
                      ],
                    ),
                  ],
                ),
              ),
              10.verticalSpace,
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Palette.bgGrey,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Issue d'accouchement",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          arguments.issusaccouchement,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 13, color: Palette.warningText),
                        ),
                      ],
                    ),
                    10.verticalSpace,
                    Row(
                      children: [
                        const Text(
                          "Signe de danger",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),   
                        const Spacer(),
                        Text(
                          arguments.recherchesignedanger,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 13, color: Palette.danger),
                        ),
                      ],
                    ),
                    10.verticalSpace,
                    arguments.sirdvrespectenon != null ? Row(
                      children: [
                        const Text(
                          "Raison du non respect",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          arguments.sirdvrespectenon,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 13, color: Palette.warningText),
                        ),
                      ],
                    ):const SizedBox(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
