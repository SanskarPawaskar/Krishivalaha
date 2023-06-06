
import 'package:flutter/material.dart';


class CropPerdictionResult extends StatefulWidget {

  final dynamic snapshot;
  const CropPerdictionResult(this.snapshot,{Key? key}) : super(key: key);
  

  @override
  State<CropPerdictionResult> createState() => _CropPerdictionResultState();
}

class _CropPerdictionResultState extends State<CropPerdictionResult> {
var size,height,width;
  @override
  Widget build(BuildContext context) {
    // getting the size of the window
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    final List<dynamic> items = widget.snapshot.data.links;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF2FFBB),
      
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      margin:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      child: Text(
                        'Crop Name: ${widget.snapshot.data.cropname}',
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            // fontFamily: 'Quicksand',
                            color: Color(0xff004B20),
                            decoration: TextDecoration.underline),
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: const Color(0xff004B20), width: 3)),
                width: width/2+width/4,
                height: 182,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: Image.network(
                    // 'https://media.istockphoto.com/id/153737841/photo/rice.jpg?s=1024x1024&w=is&k=20&c=x7EkgZuuESwrs4NuHxX5rEzAHP9uwPij9l5AnKUOYWg=',
                    '${widget.snapshot.data.detail['image']}',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "Description",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            // fontFamily: 'Quicksand',
                            color: Color(0xff004B20),
                            decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${widget.snapshot.data.detail['Decription']}',
                    style:
                        const TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                    overflow: TextOverflow.visible,
                  ),
                ]),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff004B20)),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                width: width-20,
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [ 
                    const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Resources",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                  // fontFamily: 'Quicksand',
                                  color: Color(0xff004B20),
                                  decoration: TextDecoration.underline),
                        
                      ),
                          ),
                      // const SizedBox(
                      //   height: 15,
                      // ),
                      SizedBox(height: 300,child: MyListView(items: items),),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


class MyListView extends StatelessWidget {
  final List<dynamic> items;

  const MyListView({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          title: Text(item),
          onTap: () {
            // Handle item tap here
          },
        );
      },
    );
  }
}


