import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppbar extends StatefulWidget with PreferredSizeWidget {
  Function f;
  CustomAppbar({Key? key, required this.f}) : super(key: key);

  @override
  _CustomAppbarState createState() => _CustomAppbarState();

  @override
  Size get preferredSize => Size.fromHeight(200);
}

class _CustomAppbarState extends State<CustomAppbar>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController controller2;
  late Animation<double> t;

  @override
  void initState() {
    controller =
        new AnimationController(vsync: this, duration: Duration(seconds: 1));
    controller2 =
        new AnimationController(vsync: this, duration: Duration(seconds: 3));
    t = Tween<double>(begin: 0, end: 1).animate(controller2);
    controller.repeat();
    controller2.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      clipBehavior: Clip.hardEdge,
      child: AppBar(
          elevation: 0.0,
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                widget.f();
              },
              icon: Icon(Icons.menu)),
          actions: [_SearchBar()],
          flexibleSpace: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Container(
              child: _userInfo(controller, t),
              padding: EdgeInsets.only(top: widget.preferredSize.height / 3),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: <Color>[
                    Theme.of(context).accentColor,
                    Theme.of(context).primaryColor,
                  ]),
            ),
          )),
    );
  }
}

_userInfo(AnimationController controller, t) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      //circle avatar
      AnimatedBuilder(
          animation: controller.view,
          builder: (context, child) {
            return Container(
              height: 150,
              width: 150,
              child: Stack(alignment: Alignment.center, children: [
                Transform.rotate(
                  angle: controller.value * 2 * 3.14,
                  child: ShaderMask(
                    shaderCallback: (rect) {
                      return SweepGradient(
                              startAngle: 0.0,
                              endAngle: 3.14 * 2,
                              stops: [0.8, 0.8],
                              center: Alignment.center,
                              colors: [Colors.blueAccent, Colors.transparent])
                          .createShader(rect);
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: SvgPicture.asset(
                      'assets/images/undraw_male_avatar_323b.svg'),
                )
              ]),
            );
          }),
      //user Information
      FadeTransition(
        opacity: t,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Akshith Madhur",
              style: TextStyle(fontSize: 32),
            ),
            Text("Flutter Developer", style: TextStyle(fontSize: 18))
          ],
        ),
      ),
    ],
  );
}

class _SearchBar extends StatefulWidget {
  _SearchBar({Key? key}) : super(key: key);

  @override
  __SearchBarState createState() => __SearchBarState();
}

class __SearchBarState extends State<_SearchBar> {
  bool isOpen = false;
  FocusNode f = FocusNode();
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      width: isOpen ? MediaQuery.of(context).size.width * 0.8 : 56,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isOpen ? Colors.white : Colors.transparent,
      ),
      child: Row(
        children: [
          Expanded(
              child: Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            padding: EdgeInsets.only(left: 16),
            child: isOpen
                ? TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: "Search",
                      border: InputBorder.none,
                    ),
                    onSubmitted: (_) {
                      f.unfocus();
                      setState(() {
                        isOpen = !isOpen;
                      });
                    },
                  )
                : null,
          )),
          AnimatedContainer(
            duration: Duration(seconds: 1),
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(isOpen ? 32 : 0),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(isOpen ? 32 : 0),
                  bottomRight: Radius.circular(0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(Icons.search,
                      color: isOpen
                          ? Theme.of(context).primaryColor
                          : Colors.white),
                ),
                onTap: () {
                  setState(() {
                    isOpen = !isOpen;
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
