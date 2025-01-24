part of '../../core/cores.dart';

class CardCauserie extends StatelessWidget {
  const CardCauserie({super.key, required this.visites});

  final List<VisiteModel> visites;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: visites.isNotEmpty ?  visites.map((visite) => CardC(visite: visite)).toList() :  [const Center(child: Text('Aucune causerie trouvée',style: TextStyle(color: Palette.foreign),))],
    );
  }
}
