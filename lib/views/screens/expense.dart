import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

 List<Map<String , dynamic>> AllData = [];

class Expense extends StatefulWidget {
  const Expense({Key? key}) : super(key: key);

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {

  int? number;
  int? amount;

  TextEditingController numberController = TextEditingController();
  TextEditingController amountController = TextEditingController();



  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String dropdownvalue = 'Travel';

  var items = [
    'Travel',
    'Food',
    'Nozzle Check',
    'Other',
  ];

  static String? dd;

  TextEditingController ddController = TextEditingController(text: dd);

  void _gelDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2050))
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        ddController.text = DateFormat('dd-MM-yyyy').format(pickedDate);
      });
    });
  }

  String? date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Expenses",
            style: TextStyle(
                letterSpacing: 2, fontSize: 23, fontWeight: FontWeight.w400)),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            Navigator.pushNamed(context, 'ExpenseData');
          }, icon: Icon(Icons.library_books))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: TextFormField(
                            controller: ddController,
                            readOnly: true,
                            // textInputAction: TextInputAction.next,
                            onTap: _gelDatePicker,
                            onSaved: (_gelDatePicker) {
                              setState(() {
                                date = _gelDatePicker;
                                print(date);
                              });
                            },
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter date...";
                              }
                            },
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(15),
                                prefixIcon: Icon(
                                  Icons.calendar_month,
                                  color: Colors.blue,
                                ),
                                hintText: "Date",
                                hintStyle: TextStyle(fontSize:19,color: Colors.grey[400]),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  borderSide: BorderSide.none,
                                )),
                          ),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Container(
                    //     width: double.infinity,
                    //     height: 57,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(13),
                    //       border: Border.all(color: Colors.black45),
                    //     ),
                    //     child: Padding(
                    //       padding: const EdgeInsets.only(left: 15.0),
                    //       child: DropdownButton(
                    //         value: dropdownvalue,
                    //         icon: Container(
                    //           width: MediaQuery.of(context).size.width,
                    //           color: Colors.green,
                    //           child: Row(
                    //             // crossAxisAlignment: CrossAxisAlignment.end,
                    //             children: [
                    //               Icon(Icons.keyboard_arrow_down),
                    //             ],
                    //           ),
                    //         ),
                    //         items: items.map((String items) {
                    //           return DropdownMenuItem(
                    //             value: items,
                    //             child: Text(items),
                    //           );
                    //         }).toList(),
                    //         onChanged: (String? newValue) {
                    //           setState(() {
                    //             dropdownvalue = newValue!;
                    //           });
                    //         },
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(left: 13,right: 13,bottom: 13),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: CustomSearchableDropDown(
                            items: items,
                            label: dropdownvalue,
                            labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 18),
                            decoration:  BoxDecoration(
                                color:   Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Colors.transparent,
                                )
                            ),
                            dropDownMenuItems: items?.map((e) {
                              return e;
                            })?.toList() ??
                                [],

                            dropdownBackgroundColor:  Colors.white,
                            suffixIcon: Icon(Icons.arrow_drop_down,color: Colors.blue,),
                            onChanged: (value){
                              setState(() {
                                dropdownvalue = value;
                              });
                              // if(value!=null)
                              // {
                              //   selected = value['class'].toString();
                              // }
                              // else{
                              //   selected=null;
                              // }
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 13,right: 13,bottom: 13),
                      child: TextFormField(
                        controller: numberController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter num...";
                          }
                        },
                        onSaved: (val) {
                          setState(() {
                            number = int.parse(val!);
                          });
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.call,
                              color: Colors.green,
                            ),
                            hintText: "Mobile number",
                            hintStyle: TextStyle(fontSize:19,color: Colors.grey[400]),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13),
                              borderSide: BorderSide.none,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 13,right: 13,bottom: 13),
                      child: TextFormField(
                        controller: amountController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,

                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter amount...";
                          }
                        },
                        onSaved: (val) {
                          setState(() {
                            amount = int.parse(val!);
                          });
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.currency_rupee,
                              color: Colors.green,
                            ),
                            hintText: "Amount",
                            hintStyle: TextStyle(fontSize:19,color: Colors.grey[400]),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13),
                              borderSide: BorderSide.none,
                            )),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              numberController.clear();
                              amountController.clear();
                              ddController.clear();

                              setState(() {
                                number = null;
                                amount = null;
                                date = null;
                                // dropdownvalue = "";
                              });
                            });
                          },
                          child: Card(
                            elevation: 4,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            child: Container(
                              height: 50,
                              width: 100,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.red[500],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text("Cancel",style: TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.w700,letterSpacing: 1)),
                            ),
                          ),
                        ),
                        SizedBox(width: 30,),
                        GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();

                              print(date);
                              print(dropdownvalue);
                              print(number);
                              print(amount);

                              Map<String, dynamic> data = {
                                'date' : date,
                                'category' : dropdownvalue,
                                'number' : number,
                                'amount' : amount,
                              };

                              AllData.add(data);

                              Navigator.pushNamed(context, 'ExpenseData');
                              setState(() {

                              });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Enter All Details..."),
                                  backgroundColor: Colors.red,
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                            }
                            numberController.clear();
                            amountController.clear();
                            ddController.clear();

                            setState(() {
                              number = null;
                              amount = null;
                              date = null;
                              // dropdownvalue = "";
                            });
                          },
                          child: Card(
                            elevation: 4,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            child: Container(
                              height: 50,
                              width: 100,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.green[500],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text("Add",style: TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.w700,letterSpacing: 1)),
                            ),
                          ),
                        ),
                        // OutlinedButton(onPressed: () {}, child: Text("CANCEL",style: TextStyle(color: Colors.red,fontSize: 19),)),
                        // SizedBox(width: 30,),
                        // OutlinedButton(onPressed: () {}, child: Text("ADD",style: TextStyle(color: Colors.green,fontSize: 19),)),
                      ],
                    ),
                    SizedBox(height: 15,),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
