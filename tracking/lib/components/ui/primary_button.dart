part of '../../core/cores.dart';

// ignore: must_be_immutable
class PrimarytButton extends StatelessWidget {
  PrimarytButton(
      {Key? key,
      required this.btnText,
      required this.isFilledBtn,
      required this.onTapFuncton,
      this.size = 16,
      this.height = 45,
      this.width = 100,
        this.textColor,
        this.borderColor,
      this.btnBgColor})
      : super(key: key);
  final bool isFilledBtn;
  final String btnText;
  final VoidCallback onTapFuncton;
  Color? btnBgColor;
  Color? textColor;
  Color? borderColor;
  double height;
  double width;
  double size;
  bool isInfinity = true;
  @override
  Widget build(BuildContext context) {
    AppConfig.init(context);
    return SizedBox(
      height: getHeight(height),
      width: isInfinity ? double.infinity : getWidth(width),
      child: FilledButton(
          style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(btnBgColor ??
                  (!isFilledBtn ? Palette.contentPrimary : Palette.primary)),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(getSize(8)),
                  side: BorderSide(
                      color:borderColor?? btnBgColor ?? Palette.primary,
                      width: 1)))),
          onPressed: onTapFuncton,
          child: Text(
            btnText,
            textAlign: TextAlign.center,
            style: TextStyle(
              color:textColor?? (isFilledBtn ? Palette.contentPrimary : Palette.primary),
              fontSize: getFontSize(size),
              fontFamily: 'Inter',
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }
}
