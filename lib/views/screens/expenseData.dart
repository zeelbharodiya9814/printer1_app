import 'package:flutter/material.dart';

import 'expense.dart';

class ExpenseData extends StatefulWidget {
  const ExpenseData({Key? key}) : super(key: key);

  @override
  State<ExpenseData> createState() => _ExpenseDataState();
}

class _ExpenseDataState extends State<ExpenseData> {
  @override
  Widget build(BuildContext context) {
    // List data = ModalRoute.of(context)!.settings.arguments as List;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Expenses Data",
            style: TextStyle(
                letterSpacing: 2, fontSize: 23, fontWeight: FontWeight.w400)),
        centerTitle: true,
      ),
      body:

      (AllData.isNotEmpty) ?
            ListView.builder(
              itemCount: AllData.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.only(left: 15,top: 15,right: 15),
                  child: Container(
                    // width: 200,
                    // height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Date :  ",style: TextStyle(letterSpacing: 1,fontSize: 20,fontWeight: FontWeight.w600),),
                              SizedBox(height: 3,),
                              Text("Category :  ",style: TextStyle(letterSpacing: 1,fontSize: 20,fontWeight: FontWeight.w600)),
                              SizedBox(height: 3,),
                              Text("Contact :  ",style: TextStyle(letterSpacing: 1,fontSize: 20,fontWeight: FontWeight.w600)),
                              SizedBox(height: 3,),
                              Text("Amount :  ",style: TextStyle(letterSpacing: 1,fontSize: 20,fontWeight: FontWeight.w600)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${AllData[i]['date']}",style: TextStyle(letterSpacing: 1,fontSize: 20,fontWeight: FontWeight.w400,color: Colors.grey[700]),),
                              SizedBox(height: 3,),
                              Text("${AllData[i]['category']}",style: TextStyle(letterSpacing: 1,fontSize: 20,fontWeight: FontWeight.w400,color: Colors.grey[700])),
                              SizedBox(height: 3,),
                              Text("${AllData[i]['number']}",style: TextStyle(letterSpacing: 1,fontSize: 20,fontWeight: FontWeight.w400,color: Colors.grey[700])),
                              SizedBox(height: 3,),
                              Text("${AllData[i]['amount']}",style: TextStyle(letterSpacing: 1,fontSize: 20,fontWeight: FontWeight.w400,color: Colors.grey[700])),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              })
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                  "assets/images/no-data.png",
                  height: 90,
            ),
                  Text("No data found..."),
                ],
              )),
    );
  }
}