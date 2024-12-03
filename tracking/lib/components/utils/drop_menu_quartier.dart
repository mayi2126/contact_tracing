part of '../../core/cores.dart';

class DropMenuQuartier extends StatelessWidget {
  const DropMenuQuartier({super.key, required this.onSelected, this.id});
  final Function(String?) onSelected;
  final int? id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DataBloc(QuartierRepository())..add(FetchVillageQuartier()),
      child: BlocBuilder<DataBloc, DataState>(
        builder: (context, state) {

          if (state is VillageQuartierLoading) {
            return Center(child: CircularProgressIndicator());
          }  else if (state is VillageQuartierLoaded) {
                        final List<Map<String, dynamic>> quartiers = state.villagesquartiers;
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
            initialSelection: quartiers.isNotEmpty
                  ? (quartiers.firstWhere((quartier) => quartier['id'] == id,
                          orElse: () => quartiers.first))['id']
                      .toString()
                  : null,
            width: getWidth(333),

            trailingIcon: Icon(Icons.keyboard_arrow_down_sharp),
            selectedTrailingIcon: Icon(Icons.keyboard_arrow_up_sharp),
            // initialSelection: list.first,
            onSelected: onSelected,
            // Appel du callback avec l'id sélectionné
              dropdownMenuEntries: quartiers
                  .map<DropdownMenuEntry<String>>((Map<String, dynamic> quartier) {
                return DropdownMenuEntry<String>(
                  value: quartier['id'].toString(), // Utilisez l'id comme valeur
                  label: quartier['nomquartier'], // Affichez le name comme label
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
