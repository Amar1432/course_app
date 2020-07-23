import 'package:course_app/components/course_content.dart';
import 'package:course_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var th = mediaQuery.height * 0.01225;
    var tw = mediaQuery.width * 0.02314;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFF5F4EF),
          image: DecorationImage(
            alignment: Alignment.topRight,
            image: AssetImage("assets/images/ux_big.png"),
          ),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: tw*2, top: th*5, right: tw*2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: SvgPicture.asset("assets/icons/arrow-left.svg"),
                      ),
                      SvgPicture.asset("assets/icons/more-vertical.svg")
                    ],
                  ),
                  SizedBox(height: th*3),
                  ClipPath(
                    clipper: BestSellerClipper(),
                    child: Container(
                      color: kBestSellerColor,
                      padding: EdgeInsets.only(
                          left: tw, top: th/2, right: tw*2, bottom: th/2),
                      child: Text(
                        "bestseller".toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text("Design Thinking", style: kHeadingextStyle),
                  SizedBox(height: 16),
                  Row(
                    children: <Widget>[
                      SvgPicture.asset("assets/icons/person.svg"),
                      SizedBox(width: 5),
                      Text("18k"),
                      SizedBox(width: 20),
                      SvgPicture.asset("assets/icons/star.svg"),
                      SizedBox(width: 5),
                      Text("4.8")
                    ],
                  ),
                  SizedBox(height: th*2),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "\$50 ",
                            style: kHeadingextStyle.copyWith(fontSize: 24)),
                        TextSpan(
                          text: "\$70",
                          style: TextStyle(
                              color: kTextColor.withOpacity(0.5),
                              decoration: TextDecoration.lineThrough),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: th*6),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xFFFFFFFF)),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: th*3,vertical: tw*3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Course Content",
                            style: kTitleTextStyle.copyWith(fontSize: 18),
                          ),
                          SizedBox(
                            height: th*3,
                          ),
                          CourseContent(
                            number: "01",
                            duration: 3.25,
                            title: "Welcome to the Course",
                            isDone: true,
                          ),
                          CourseContent(
                            number: "02",
                            duration: 19.25,
                            title: "Design Thinking - Intro",
                            isDone: true,
                          ),
                          CourseContent(
                            number: "03",
                            duration: 15.25,
                            title: "Design Thinking Process",
                          ),
                          CourseContent(
                            number: "04",
                            duration: 5.25,
                            title: "Customer Prespective",
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        height: th*10,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 50,
                              color: kTextColor.withOpacity(0.1),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: th*5.6,
                              padding: EdgeInsets.symmetric(horizontal: th*1.1,vertical: tw*1.1),
                              width: tw*8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Color(0xFFFFEDEE)),
                              child: SvgPicture.asset(
                                  "assets/icons/shopping-bag.svg"),
                            ),
                            SizedBox(width: tw*2),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                height: th*5.6,
                                decoration: BoxDecoration(
                                    color: kBlueColor,
                                    borderRadius: BorderRadius.circular(40)),
                                child: Text(
                                  "Enroll Now",
                                  style: kSubtitleTextStyle.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class BestSellerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width - 20, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - 20, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
