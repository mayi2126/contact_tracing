part of '../../core/cores.dart';

class DropMenuMotif extends StatelessWidget {
  const DropMenuMotif({super.key, required this.onSelected, this.nom});
  final Function(String?) onSelected;
  final String? nom;


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MotifBloc()..add(MotifsEvent()),
      child: BlocBuilder<MotifBloc, DataState>(
        builder: (context, state) {

          if (state is MotifLoading) {
            return const Center(child: CircularProgressIndicator());
          }  else if (state is MotifLoaded) {
                        final List<Map<String, dynamic>> motifs =  state.motifs;
                       
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
            initialSelection:  motifs.isNotEmpty
                  ? (motifs.firstWhere(
                          (motif) => motif['libmotif'] == nom,
                          orElse: () => motifs.first))['libmotif']
                      .toString()
                  : null,
            width: getWidth(333),
            hintText: nom ?? "Choisir un motif",
            trailingIcon: const Icon(Icons.keyboard_arrow_down_sharp),
            selectedTrailingIcon: const Icon(Icons.keyboard_arrow_up_sharp),
            // initialSelection: list.first,
            onSelected: onSelected,
            // Appel du callback avec l'id sélectionné
              dropdownMenuEntries: motifs
                  .map<DropdownMenuEntry<String>>((Map<String, dynamic> motif) {
                return DropdownMenuEntry<String>(
                  value: '${motif['id']}:${motif['libmotif']}', // Utilisez l'id comme valeur
                  label: motif['libmotif'].isNotEmpty ? motif['libmotif'] : ' Nom inconnu', // Affichez le name comme label
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
