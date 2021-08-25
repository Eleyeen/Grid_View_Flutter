import 'package:flutter/material.dart';

class BackGroundSecondPage extends StatelessWidget {
  final Widget child ;

  const BackGroundSecondPage({
     Key  key ,
    @required  this.child, 
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.blueGrey[50],
      height: size.height,
             width: double.infinity,
     child: Stack( 
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
           top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/back.png",

            ),
          ),
          child,
        ],
      ),     
    );
  }
}
