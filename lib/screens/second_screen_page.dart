import 'package:flutter/material.dart';
import 'package:flutter_app_gridview/screens/background_second_page.dart';
import 'package:flutter_app_gridview/screens/grideview_page.dart';
 
 class SecondScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackGroundSecondPage(
      child: Center(
        child: Container(
          height: size.height,
          width: double.infinity,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 35.0,
              ),
              Center(
                child: Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w700
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Center(
                child: Container(
                  alignment: Alignment.center,
                  
                    child: Text(
                      'health companion App  Design by  msDesigns for uigate',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ),
              ),
             
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 1.4,
                width: MediaQuery.of(context).size.width / 1.05,
                child: GridViewPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
