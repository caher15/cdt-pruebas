
import 'package:flutter/material.dart';
import 'package:upload_images/tabPages/advice_tab.dart';
import 'package:upload_images/tabPages/earning_tab.dart';
import 'package:upload_images/tabPages/home_tab.dart';
import 'package:upload_images/tabPages/profile_tab.dart';
import 'package:upload_images/tabPages/ratings_tab.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin{

    TabController? tabController;
    int selectedIndex = 0;

    onItemClocked(int index){
      setState(() {
        selectedIndex = index;
        tabController!.index = selectedIndex;
      });
    }      


    @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: const[
           HomeTabPage(),
           EarningsTabPage(),
           RatingsTabPage(),
           AdviceTabPage(),
          ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "home",
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.monetization_on),
          label: "Pagos"
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.location_on),
          label: "Ubicacion",
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.warning),
          label: "Avisos",
          ),
      ],
        unselectedItemColor: Colors.white54,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontSize: 14),
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        onTap: onItemClocked,
        
      ),

      );
  }
}