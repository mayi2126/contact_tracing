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
          style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
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
            PrimarytButton(
              btnText: primaryBtnText,
              width: double.infinity,
              isFilledBtn: true,
              onTapFuncton: onTapPrimary,
              btnBgColor: Palette.primary,
            ),
            20.verticalSpaceFromWidth,
            PrimarytButton(
              btnText: secondaryBtnText,
              width: double.infinity,
              isFilledBtn: true,
              onTapFuncton: onTapSecondary,
              textColor: Palette.primary,
              btnBgColor: Palette.white,
            ),
          ],
        ),
      );
    },
  );
}