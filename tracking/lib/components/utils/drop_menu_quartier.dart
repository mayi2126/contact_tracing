part of '../../core/cores.dart';

class DropMenuQuartier extends StatefulWidget {
  const DropMenuQuartier(
      {super.key, required this.onSelected, this.id});
  final Function(String?) onSelected;
  final int? id;

  @override
  State<DropMenuQuartier> createState() => _DropMenuQuartierState();
}

class _DropMenuQuartierState extends State<DropMenuQuartier> {
 

  @override
  Widget build(BuildContext context) {
   
    return BlocBuilder<DataBloc, DataState>(
        builder: (context, state) {
          if (state is VillageQuartierError) {
            return const Text('Quaritier non disponible');
          }

          if (state is DataInitial) {
            return const SizedBox.shrink();
          }

          if (state is VillageQuartierLoading) {

            return const Center(child: CircularProgressIndicator());

          } else if (state is VillageQuartierLoaded) {
            final List<Map<String, dynamic>> quartiers =
                state.villagesquartiers;
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
                  ? (quartiers.firstWhere(
                          (quartier) => quartier['id'] == widget.id,
                          orElse: () => quartiers.first))['id']
                      .toString()
                  : null,
              width: getWidth(333),

              trailingIcon: const Icon(Icons.keyboard_arrow_down_sharp),
              selectedTrailingIcon: const Icon(Icons.keyboard_arrow_up_sharp),
              // initialSelection: list.first,
              onSelected: widget.onSelected,
              // Appel du callback avec l'id sélectionné
              dropdownMenuEntries: quartiers.map<DropdownMenuEntry<String>>(
                  (Map<String, dynamic> quartier) {
                return DropdownMenuEntry<String>(
                  value:
                      quartier['id'].toString(), // Utilisez l'id comme valeur
                  label:
                      quartier['nomquartier'], // Affichez le name comme label
                );
              }).toList(),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      
    );
  }
}
