part of '../../core/cores.dart';

class VisitePage extends StatefulWidget {
  const VisitePage({super.key});

  @override
  State<VisitePage> createState() => _VisitePageState();
}

class _VisitePageState extends State<VisitePage> {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.primary,
        iconTheme: const IconThemeData(color: Palette.white),
        title: const Text(
          "Visites Domiciliaires",
          style: TextStyle(color: Palette.white, fontSize: 17),
        ),
        bottom: PreferredSize(
            preferredSize: const Size(
              double.infinity,
              60,
            ),
            child: Container(
              color: Palette.primary,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 2, 15, 10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: CustomTextFormInput(
                          icon: Icons.search,
                          controller: search,
                          hintText: "Recherche ...",
                          labelText: "Recherche..."),
                    ),
                    // const Spacer(),
                    2.horizontalSpace,
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.filter_alt_sharp,
                        color: Palette.white,
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
      body: const VisiteList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, RoutesName.addVisite);
        },
        backgroundColor: Palette.primary,
        child: const Icon(
          Icons.add,
          color: Palette.white,
        ),
        shape: CircleBorder(),
      ),
    );
  }
}

class VisiteList extends StatelessWidget {
  const VisiteList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "Visites",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Palette.foreign),
            ),
            TextButton.icon(
              onPressed: () {},
              label: Text(
                "Voir tous",
                style: TextStyle(color: Palette.foreign),
              ),
              icon: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 15,
                color: Palette.foreign,
              ),
              iconAlignment: IconAlignment.end,
            )
          ]),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 20, right: 20),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  height: getHeight(130),
                  width: getWidth(200),
                  decoration: BoxDecoration(
                      border: Border.all(color: Palette.primary),
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                            decoration: BoxDecoration(
                                border: Border.all(color: Palette.primary),
                                borderRadius: BorderRadius.circular(20)),
                            child: Text("Famille",
                                style: TextStyle(color: Palette.primary)),
                          ),
                          const Spacer(),
                          Icon(Icons.arrow_forward_ios_outlined,
                              size: 15, color: Palette.primary)
                        ],
                      ),
                      20.verticalSpace,
                      Text(
                        "AKPATA",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Palette.primary),
                      ),
                      Spacer(),
                      Text(
                        "Mer, 21 Sept 25",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Palette.foreign,
                            fontSize: 12),
                      ),
                    ],
                  ),
                ),
                20.horizontalSpace,
                Container(
                  padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  height: getHeight(130),
                  width: getWidth(200),
                  decoration: BoxDecoration(
                      border: Border.all(color: Palette.primary),
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                            decoration: BoxDecoration(
                                border: Border.all(color: Palette.primary),
                                borderRadius: BorderRadius.circular(20)),
                            child: Text("culture",
                                style: TextStyle(color: Palette.primary)),
                          ),
                          const Spacer(),
                          Icon(Icons.arrow_forward_ios_outlined,
                              size: 15, color: Palette.primary)
                        ],
                      ),
                      20.verticalSpace,
                      Text(
                        "FOUT",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Palette.primary),
                      ),
                      Spacer(),
                      Text(
                        "Mer, 20 Sept 25",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Palette.foreign,
                            fontSize: 12),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Text(
            "Visites d'Aujourd'hui",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Palette.foreign),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Palette.primary),
                        borderRadius: BorderRadius.circular(25),),
                        child:  Row(
                          children: [
                           
                          Text("Van le de",
                                  style: TextStyle(color: Palette.primary,fontWeight: FontWeight.bold)),
            
                          const Spacer(),
            
                                 Container(
                              padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Palette.primary),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text("culture",
                                  style: TextStyle(color: Palette.primary)),
                            ),
                          ],
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Palette.primary),
                        borderRadius: BorderRadius.circular(25),),
                        child:  Row(
                          children: [
                           
                          Text("Van le de",
                                  style: TextStyle(color: Palette.primary,fontWeight: FontWeight.bold)),
            
                          const Spacer(),
            
                                 Container(
                              padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Palette.primary),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text("culture",
                                  style: TextStyle(color: Palette.primary)),
                            ),
                          ],
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Palette.primary),
                        borderRadius: BorderRadius.circular(25),),
                        child:  Row(
                          children: [
                           
                          Text("Van le de",
                                  style: TextStyle(color: Palette.primary,fontWeight: FontWeight.bold)),
            
                          const Spacer(),
            
                                 Container(
                              padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Palette.primary),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text("culture",
                                  style: TextStyle(color: Palette.primary)),
                            ),
                          ],
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Palette.primary),
                        borderRadius: BorderRadius.circular(25),),
                        child:  Row(
                          children: [
                           
                          Text("Van le de",
                                  style: TextStyle(color: Palette.primary,fontWeight: FontWeight.bold)),
            
                          const Spacer(),
            
                                 Container(
                              padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Palette.primary),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text("culture",
                                  style: TextStyle(color: Palette.primary)),
                            ),
                          ],
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Palette.primary),
                        borderRadius: BorderRadius.circular(25),),
                        child:  Row(
                          children: [
                           
                          Text("Van le de",
                                  style: TextStyle(color: Palette.primary,fontWeight: FontWeight.bold)),
            
                          const Spacer(),
            
                                 Container(
                              padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Palette.primary),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text("culture",
                                  style: TextStyle(color: Palette.primary)),
                            ),
                          ],
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Palette.primary),
                        borderRadius: BorderRadius.circular(25),),
                        child:  Row(
                          children: [
                           
                          Text("Van le de",
                                  style: TextStyle(color: Palette.primary,fontWeight: FontWeight.bold)),
            
                          const Spacer(),
            
                                 Container(
                              padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Palette.primary),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text("culture",
                                  style: TextStyle(color: Palette.primary)),
                            ),
                          ],
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Palette.primary),
                        borderRadius: BorderRadius.circular(25),),
                        child:  Row(
                          children: [
                           
                          Text("Van le de",
                                  style: TextStyle(color: Palette.primary,fontWeight: FontWeight.bold)),
            
                          const Spacer(),
            
                                 Container(
                              padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Palette.primary),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text("culture",
                                  style: TextStyle(color: Palette.primary)),
                            ),
                          ],
                        ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
