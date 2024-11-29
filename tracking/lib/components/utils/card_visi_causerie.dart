part of '../../core/cores.dart';

class CardVisiteCauserie extends StatelessWidget {
  const CardVisiteCauserie({super.key, required this.visites});

  final List<VisiteModel> visites;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: visites.map((visite) => CardVC(visite: visite)).toList(),
    );
  }
}
