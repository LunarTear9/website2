import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website/appbar.dart';
import 'package:website/feedback.dart';

void main() {
  runApp(MyApp());
}
dynamic Color1 = Color.fromRGBO(10, 167, 133, 1.0);

bool ClickedFlag = true;
bool visible1 = false;
bool visible2 = false;
bool visible3 = false;
bool visible4 = false;
bool visible5 = false;
Widget CustomWidget = SizedBox();
Color TextColor = Colors.black;
class MyApp extends StatelessWidget {
  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: '/second',
        builder: (context, state) => feedback(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}

 class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _HomeScreenState extends State<HomeScreen> {
  @override
  
  Widget build(BuildContext context) {
   final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    print(screenWidth);
    print(screenHeight);
    
        return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      drawer: Drawer(
        backgroundColor: Color.fromARGB(188, 65, 201, 162),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/assets/icon.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          height: 1000,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFB4E1FF), // Hex color
                Color1,
              ],
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: screenWidth < 700 ? EdgeInsets.only(left: 10.0): EdgeInsets.only(left: 100.0),
                    child:  screenWidth < 700
                        ? Row(children: [
                              InkWell(
                                onTap: () {
                                  _scaffoldKey.currentState?.openDrawer();
                                },
                                child: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(101, 182, 255, 227),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(Icons.menu),
                                ),
                              ),
                              screenWidth > 600 ? SizedBox(
                                width: 120,
                                height: 20,
                              )
                              : SizedBox(
                               
                              ),
                            ],)
                        : Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  _scaffoldKey.currentState?.openDrawer();
                                },
                                child: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(101, 182, 255, 227),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(Icons.menu),
                                ),
                              ),
                              screenWidth > 700 ? SizedBox(
                                width: 120,
                                height: 20,
                              )
                              : SizedBox(
                               
                              ),
                            ],
                          ),
                  ),
                    screenWidth < 700
                      ? Container(child:
                        Expanded(
                          child: Center(
                            child: Image(
                              image: AssetImage('lib/assets/icon.png'),
                              height: 125,
                              width: 125,
                            ),
                          ),
                        ),
                      ) // Empty container as a placeholder
                      : Expanded(
                          child: Center(
                            child: Image(
                              image: AssetImage('lib/assets/icon.png'),
                              height: 125,
                              width: 125,
                            ),
                          ),
                        ),
                     screenWidth < 600
                      ? Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Switch(
                                activeColor: Color.fromARGB(255, 0, 7, 143),
                                activeThumbImage: AssetImage('lib/assets/sky.png'),
                                inactiveThumbImage: AssetImage('lib/assets/cloudy (1).png'),
                                inactiveTrackColor: Colors.lightBlue,
                                value: switchValue,
                                onChanged: (value) {
                                  setState(() {
                                    switchValue = value;

                                    if (!switchValue) {
                                      Color1 = Color.fromRGBO(10, 167, 133, 1.0);
                                    } else {
                                      Color1 = Color.fromRGBO(29, 29, 29, 1);
                                    }
                                  });
                                },
                              ),
                            ),
                            Visibility(
                              visible: false,
                              child:Padding(
                              padding: EdgeInsets.only(right: 100),
                              child: MouseRegion(
                                onEnter: (event) {
                                  setState(() {
                                    TextColor = Colors.white;
                                  });
                                },
                                onExit: (event) {
                                  setState(() {
                                    TextColor = Colors.black;
                                  });
                                },
                                child: InkWell(
                                  onTap: () {
                                    // Replace with your navigation method
                                    Navigator.pushNamed(context, '/second');
                                  },
                                  child: Text(
                                    "Feedback",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: TextColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),)
                          ],
                        )
                      : Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 50),
                              child: Switch(
                                activeColor: Color.fromARGB(255, 0, 7, 143),
                                activeThumbImage: AssetImage('lib/assets/sky.png'),
                                inactiveThumbImage: AssetImage('lib/assets/cloudy (1).png'),
                                inactiveTrackColor: Colors.lightBlue,
                                value: switchValue,
                                onChanged: (value) {
                                  setState(() {
                                    switchValue = value;

                                    if (!switchValue) {
                                      Color1 = Color.fromRGBO(10, 167, 133, 1.0);
                                    } else {
                                      Color1 = Color.fromRGBO(29, 29, 29, 1);
                                    }
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 100),
                              child: MouseRegion(
                                onEnter: (event) {
                                  setState(() {
                                    TextColor = Colors.white;
                                  });
                                },
                                onExit: (event) {
                                  setState(() {
                                    TextColor = Colors.black;
                                  });
                                },
                                child: InkWell(
                                  onTap: () {
                                    // Replace with your navigation method
                                    Navigator.pushNamed(context, '/second');
                                  },
                                  child: Text(
                                    "Feedback",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: TextColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 100, right: 100),
                child: Divider(color: Colors.white),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "PROJECTS",
                  style: screenWidth < 600 ?TextStyle(
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black,
                        offset: Offset(5.0, 5.0),
                      ),
                    ],
                    fontSize: 65,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ): TextStyle(
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black,
                        offset: Offset(5.0, 5.0),
                      ),
                    ],
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  print("Tapped");
                },
                child: ProjectItem(
                  text: "Weather App",
                  imagePath: 'lib/assets/background.png',
                  dropdownChild: customContainer(),
                  url: "https://flweather.pitmtech.com",
                  githubUrl: "https://github.com/LunarTear9/Weather-App",
                  icon: Image(image: AssetImage('lib/assets/Dart-logo-icon.svg (1) (1) (1).png')),

                  icon2: Image(image: AssetImage('lib/assets/Flutter_logo.svg (1) (1).png')),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ProjectItem(
                  text: "Car Project",
                  imagePath: 'lib/assets/GT-Sport-03-1080-Main.png',
                  dropdownChild: customContainer(),
                  url: "",
                  githubUrl: "https://github.com/costasphot/car",
                  icon: Image(image: AssetImage('lib/assets/cpp_logo (1).png')),
                  icon2: null,
                ),
              ),
              InkWell(
                onTap: () {},
                child: ProjectItem(
                  text: "Toei Line App",
                  imagePath: 'lib/assets/Toei-Type5522-1.jpg',
                  dropdownChild: customContainer(),
                  
                  url: "https://toei.pitmtech.com",
                  githubUrl: "https://github.com/LunarTear9/japantransportapp",
                  icon: Image(image: AssetImage('lib/assets/Dart-logo-icon.svg (1) (1) (1).png')), 
                  icon2: Image(image: AssetImage('lib/assets/Flutter_logo.svg (1) (1).png')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectItem extends StatefulWidget {
  final String text;
  final String imagePath;
  final Widget dropdownChild;
  final String url;
  final String githubUrl;
  final dynamic icon;
  final dynamic icon2;

  const ProjectItem({
    Key? key,
    required this.text,
    required this.imagePath,
    required this.dropdownChild,
    required this.url,
    required this.githubUrl,
    required this.icon,
    this.icon2,
  }) : super(key: key);

  @override
  _ProjectItemState createState() => _ProjectItemState();
}

class _ProjectItemState extends State<ProjectItem> {
  bool isExpanded = false;

  Future<void> _launchURL() async {
    if(widget.url != "") {
      if (await canLaunch(widget.url)) {
        await launch(widget.url);
      } else {
        throw 'Could not launch ${widget.url}';
      }
    }
   
  }

  

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [Column(
        children: [
          GestureDetector(
            onTap: () {
              _launchURL();
              setState(() {
              
              });
            },
            child: CustomClipRRect(
              text: widget.text,
              imagePath: widget.imagePath,
              url: widget.githubUrl,
              icon: widget.icon,

              icon2: widget.icon2,
              
            ),
          ),
          AnimatedCrossFade(
            duration: Duration(milliseconds: 200),
            firstChild: SizedBox(),
            secondChild: widget.dropdownChild,
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
          ),
          SizedBox(height: 20, width: 20),
        ],
      ),]
    );
  }
}
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
          
          
          ])
      ),
      body: Center(
        child: Column(
          children: [
            Divider(color: Colors.white, height: 20),
            ElevatedButton(
              onPressed: () {
                context.go('/');
              },
              child: Text('Back to Home Screen'),
            ),
          ],
        ),
      ),
    );
  }
}



class CustomClipRRect extends StatefulWidget {
  final String text;
  final String imagePath;
  final String url;
  final dynamic icon;
  final dynamic icon2;

  const CustomClipRRect({
    Key? key,
    required this.text,
    required this.imagePath,
    required this.url,
    required this.icon,
    this.icon2,
  }) : super(key: key);

  @override
  _CustomClipRRectState createState() => _CustomClipRRectState();
}

class _CustomClipRRectState extends State<CustomClipRRect> {
  bool isHovered = false;

Future<void> _launchURL() async {
    if(widget.url != "") {
      if (await canLaunch(widget.url)) {
        await launch(widget.url);
      } else {
        throw 'Could not launch ${widget.url}';
      }
    }
   
  }
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      
      onEnter: (_) => setState(() => ClickedFlag ? isHovered = true : null),
      onExit: (_) => setState(() => ClickedFlag ? isHovered = false : null),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        transform: isHovered ? Matrix4.diagonal3Values(1.05, 1.05, 1) : Matrix4.diagonal3Values(1, 1, 1),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: Color.fromARGB(101, 182, 255, 227),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3), // Outer shadow color
                        blurRadius: 10, // Outer shadow blur radius
                        offset: Offset(1, 2), // Outer shadow offset
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage(widget.imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: ListTile(
                    trailing: InkWell(onTap: (){_launchURL();},child: ClipRRect(borderRadius: BorderRadius.circular(18),child: Container(height: 50,width: 52,color: Color.fromARGB(120, 211, 211, 211),child: Image(image: AssetImage('lib/assets/25231 (1).png'))))),
                    subtitle:  Row(children: [
                      ClipRRect(borderRadius: BorderRadius.circular(19),child: Container(height: 40, width: 40,color: Color.fromARGB(219, 255, 255, 255),child:widget.icon)),
                      Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: 
                      widget.icon2 != null ? ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(height: 40,width: 40,color: Color.fromARGB(217, 255, 255, 255),child: widget.icon2)) : SizedBox(),)
                    ],),
title: Text(
                    widget.text,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      shadows:  [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black,
                          offset: Offset(5.0, 5.0),
                        ),
                      ],
                      fontSize: 30,
                      color: Colors.white,
                    ),

),),
                  height: 100,
                  width: 600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class customContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      
      duration: Duration(milliseconds: 200),
      height: 400,
      width: 500,
      decoration: BoxDecoration(
        color: Color.fromARGB(193, 14, 14, 14),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}