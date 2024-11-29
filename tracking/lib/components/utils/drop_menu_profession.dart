part of '../../core/cores.dart';

class DropMenuProfession extends StatelessWidget {
  const DropMenuProfession({super.key, required this.onSelected});
  final Function(String?) onSelected;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfessionBloc(ProfessionsRepository())..add(ProfessionsEvent()),
      child: BlocBuilder<ProfessionBloc, DataState>(
        builder: (context, state) {

          if (state is ProfessionLoading) {
            return const Center(child: CircularProgressIndicator());
          }  else if (state is ProfessionLoaded) {
                        final List<Map<String, dynamic>> professions =  state.professions;
                       
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
            initialSelection: professions.isNotEmpty ? professions.first['id'].toString() : null,
            width: getWidth(333),

            trailingIcon: Icon(Icons.keyboard_arrow_down_sharp),
            selectedTrailingIcon: Icon(Icons.keyboard_arrow_up_sharp),
            // initialSelection: list.first,
            onSelected: onSelected,
            // Appel du callback avec l'id sélectionné
              dropdownMenuEntries: professions
                  .map<DropdownMenuEntry<String>>((Map<String, dynamic> quartier) {
                return DropdownMenuEntry<String>(
                  value: quartier['id'].toString(), // Utilisez l'id comme valeur
                  label: quartier['libprofession'].isNotEmpty ? quartier['libprofession'] : ' Nom inconnu', // Affichez le name comme label
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
