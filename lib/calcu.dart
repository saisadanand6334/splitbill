import 'package:flutter/material.dart';
class Friends extends StatefulWidget {
  final double slider;
  final String call;
  final String tot;
  final int tipo;
  Friends(this.slider,this.tot,this.tipo,this.call);
  @override
  State<Friends> createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  double bill=0;
  @override
  void initState() {
    super.initState();
    res();
  }
  void res(){
    double taxamount=(double.parse(widget.tot)*double.parse(widget.call))/100;
    double finalbill=(double.parse(widget.tot)+taxamount+widget.tipo)/widget.slider;
    setState(() {
      bill =finalbill;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
            children: [
              Text('Split bill',style: TextStyle(fontSize: 50),),
            ],
        ),
          ),
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
                    Text('Equally Divided',style:
                    TextStyle(
                      fontSize: 25,fontWeight: FontWeight.w600,
                    ),),
                    SizedBox(height: 6,),
                    Text('\$${bill.toStringAsFixed(2)}',
                      style:TextStyle(
                        fontSize: 20,fontWeight: FontWeight.w700,
                      ) ,)

                  ],
                ),
                SizedBox(
                  width: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Friends',style: TextStyle(
                            fontSize: 20,fontWeight: FontWeight.w700,
                          ),),
                          SizedBox(height: 3,),
                          Text('Tax ',style: TextStyle(fontSize: 18,
                              fontWeight: FontWeight.w700
                          ),),
                          SizedBox(height: 3,),
                          Text('Tip ',
                            style: TextStyle(fontSize: 18,
                                fontWeight: FontWeight.w700
                            ),
                          )
                        ],),SizedBox(width: 8,),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text('${widget.slider}',
                          style: TextStyle(
                            fontSize: 18,fontWeight: FontWeight.w700,
                          ),),

                          Text('${widget.call}',style: TextStyle(
                            fontSize: 18,fontWeight: FontWeight.w700,
                          ),),
                          Text('${widget.tipo}',
                            style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),)
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
          Text('Everybody Should Pay  \$${bill.toStringAsFixed(2)}',style: TextStyle(
            fontSize: 40,fontWeight: FontWeight.w700,
          ),),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(height: 50,
              width: double.maxFinite,
              color: Colors.deepOrange,
              child: TextButton(onPressed: (){Navigator.pop(context);
              //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Splitbill()
              // )
              // );
              }, child: Text('Calculate Again ?',style: TextStyle(
                  fontSize: 20,
                  color: Colors.black
              ),)),
            ),
          ),
    ])
    );
  }
}
