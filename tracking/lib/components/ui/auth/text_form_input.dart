part of '../../../core/cores.dart';

class CustomTextFormInput extends StatelessWidget {
  const CustomTextFormInput(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.labelText,
      this.validator,
      this.isPassword = false,
      this.keybordType,
      this.prefIcon,
      this.minLine = 1,
      this.counterText,
      this.icon, this.onTap});

  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final String? Function(String?)? validator;
  final bool isPassword;
  final TextInputType? keybordType;
  final Widget? prefIcon;
  final int minLine;
  final String? counterText;
  final IconData? icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: minLine,
      keyboardType: keybordType,
      obscureText: isPassword,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        
        counterText: counterText,
        // counterStyle: StyleRessources.titreStyleRd,
        suffixIcon: IconButton(
          onPressed: onTap,
          icon: Icon(icon),
        ),
        prefixIcon: prefIcon,
        contentPadding: const EdgeInsets.all(10),
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
        
        // labelText: labelText,
        hintText: hintText,
        labelStyle: TextStyle(color: Palette.contentPrimary, fontSize: getFontSize(16)),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        hintStyle: TextStyle(color: Palette.hintColor, fontSize: getFontSize(16)),
        
        
        //  suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Mail.svg'),
      ),
    );
  }
}
