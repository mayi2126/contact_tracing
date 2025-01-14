part of '../../core/cores.dart';

class TrackingCard extends StatelessWidget {
  const TrackingCard({super.key, required this.recensement, this.onTap});
  final Recensement recensement;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                 Padding(
                  padding:  const EdgeInsets.only(right: 15),
                  child:  Text("${recensement.agemois}",style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 12),),
                ),
                5.horizontalSpace,
                 const Padding(
                   padding: EdgeInsets.only(right: 15),
                   child: CircleAvatar(
                     radius: 20,
                     backgroundImage: AssetImage("assets/png/notes.png"),
                                  
                   ),
                 ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "${recensement.membrenomrec} ${recensement.membreprenomrec}",
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                   
                    3.verticalSpace,
                    Text(
                      recensement.libprofession,
                      style: const TextStyle(color: Palette.foreign, fontSize: 10),
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  height: 30,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(171, 243, 170, 33),
                  ),
                  child: Center(child: Text("${recensement.membreagerec} ans",style: const TextStyle(fontSize: 12),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,)),
                )
              ],
            ),
            const Divider(indent: 30,color: Palette.bgGrey,),
          ],
        ),
      ),

      //  Padding(
      //   padding: const EdgeInsets.only(bottom: 15),
      //   child: Container(
      //     // width: double.infinity,
      //     decoration: BoxDecoration(
      //         color: Palette.white,
      //         borderRadius: BorderRadius.circular(10),
      //         // border: Border.all(color: Palette.border, width: 1),
      //         // boxShadow:  [
      //         //   BoxShadow(
      //         //     color: Colors.grey.withOpacity(0.2),
      //         //     spreadRadius: 4,
      //         //     blurRadius: 5,
      //         //     offset: const Offset(2, 8),
      //         //   ),
      //         //]
      //         ),
      //     padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
      //     child: Row(
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         const CircleAvatar(
      //           radius: 23,
      //           backgroundColor: Palette.primary,
      //           child:  CircleAvatar(
      //             radius: 20,
      //             backgroundImage: AssetImage("assets/png/notes.png"),

      //           ),
      //         ),
      //         7.horizontalSpace,
      //          Expanded(
      //             flex: 2,
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               mainAxisAlignment: MainAxisAlignment.start,
      //               children: [
      //                 Text(
      //                    "${recensement.membrenomrec} ${recensement.membreprenomrec}",
      //                   style:
      //                       const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      //                 ),
      //                 3.verticalSpace,
      //                 Text(
      //                   recensement.nomvillage,
      //                   style: const TextStyle( fontSize: 12),
      //                 ),
      //                 3.verticalSpace,
      //                 Text(
      //                   recensement.libprofession,
      //                   style: const TextStyle(color: Palette.foreign, fontSize: 10),
      //                 ),

      //               ],
      //             )),
      //         // Column(
      //         //   children: [
      //         //     IconButton(
      //         //         onPressed: () {},
      //         //         icon: const Icon(
      //         //           Icons.arrow_forward_ios_outlined,
      //         //           color: Palette.contentPrimary,
      //         //           size: 15,
      //         //         )),
      //         //   ],
      //         // )
      //         const Spacer(),

      //        const Icon(Icons.keyboard_arrow_down_sharp)
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
