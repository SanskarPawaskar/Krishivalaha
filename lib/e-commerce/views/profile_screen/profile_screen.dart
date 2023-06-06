import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communityapp/community/screens/authenticate/login.dart';
import 'package:communityapp/e-commerce/const/consts.dart';
import 'package:communityapp/e-commerce/controllers/auth_controller.dart';
import 'package:communityapp/e-commerce/controllers/profile_controller.dart';
import 'package:communityapp/e-commerce/services/commerce_service.dart';
import 'package:communityapp/e-commerce/views/profile_screen/edit_profile_screen.dart';


import '../../const/lists.dart';
import 'components/details_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    //var controllers = Get.put(AuthController());

    return Scaffold(
        body: StreamBuilder(
            stream: FirestoreServices.getUser(currentUser!.uid),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(redColor),
                  ),
                );
              } else {
                //print('test');
                var data = snapshot.data!.docs;
                // print(data1[0]['name']);

                return SafeArea(
                    child: Column(children: [
                  //edit profile
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Align(
                            alignment: Alignment.topRight,
                            child: Icon(Icons.edit))
                        .onTap(() {
                      Get.to(() => const EditProfileScreen());
                    }),
                  ),

                  //user details section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        Image.asset(imgstud, width: 60, fit: BoxFit.cover)
                            .box
                            .roundedFull
                            .clip(Clip.antiAlias)
                            .make(),
                        10.heightBox,
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "${data[0]['name']}".text.fontFamily(semibold).black.make(),
                            // "Abhishek".text.fontFamily(semibold).black.make(),
                            "${data[0]['email']}".text.black.make(),
                            // "abhishekjadhav364@gmail.com".text.black.make(),
                          ],
                        )),
                        OutlinedButton(
                            onPressed: () async {
                              await Get.put(AuthController())
                                  .signoutMethod(context);
                              Get.offAll(() => Login());
                            },
                            child: logout.text
                                .fontFamily(semibold)
                                .color(Colors.black)
                                .make()),
                      ],
                    ),
                  ),

                  20.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      detailsCard(
                          count: "04",
                          title: "in your cart",
                          width: context.screenWidth / 3.4),
                      detailsCard(
                          count: "00",
                          title: "in your whishlist",
                          width: context.screenWidth / 3.4),
                      detailsCard(
                          count: "00",
                          title: "your orders",
                          width: context.screenWidth / 3.4),
                    ],
                  ),

                  //button section

                  ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return const Divider(color: lightGrey);
                    },
                    itemCount: profileButtonsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Image.asset(
                          profileButtonsIcon[index],
                          width: 22,
                        ),
                        title: profileButtonsList[index]
                            .text
                            .fontFamily(semibold)
                            .color(darkFontGrey)
                            .make(),
                      );
                    },
                  )
                      .box
                      .white
                      .rounded
                      .margin(const EdgeInsets.all(12))
                      .padding(const EdgeInsets.symmetric(horizontal: 16))
                      .shadowSm
                      .padding(const EdgeInsets.symmetric(horizontal: 16))
                      .make(),
                ]));
              }
            }));
  }
}
