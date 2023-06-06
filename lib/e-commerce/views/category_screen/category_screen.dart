import 'package:communityapp/e-commerce/const/consts.dart';
import 'package:communityapp/e-commerce/const/lists.dart';
import 'package:communityapp/e-commerce/views/category_screen/category_details.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'E-commerce',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        backgroundColor: const Color(0xff004B20),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cart');
              },
              icon: Image.asset(icCart, width: 26)),
        ],
      ),
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: const Color(0xffF1FFBA),
                      border: Border.all(color: const Color(0xff004B20)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  margin: const EdgeInsets.fromLTRB(2, 10, 0, 40),
                  width: 302,
                  // height: 600,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(20, 32, 20, 32),
                    // color: const Color(0xff004B20),
                    // padding: const EdgeInsets.all(30),
                    child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: 6,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 20,
                                mainAxisExtent: 140),
                        itemBuilder: (context, index) {
                          return Container(
                            child: Column(
                              children: [
                                Image.asset(
                                  categoryImages[index],
                                  height: 100,
                                  width: 150,
                                ),
                                10.heightBox,
                                categoriesList[index]
                                    .text
                                    .fontFamily(quicksand)
                                    .size(19)
                                    .fontWeight(FontWeight.bold)
                                    .color(whiteColor)
                                    .align(TextAlign.center)
                                    .make(),
                              ],
                            )
                                .box
                                .white
                                .rounded
                                .clip(Clip.antiAlias)
                                .color(
                                  const Color(0xff004B20),
                                )
                                .shadowSm
                                .make()
                                .onTap(() {
                              // Navigator.push(context, CategoryDetails(title: categoriesList[index]));
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CategoryDetails(
                                          title: categoriesList[index])));
                            }),
                          );
                        }),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                        'assets/images/dashboardimages/bottom_logo.png'),
                    const SizedBox(width: 15),
                    const Text("Krishivalah",
                        style: TextStyle(
                          height: 1,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.w400,
                          fontSize: 40,
                          color: Color(0xff004B20),
                        ))
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
