part of '../../core/cores.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.icon, required this.title,});
  final IconData icon;
  final String title;



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: getHeight(100),
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
