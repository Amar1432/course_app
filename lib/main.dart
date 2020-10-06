import 'package:course_app/constants.dart';
import 'package:course_app/details_screen.dart';
import 'package:course_app/model/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
//This is first Comment
void main() {
  runApp(MyApp());
}
// change made by randheer
class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Course App',
      theme: ThemeData(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var th = mediaQuery.height * 0.01225;
    var tw = mediaQuery.width * 0.02314;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: th * 5, horizontal: tw * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SvgPicture.asset("assets/icons/menu.svg"),
                Image.asset("assets/images/user.png")
              ],
            ),
            SizedBox(height: th * 3),
            Text(
              "Hey Amar,",
              style: kHeadingextStyle,
            ),
            Text(
              "Find a course you want to learn",
              style: kSubheadingextStyle,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: th * 3),
              padding: EdgeInsets.symmetric(horizontal: tw*2, vertical: th*1.6),
              height: th*6,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Color(0xFFF5F5F7)),
              child: Row(
                children: <Widget>[
                  SvgPicture.asset("assets/icons/search.svg"),
                  SizedBox(width: tw*1.6),
                  Text(
                    "Search for anything",
                    style: TextStyle(
                      color: Color(0xFFA0A5BD),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Categories", style: kTitleTextStyle),
                Text(
                  "See All",
                  style: kSubtitleTextStyle.copyWith(color: kBlueColor),
                )
              ],
            ),
            SizedBox(height: th*3),
            Expanded(
              child: StaggeredGridView.countBuilder(
                padding: EdgeInsets.all(0),
                crossAxisCount: 2,
                itemCount: categories.length,
                crossAxisSpacing: tw*2,
                mainAxisSpacing: th*2,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: th*2,horizontal: tw*2),
                      height: index.isEven ? th*20 : th*24,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(categories[index].image),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(categories[index].name, style: kTitleTextStyle),
                          Text(
                            "${categories[index].numOfCourses} Courses",
                            style:
                                TextStyle(color: kTextColor.withOpacity(0.5)),
                          )
                        ],
                      ),
                    ),
                  );
                },
                staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
