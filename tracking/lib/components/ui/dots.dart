part of '../../core/cores.dart';

class DotWidget extends StatelessWidget {

  const DotWidget({super.key,  required this.isFirst, required this.isSecond,required this.isThird});
  final bool isFirst;
  final bool isSecond;
  final bool isThird;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CircleAvatar(
        backgroundColor: isFirst ? Palette.primary : Palette.bgDanger,
        radius: 5,
      ),
      5.horizontalSpace,
      CircleAvatar(
        radius: 5,
        backgroundColor: isSecond ? Palette.primary : Palette.bgDanger,
      ),
      5.horizontalSpace,
      CircleAvatar(
        backgroundColor: isThird ? Palette.primary : Palette.bgDanger,
        radius: 5,
      )
    ],);
  }
}