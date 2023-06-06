import 'package:flutter/material.dart';


class PestResult extends StatefulWidget {
  final dynamic snapshot;
  const PestResult(this.snapshot,{Key? key}) : super(key: key);

  @override
  State<PestResult> createState() => _PestResultState();
}

class _PestResultState extends State<PestResult> {
  var size,height,width;
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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                        margin:
                            const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                        child: Text(
                          '${widget.snapshot.data['Description']}',
                          style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              // fontFamily: 'Quicksand',
                              color: Color(0xff004B20),
                              ),
                        overflow: TextOverflow.visible,
                        )),
                  ),
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
                    '${widget.snapshot.data['image']}',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [ 
                  const Padding(
                          padding: EdgeInsets.all(8.0),
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
                      '${widget.snapshot.data['Prevention']}',
                      style:
                          const TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                      overflow: TextOverflow.visible,
                                    ),
                    ),
                    const SizedBox(height:10),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
