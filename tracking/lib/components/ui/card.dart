part of '../../core/cores.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    required this.image,
  });
  final IconData icon;
  final String title;
  final Function()? onTap;
  final String image;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  final Color _containerColor = Palette.card;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     
      onTap: widget.onTap,
      child: Container(
        height: getHeight(120),
        width: double
            .infinity, // Assurez-vous que la largeur est bien "double.infinity" dans Expanded
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Palette.white,
          boxShadow:  [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(3, 8),
          )]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  widget.image, // Remplacez par l'URL de votre image
                  width: getWidth(70),
                  height: getHeight(70),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            5.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Text(
                widget.title,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontSize: 10, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
