part of '../../core/cores.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;
  User? user; // Variable pour stocker les infos utilisateur


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  void initState() {
    super.initState();
    _loadUserData(); // Charger les infos utilisateur à l'initialisation
  }

  // Méthode pour charger les infos utilisateur depuis SharedPreferences
  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString('user_info');

    if (userJson != null) {
      setState(() {
        user = User.fromJson(
            jsonDecode(userJson)); // Stocker les infos dans la variable
          
      });

    }
  }

  static const List<Widget> _widgetOptions = <Widget>[
    Items(),
    Center(
      child: Text(
        'Index 1: Autres',
        // style: optionStyle,
      ),
    ),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0
          ? user == null ? null : PreferredSize(
              preferredSize: const Size(
                double.infinity,
                100,
              ),
              child: Container(
                color: Palette.primary,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 40, 15, 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage("assets/jpg/pp.jpg"),
                            radius: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                           Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user!.name,
                                style: const TextStyle(
                                    color: Palette.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18),
                              ),
                              const Text(
                                "Bienvenu !",
                                style: TextStyle(
                                    color: Palette.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12),
                              )
                            ],
                          ),
                          const Spacer(),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                color: Palette.white,
                              ),
                            ),
                            child: Stack(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.notifications_none_outlined,
                                    size: 20,
                                    color: Palette.white,
                                  ),
                                ),
                                const Positioned(
                                  right: 15,
                                  left: 15,
                                  top: 10,
                                  child: CircleAvatar(
                                    backgroundColor: Palette.danger,
                                    radius: 5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          12.horizontalSpace,
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                color: Palette.white,
                              ),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.sync_sharp,
                                size: 20,
                                color: Palette.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ))
          : AppBar(
              backgroundColor: Palette.white,
              leading: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesName.main);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Palette.primary,
                ),
              ),
              centerTitle: true,
              title: const Text(
                "Profile",
                key: Key('profile'),
                style: TextStyle(color: Palette.primary, fontSize: 17),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit_outlined,
                    color: Palette.primary,
                  ),
                )
              ],
            ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Palette.white,
        elevation: 10,
        unselectedItemColor: Palette.contentPrimary,
        selectedItemColor: Palette.primary,
        selectedLabelStyle: const TextStyle(color: Palette.primary),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_rounded),
            label: 'Bord ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.online_prediction_sharp),
            label: 'Autres',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
