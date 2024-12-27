part of '../../core/cores.dart';

class CardC extends StatelessWidget {
  const CardC({super.key, required this.visite});

  final VisiteModel visite;

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(visite.dateEnreg);

    // Formater la date sans l'heure en utilisant 'd MMMM yyyy'
    String formattedDate = DateFormat('d MMMM yyyy', 'fr').format(dateTime);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RoutesName.showCauserie,
            arguments: visite);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          height: getHeight(130),
          width: getWidth(200),
          decoration: BoxDecoration(
            // color: Palette.white,
            border: Border.all(color: Palette.primary),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: getWidth(120),
                    padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                    decoration: BoxDecoration(
                      border: Border.all(color: Palette.primary),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      visite.libelementdedonnee,
                      
                      style: const TextStyle(color: Palette.primary),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.showCauserie,
                          arguments: visite);
                    },
                    child: const Icon(Icons.arrow_forward_ios_outlined,
                        size: 15, color: Palette.primary),
                  )
                ],
              ),
              10.verticalSpace,
              Text(
                visite.lieuAp,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Palette.primary),
              ),
              const Spacer(),
              Text(
                formattedDate,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Palette.foreign,
                    fontSize: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
