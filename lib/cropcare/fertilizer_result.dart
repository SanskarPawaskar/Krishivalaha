import 'package:flutter/material.dart';

class FertilizerResult extends StatefulWidget {
  final dynamic snapshot;
  const FertilizerResult(this.snapshot, {Key? key}) : super(key: key);

  @override
  State<FertilizerResult> createState() => _FertilizerResultState();
}

class _FertilizerResultState extends State<FertilizerResult> {
  var size, height, width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF2FFBB),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        child: Text(
                          '${widget.snapshot.data.modules['heading']}',
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            // fontFamily: 'Quicksand',
                            color: Color(0xff004B20),
                          ),
                        )),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff004B20)),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  width: width - 40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Prevention Measure",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              // fontFamily: 'Quicksand',
                              color: Color(0xff004B20),
                              decoration: TextDecoration.underline),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${widget.snapshot.data.modules['Description']}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.normal),
                          overflow: TextOverflow.visible,
                        ),
                      ),
                      const SizedBox(height: 10),
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


//  const SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Column(children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: const [
//                       Text(
//                         "Description",
//                         style: TextStyle(
//                             fontSize: 30,
//                             fontWeight: FontWeight.w600,
//                             // fontFamily: 'Quicksand',
//                             color: Color(0xff004B20),
//                             decoration: TextDecoration.underline),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     '${widget.snapshot.data.modules}',
//                     style:
//                         const TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
//                     overflow: TextOverflow.visible,
//                   ),
//                 ]),
//               ),