part of '../../core/cores.dart';

class DropMenuVillage extends StatelessWidget {
  const DropMenuVillage({super.key, required this.onSelected});
  final Function(String?) onSelected;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          VillageBloc(VillageRepository())..add(VillageEvent()),
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
            // initialSelection: "Agoe",
            initialSelection: villages.isNotEmpty ? villages.first['id'].toString() : null,
            width: getWidth(333),

            trailingIcon: Icon(Icons.keyboard_arrow_down_sharp),
            selectedTrailingIcon: Icon(Icons.keyboard_arrow_up_sharp),
            // initialSelection: list.first,
            onSelected: onSelected,
            // Appel du callback avec l'id sélectionné
              dropdownMenuEntries: villages
                  .map<DropdownMenuEntry<String>>((Map<String, dynamic> quartier) {
                return DropdownMenuEntry<String>(
                  value: quartier['id'].toString(), // Utilisez l'id comme valeur
                  label: quartier['nomvillage'].isNotEmpty ? quartier['nomvillage'] : ' Nom inconnu', // Affichez le name comme label
                );
              }).toList(),
          );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
