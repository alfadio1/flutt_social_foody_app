import 'package:flutter/material.dart';



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









          // if (numOfitem != 0)
          // Positioned(
          //   top: -3,
          //   right: 0.5,
          //   child: Container(
          //     height: (16),
          //     width: (16),
          //     decoration: BoxDecoration(
          //       color: Color(0xFFFF4848),
          //       shape: BoxShape.circle,
          //       border: Border.all(width: 1.5, color: Colors.white),
          //     ),
          //     child: Center(
          //       child: Text(
          //         "Alpha ",
          //         style: TextStyle(
          //           fontSize: (10),
          //           height: 1,
          //           fontWeight: FontWeight.w600,
          //           color: Colors.white,
          //         ),
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}