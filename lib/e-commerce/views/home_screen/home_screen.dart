import 'package:communityapp/e-commerce/const/consts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        /*padding: const EdgeInsets.all(0),
      color: lightGrey,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
          child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PreferredSize(
                preferredSize: const Size.fromHeight(30),
                child: AppBar(
                  title: const Text('Shop'),
                  actions: <Widget>[
                    IconButton(
                        icon: const Icon(Icons.search), onPressed: () {}),
                    IconButton(
                        icon: Icon(Icons.add_shopping_cart_rounded),
                        onPressed: () {}),
                  ],
                ),
              ),
            ],
          ),
          10.heightBox,
          //categories
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  "Categories".text.fontFamily(bold).black.size(30).make(),
                  30.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                        2,
                        (index) => homeButtons(
                            height: context.screenHeight * 0.20,
                            width: context.screenWidth / 2.5,
                            icon: featuredImages1[index],
                            title: featuredTitles1[index])),
                  ),
                  20.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                        2,
                        (index) => homeButtons(
                            height: context.screenHeight * 0.20,
                            width: context.screenWidth / 2.5,
                            icon: featuredImages2[index],
                            title: featuredTitles2[index])),
                  ),
                  20.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                        2,
                        (index) => homeButtons(
                            height: context.screenHeight * 0.20,
                            width: context.screenWidth / 2.5,
                            icon: featuredImages3[index],
                            title: featuredTitles3[index])),
                  ).box.make().onTap(() {})
                  /*SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        2,
                        (index) => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            featureButton(
                                icon: featuredImages1[index],
                                title: featuredTitles1[index]),
                            10.heightBox,
                            //featureButton(icon: featuredImages1[index], title: featuredTitles1[index]),
                          ],
                        ),
                      ).toList(),
                    ),*/
                ],
              ),
            ),
          )
        ],
      )),*/
        );
  }
}
