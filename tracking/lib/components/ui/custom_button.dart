part of '../../core/cores.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.onTap,
      required this.pLeft,
      required this.pRight,
      required this.pBottom,
      required this.pTop,
      required this.radius,
      required this.text,
      required this.textColor,
      required this.containerColor,
      this.borderColor = const Color.fromARGB(0, 76, 175, 79),
      }
      );

  final void Function()? onTap;
  final double pLeft;
  final double pRight;
  final double pBottom;
  final double pTop;
  final double radius;
  final String text;
  final Color textColor;
  final Color containerColor;
  final Color borderColor;
  // final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // width: width,
        padding: EdgeInsets.only(
            left: pLeft, bottom: pBottom, right: pRight, top: pTop),
        decoration: BoxDecoration(
            color: containerColor,
            border: Border.all(
              color: borderColor,
            ),
            borderRadius: BorderRadius.all(Radius.circular(radius))),
        child: Text(
          text,
          style: TextStyle(color: textColor,fontWeight: FontWeight.w500,fontSize: 17),
        ),
      ),
    );
  }
}
