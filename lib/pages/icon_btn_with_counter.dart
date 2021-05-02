import 'package:flutter/material.dart';
// import 'package:socialfoody/models/user.dart';



class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter({
    Key key,
    @required this.icon,
    @required this.press,
  }) : super(key: key);

  final IconData icon;

  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: press,
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Positioned(
              child: Container(
                  padding: EdgeInsets.all(10.0),
                  height: 46,
                  width: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Row(
                      children: [
                        Icon(
                          this.icon,
                        ),
                      ]
                  )
              ),
          ),










        ],
      ),
    );
  }
}