import 'package:flutter/material.dart';
import 'calcu.dart';
void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false,
      home: const Splitbill()));
}
class Splitbill extends StatefulWidget {
  const Splitbill({Key? key}) : super(key: key);

  @override
  State<Splitbill> createState() => _SplitbillState();
}

class _SplitbillState extends State<Splitbill> {
double slidervalue=0;
String cal='';
String total ='';
int tip=0;
button(String s){
  return 
    Expanded(
      child: OutlinedButton(
          onPressed: (){
            setState(() {
              if(s=='-'){
                total='';
              }
              else{
                total=total+s;
              }

            });
          },
          child: Text(s,
            style: TextStyle(fontSize: 50,color: Colors.brown),)
      ),
    );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: SingleChildScrollView(
          child: Column(
            children: [
              Align(alignment:Alignment.centerLeft,
          child: Text('Split Bill',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),)),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 110,
                  width: double.maxFinite,
                  decoration: BoxDecoration(color: Colors.yellow),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Total',style:
                              TextStyle(
                                fontSize: 25,fontWeight: FontWeight.w600,
                              ),),
                            SizedBox(height: 2,),
                            Text('${total}',
                              style:TextStyle(
                                fontSize: 20,fontWeight: FontWeight.w700,
                              ) ,)

                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 200),
                          child: Row(
                            children: [
                              Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Friends',style: TextStyle(
                                  fontSize: 15,fontWeight: FontWeight.w700,
                                ),),
                                SizedBox(height: 3,),
                                Text('Tax ',style: TextStyle(fontSize: 15,
                                    fontWeight: FontWeight.w700
                                ),),
                                SizedBox(height: 3,),
                                Text('Tip ',
                                  style: TextStyle(fontSize: 15,
                                fontWeight: FontWeight.w700
                                ),
                                )
                              ],),SizedBox(width: 8,),
                              Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${slidervalue.round()}',
                                    style: TextStyle(fontSize: 15,
                                        fontWeight: FontWeight.w700
                                    ),
                                  ),
                                  Text('\$${cal}%',style: TextStyle(
                                    fontSize: 15,fontWeight: FontWeight.w700,
                                  ),),
                                  Text('\$${tip}',
                                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text('How Many Friends ?',style: TextStyle(
                fontSize: 20,fontWeight: FontWeight.w700,
              ),),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Slider(divisions: 20,min: 0,max: 20,
                  activeColor: Colors.yellow,inactiveColor: Colors.grey,
                  value: slidervalue, onChanged:(value) {
                  setState(() {
                    slidervalue=value;
                  });

                },),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.yellow,),
                        height:100,
                        width: double.maxFinite,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                                    FloatingActionButton(backgroundColor: Colors.grey,
                                      onPressed: () {
                                        setState(() {
                                          if(tip>0){
                                            tip--;
                                          }}
                                        );
                                      },
                                      child: Icon(Icons.remove,color: Colors.black,),
                                    ),

                                    Column(
                                      children: [
                                        Text('Tip',
                                          style: TextStyle(fontSize: 20,
                                              fontWeight: FontWeight.w900
                                        ),),
                                        SizedBox(height: 20,),
                                        Text('\$${tip}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900
                                        ),),
                                      ],

                                    ),

                              FloatingActionButton(backgroundColor: Colors.grey,
                                onPressed: () {
                                setState(() {
                                  tip++;
                                });
                              },
                                child: Icon(Icons.add,color: Colors.black,),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                        color: Colors.yellow,),
                        height: 105,
                        width: double.maxFinite,

                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: TextField(onChanged: (value) {
                                setState(() {
                                  cal=value;

                                });
                              },
                              decoration: InputDecoration(contentPadding: EdgeInsets.symmetric(vertical: 36),
                                label: Text('Tax in %',
                                  style: TextStyle(fontSize: 25,
                                      fontWeight: FontWeight.normal),),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))
                              ),

                          ),
                            )],

                        ),
                      ),
                    )
                  ],
                ),
              ),SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            button('1'),
                            button('2'),
                            button('3'),
                          ],
                        ),

                        Row(
                          children: [
                            button('4'),
                            button('5'),
                            button('6'),
                          ],
                        ),

                        Row(
                          children: [
                            button('7'),
                            button('8'),
                            button('9'),
                          ],
                        ),

                        Row(
                          children: [
                            button('.'),
                            button('0'),
                            button('-'),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(height: 50,
                  width: double.maxFinite,
                  color: Colors.green,
                  child: TextButton(onPressed: (){
                    Navigator.push(
                      context, MaterialPageRoute(
                        builder: (context)=>Friends(slidervalue,total,tip,cal)
                  ),
                  );
                  }, child: Text('SPLIT BILL',style: TextStyle(
                    fontSize: 20,
                    color: Colors.black
                  ),)),
                ),
              ),

            ],),
        ),


    );
  }
}
