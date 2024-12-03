part of "../../core/cores.dart";

Future<void> dialogBuilder(
  BuildContext context,
  void Function() onTapPrimary,
  void Function() onTapSecondary,
  String title,
  String subTitle,
  String primaryBtnText,
  String secondaryBtnText,
) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Palette.white,
        title: Text(
          title,
          style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              subTitle,
              textAlign: TextAlign.center,
            ),
            20.verticalSpaceFromWidth,
            PrimaryButton(
              btnText: primaryBtnText,
              width: double.infinity,
              isFilledBtn: true,
              onTapFunction: onTapPrimary,
              btnBgColor: Palette.primary,
            ),
            20.verticalSpaceFromWidth,
            PrimaryButton(
              btnText: secondaryBtnText,
              width: double.infinity,
              isFilledBtn: true,
              onTapFunction: onTapSecondary,
              textColor: Palette.primary,
              btnBgColor: Palette.white,
            ),
          ],
        ),
      );
    },
  );
}