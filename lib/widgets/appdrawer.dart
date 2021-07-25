import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:housy/home_page.dart';

class AppDrawer extends StatefulWidget {
  AppDrawer({Key? key}) : super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  double value = 0;
  handleTap() {
    setState(() {
      print('tapped');
      value = value == 0 ? 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: handleTap,
            child: Stack(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height,
                    width: 300,
                    child: DrawerHeader(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: SvgPicture.asset(
                                  'assets/images/undraw_male_avatar_323b.svg'),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text("Akshith Madhur",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18))
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 2,
                          child: ListView(
                            children: [
                              ListTile(
                                leading: Icon(
                                  Icons.payments,
                                  color: Theme.of(context).primaryColor,
                                  size: 32,
                                ),
                                title: Text(
                                  "Payments",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                ),
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.favorite,
                                  color: Theme.of(context).primaryColor,
                                  size: 32,
                                ),
                                title: Text(
                                  "Discount",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                ),
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.notifications,
                                  color: Theme.of(context).primaryColor,
                                  size: 32,
                                ),
                                title: Text(
                                  "Notifications",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                ),
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.menu_book_outlined,
                                  color: Theme.of(context).primaryColor,
                                  size: 32,
                                ),
                                title: Text(
                                  "Orders",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                ),
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.help,
                                  color: Theme.of(context).primaryColor,
                                  size: 32,
                                ),
                                title: Text(
                                  "Help",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            height: MediaQuery.of(context).size.height / 4,
                            child: ListView(
                              children: [
                                ListTile(
                                  leading: Icon(
                                    Icons.settings,
                                    color: Theme.of(context).primaryColor,
                                    size: 32,
                                  ),
                                  title: Text(
                                    "Settings",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                  ),
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.support,
                                    color: Theme.of(context).primaryColor,
                                    size: 32,
                                  ),
                                  title: Text(
                                    "Support",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ))),
                TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: value),
                    duration: Duration(milliseconds: 500),
                    builder: (context, v, _) {
                      double val = v is double ? v : 0;
                      print(v);
                      return (Transform(
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..setEntry(0, 3, 200 * val),
                          child: HomePage(f: handleTap)));
                    })
              ],
            ),
          )),
    );
  }
}
