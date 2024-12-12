part of '../../core/cores.dart';

class TrackingCard extends StatelessWidget {
  const TrackingCard({super.key, required this.recensement, this.onTap});
  final Recensement recensement;
  final  VoidCallback? onTap ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Container(
          // width: double.infinity,
          decoration: BoxDecoration(
              color: Palette.white,
              borderRadius: BorderRadius.circular(10),
              // border: Border.all(color: Palette.border, width: 1),
              // boxShadow:  [
              //   BoxShadow(
              //     color: Colors.grey.withOpacity(0.2),
              //     spreadRadius: 4,
              //     blurRadius: 5,
              //     offset: const Offset(2, 8),
              //   ),
              //]
              ),
          padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 23,
                backgroundColor: Palette.primary,
                child:  CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage("assets/png/notes.png"),
                  
                ),
              ),
              7.horizontalSpace,
               Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                         "${recensement.membrenomrec} ${recensement.membreprenomrec}",
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      3.verticalSpace,
                      Text(
                        recensement.nomvillage,
                        style: TextStyle( fontSize: 12),
                      ),
                      3.verticalSpace,
                      Text(
                        recensement.libprofession,
                        style: TextStyle(color: Palette.foreign, fontSize: 10),
                      ),
                     
                    ],
                  )),
              // Column(
              //   children: [
              //     IconButton(
              //         onPressed: () {},
              //         icon: const Icon(
              //           Icons.arrow_forward_ios_outlined,
              //           color: Palette.contentPrimary,
              //           size: 15,
              //         )),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
