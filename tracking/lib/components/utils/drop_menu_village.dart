part of '../../core/cores.dart';

class DropMenuVillage extends StatelessWidget {
  const DropMenuVillage({super.key, required this.onSelected, this.nom, this.id});
  final Function(String?) onSelected;
  final String? nom;
  final int? id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          VillageBloc()..add(VillageEvent()),
      child: BlocBuilder<VillageBloc, DataState>(
        builder: (context, state) {

          if (state is VillageLoading) {
            return const Center(child: CircularProgressIndicator());
          }  else if (state is VillageLoaded) {
                        final List<Map<String, dynamic>> villages = state.villages;
          return DropdownMenu<String>(
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: Palette.bgGrey,
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: Palette.primary,
                  width: 2,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Palette.stroke,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
           initialSelection: id != null && villages.isNotEmpty
                  ? (villages.firstWhere(
                          (village) => village['nomvillage'] == nom,
                          orElse: () => villages.first))['nomvillage']
                      .toString()
                  : null,
            // initialSelection: "choisir un village",
            hintText: nom ?? "Choisir un village",
            width: getWidth(333),

            trailingIcon: const Icon(Icons.keyboard_arrow_down_sharp),
            selectedTrailingIcon: const Icon(Icons.keyboard_arrow_up_sharp),
            // initialSelection: list.first,
            onSelected: onSelected,
            // Appel du callback avec l'id sélectionné
              dropdownMenuEntries: villages
                  .map<DropdownMenuEntry<String>>((Map<String, dynamic> village) {
                return DropdownMenuEntry<String>(
                  value: village['id'].toString(), // Utilisez l'id comme valeur
                  label: village['nomvillage'].isNotEmpty ? village['nomvillage'] : ' Nom inconnu', // Affichez le name comme label
                );
              }).toList(),
          );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
