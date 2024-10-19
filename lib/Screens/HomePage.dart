import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:studentinfohub/Others/BottomNavigation.dart';
import 'package:studentinfohub/Screens/AddStudent.dart';
import 'package:studentinfohub/Screens/StudentList.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<String> imgList = [
    'assets/Slider_image0.jpg',
    'assets/Slider_image1.jpg',
    'assets/Slider_image2.jpg',
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 1:
      /*Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserLogin()),
        );*/
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 3:
        HomePage();
        break;
    }
  }

  Widget _buildDrawerItem(
      {required IconData icon, required String text, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(text),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Theme.of(context).primaryColor,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Student HUB',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontStyle: FontStyle.italic,
          shadows: [Shadow(
            blurRadius: 3.0,
            color: Colors.black45,
            offset: Offset(2, 2),
          )]),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: IconButton(
              icon: Icon(Icons.info_outline),
              onPressed: () {
                /*Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );*/
              },
            ),
          ),
          /*Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: IconButton(onPressed: () {
              /*Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );*/
            }, icon: Icon(Icons.person_outline)),
          ),*/
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Slider_image3.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Student Info Hub',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            _buildDrawerItem(
              icon: Icons.home,
              text: 'Home',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            _buildDrawerItem(
              icon: Icons.info,
              text: 'About Us',
              onTap: () {},
            ),
            _buildDrawerItem(
              icon: Icons.share,
              text: 'Share',
              onTap: () {},
            ),
            _buildDrawerItem(
              icon: Icons.star,
              text: 'Rate Us',
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CarouselSlider(items: imgList.map((item){
                  return GestureDetector(
                    onTap: (){
                      //Navigate on tap
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                            image:AssetImage(item),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }).toList(), options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 5),
                  enableInfiniteScroll: true,
                  aspectRatio: 2.0,
                )),
              ),
            ],
          ),
          Container(
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.blue[400]
            ),
            child: TextButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AddStudent()));
            }, child: Text("New Registration",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),)),
          ),
          Expanded(
            child: StudentList(),  // Display the list of students here
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
    );
  }
}
