part of '../../core/cores.dart';

class ReferencementCard extends StatelessWidget {
  const ReferencementCard({super.key,  required this.referencement, this.onDoubleTap, this.onTap});
  final Referencement referencement;
   final VoidCallback? onDoubleTap;
   final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            //  color: Colors.red,
            color: Palette.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(2, 3), // changes position of shadow
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //
            children: [
              GestureDetector(
                onDoubleTap: onDoubleTap,
                onTap:onTap,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(5),
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    // border: Border.all(color: Palette.stroke, width: 2),
                    color: const Color.fromARGB(57, 33, 149, 243),
                  ),
                  child: Stack(children: [
                    Center(
                      child: SizedBox(
                          height: 80,
                          width: 80,
                          child: Image.asset(
                            "assets/png/woman.png",
                            fit: BoxFit.fill,
                          )),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Palette.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: Text(
                          referencement.membreagerec.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                      ),
                    )
                  ]),
                ),
              ),
              5.verticalSpace,
              Text(
                referencement.fullName??"",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              2.verticalSpace,
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: Palette.primary,
                    size: 15,
                  ),
                  2.horizontalSpace,
                  Text(
                    referencement.nomvillage ?? "",
                    style: TextStyle(color: Palette.foreign, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
