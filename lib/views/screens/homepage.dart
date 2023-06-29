import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../class/allClass.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> imsertformKey = GlobalKey<FormState>();
  String date = DateTime.now().toString().split(" ")[0];

  String? name;

  TextEditingController nameController = TextEditingController();

  File? _image;
  ImagePicker pick = ImagePicker();

  getImageFromCamera() async {
    XFile? xfile = await pick.pickImage(source: ImageSource.camera);
    String path = xfile!.path;
    setState(() {
      _image = File(path);
    });
  }

  getImageFromGallery() async {
    XFile? xfile = await pick.pickImage(source: ImageSource.gallery);
    String path = xfile!.path;
    setState(() {
      _image = File(path);
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Order Delivery",
            style: TextStyle(
                letterSpacing: 2, fontSize: SizeConfig.screenHeight * 0.025, fontWeight: FontWeight.w400)),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding:  EdgeInsets.only(left: getProportionateScreenHeight(10), right: getProportionateScreenHeight(10), top: getProportionateScreenHeight(10)),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(getProportionateScreenHeight(13),),
                ),
                child: Padding(
                  padding:  EdgeInsets.all(getProportionateScreenHeight(8)),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: SizeConfig.screenHeight * .150,
                        width: SizeConfig.screenWidth * .300,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(getProportionateScreenHeight(12),),
                        ),
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(10),
                      ),
                      Column(
                        children: [
                          Container(
                            width: SizeConfig.screenWidth * .300,
                            child: Text(
                              "Item : $index",
                              style: TextStyle(fontSize: SizeConfig.screenHeight * 0.022),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FloatingActionButton.extended(
                            onPressed: () {
                              showModalBottomSheet<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return Padding(
                                    padding:  EdgeInsets.all(getProportionateScreenHeight(8)),
                                    child: Container(
                                      height: SizeConfig.screenHeight * .350,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(getProportionateScreenHeight(30),),
                                            topLeft: Radius.circular(getProportionateScreenHeight(30),)),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              IconButton(onPressed: () {
                                                if(_image != null) {
                                                  _image = null;
                                                  Navigator.of(context).pop();
                                                } else {
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                      SnackBar(
                                                          content: Text('Please Submit Report...'),
                                                          backgroundColor: Colors.green,
                                                          elevation: 10,
                                                          behavior: SnackBarBehavior.floating,
                                                          margin: EdgeInsets.all(5),
                                                  ),);
                                                }
                                              }, icon: Icon(Icons.done_outline_rounded,size: SizeConfig.screenHeight * 0.028,color: Colors.green,)),
                                            ],
                                          ),
                                          Text("Item : $index"),
                                          SizedBox(height: getProportionateScreenHeight(10),),
                                          StatefulBuilder(
                                              builder: (context, builder) {
                                                return Card(
                                                  elevation: 5,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(getProportionateScreenHeight(100))),
                                                  child:(_image != null) ?
                                                  CircleAvatar(
                                                    radius: 55,
                                                    backgroundImage: (_image != null)
                                                        ? FileImage(_image!)
                                                        : null,
                                                  ) : CircleAvatar(
                                                    radius: 55,
                                                    backgroundColor: Colors.white,
                                                    child: Icon(Icons.add_a_photo_outlined),
                                                  ),
                                                );
                                              }
                                          ),
                                          SizedBox(height: getProportionateScreenHeight(10),),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Card(
                                                  elevation: 3,
                                                  child: TextButton(
                                                      onPressed: () {
                                                        getImageFromCamera();
                                                        setState(() {

                                                        });
                                                      },
                                                      child: Text(
                                                        "Camera",
                                                        style: TextStyle(
                                                            letterSpacing: 2,
                                                            fontSize: SizeConfig.screenHeight * 0.020,),
                                                      ))),
                                              SizedBox(width: getProportionateScreenWidth(20),),
                                              Card(
                                                  elevation: 3,
                                                  child: TextButton(
                                                      onPressed: () {
                                                        getImageFromGallery();
                                                        setState(() {

                                                        });
                                                      },
                                                      child: Text(
                                                        "Gallery",
                                                        style: TextStyle(
                                                            letterSpacing: 2,
                                                            fontSize: SizeConfig.screenHeight * 0.020),
                                                      ))),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            backgroundColor: Colors.blue[400],
                            icon: Icon(Icons.add),
                            label: Text(
                              "Report",
                              style: TextStyle(fontSize: SizeConfig.screenHeight * 0.015,),
                            ),
                          ),
                        ],
                      ),
                      // IconButton(onPressed: () {}, icon: Icon(Icons.report,color: Colors.green,size: 30,))
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
