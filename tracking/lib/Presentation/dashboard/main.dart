part of '../../core/cores.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    Items(),
    Center(
      child: Text(
        'Index 1: Profile',
        // style: optionStyle,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0
          ? AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              backgroundColor: Palette.primary,
              title: const Text(
                "Tableau de bord",
                style: TextStyle(color: Palette.white, fontSize: 17),
              ),
              leading: const CircleAvatar(
                backgroundColor: Palette.white,
                backgroundImage: AssetImage("assets/jpg/pp.jpg"),
                // radius: 5,
                minRadius: 5,
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_outlined,
                      color: Palette.white,
                    ))
              ],
            )
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
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              backgroundColor: Palette.primary,
              shape: const CircleBorder(),
              child: const Icon(
                Icons.add,
                color: Palette.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.addRecencement);
              },
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Palette.white,
        elevation: 10,
        unselectedItemColor: Palette.contentPrimary,
        selectedItemColor: Palette.primary,
        selectedLabelStyle: const TextStyle(color: Palette.primary),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_rounded),
            label: 'Tableau de bord ',
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
