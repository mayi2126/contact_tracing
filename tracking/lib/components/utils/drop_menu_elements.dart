 part of '../../core/cores.dart';

class DropMenuElement extends StatelessWidget {
  const DropMenuElement({super.key, required this.onSelected});
  final Function(String?) onSelected;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ElementDeDonneesBloc()..add(ElementsEvent()),
      child: BlocBuilder<ElementDeDonneesBloc, DataState>(
        builder: (context, state) {

          if (state is ElementDeDonneLoading) {
            return const Center(child: CircularProgressIndicator());
          }  else if (state is ElementDeDonneLoaded) {
                        final List<Map<String, dynamic>> elements =  state.elements;
                       
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
            // initialSelection: "1",
            // initialSelection: professions.isNotEmpty ? professions.first['id'].toString() : null,
            hintText: "Choisir un element",

            width: getWidth(333),

            trailingIcon: const Icon(Icons.keyboard_arrow_down_sharp),
            selectedTrailingIcon: const Icon(Icons.keyboard_arrow_up_sharp),
            // initialSelection: list.first,
            onSelected: onSelected,
            // Appel du callback avec l'id sélectionné
              dropdownMenuEntries: elements
                  .map<DropdownMenuEntry<String>>((Map<String, dynamic> element) {
                return DropdownMenuEntry<String>(
                  value: element['id'].toString(), // Utilisez l'id comme valeur
                  label: element['libelementdedonnee'].isNotEmpty ? element['libelementdedonnee'] : ' Nom inconnu', // Affichez le name comme label
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
