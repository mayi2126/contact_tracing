part of '../../core/cores.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.icon, required this.title, this.onTap,});
  final IconData icon;
  final String title;
  final Function()? onTap;



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: getHeight(120),
        width: getWidth(50),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Palette.card,
          ),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            10.verticalSpace,
            CircleAvatar(
              radius: 10,
              backgroundColor: Colors.transparent,
              child:  Icon(icon,),
            ),
            10.verticalSpace,
            Text(title,textAlign: TextAlign.center,)
          ],
        ),
      ),
    );
  }
}
