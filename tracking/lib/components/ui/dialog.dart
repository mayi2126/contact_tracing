part of '../../core/cores.dart';
void showDialogCustom(BuildContext context, String title) {
  showDialog(
            context: context,
            builder: (context) {
              return  AlertDialog(
                title: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                content: const SizedBox(
                  height: 100, // Adjust the height here
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Palette
                          .primary, // Replace with a valid color reference
                      strokeWidth: 3,
                    ),
                  ),
                ),
              );
            },
          );
}