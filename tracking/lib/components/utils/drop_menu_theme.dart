part of '../../core/cores.dart';

class DropMenuTheme extends StatelessWidget {
  const DropMenuTheme(
      {super.key, required this.onSelected, required this.type, this.id});
  final Function(String?) onSelected;
  final String type;
  final int? id ;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ThemeBloc(ThemesRepository())..add(ThemesEvent(type)),
      child: BlocBuilder<ThemeBloc, DataState>(
        builder: (context, state) {
          if (state is ThemeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ThemeLoaded) {
            final List<Map<String, dynamic>> themes = state.themes;

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
              initialSelection: themes.isNotEmpty
                  ? (themes.firstWhere((theme) => theme['id'] == id,
                          orElse: () => themes.first))['id']
                      .toString()
                  : null,
              width: getWidth(333),

              trailingIcon: Icon(Icons.keyboard_arrow_down_sharp),
              selectedTrailingIcon: Icon(Icons.keyboard_arrow_up_sharp),
              // initialSelection: list.first,
              onSelected: onSelected,
              // Appel du callback avec l'id sélectionné
              dropdownMenuEntries: themes.map<DropdownMenuEntry<String>>(
                  (Map<String, dynamic> quartier) {
                return DropdownMenuEntry<String>(
                  value:
                      quartier['id'].toString(), // Utilisez l'id comme valeur
                  label: quartier['libtheme'].isNotEmpty
                      ? quartier['libtheme']
                      : ' Nom inconnu', // Affichez le name comme label
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
