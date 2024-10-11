part of '../../core/cores.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });
  final IconData icon;
  final String title;
  final Function()? onTap;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
   Color _containerColor = Palette.card;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _containerColor = Palette.primary; // Change la couleur sur le clic
        });
      },
      onTapUp: (_) {
        setState(() {
          _containerColor = Palette.card; // Rétablit la couleur d'origine
        });
      },
      onTap: widget.onTap,
      child: Container(
        height: getHeight(120),
        width: getWidth(50),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: _containerColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            10.verticalSpace,
            CircleAvatar(
              radius: 10,
              backgroundColor: Colors.transparent,
              child: Icon(
                widget.icon,
              ),
            ),
            10.verticalSpace,
            Text(
              widget.title,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
