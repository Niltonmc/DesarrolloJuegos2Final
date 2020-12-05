import "dart:typed_data";
import "package:flutter/material.dart";
import "package:flutter_final_exam/features/cards_screen.dart";
import 'package:flutter_final_exam/global/custom_color.dart';
import "package:qrscan/qrscan.dart" as scanner;

class WalletScreen extends StatefulWidget {
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  String qrCode = "";
  Uint8List bytes = Uint8List(200);
  bool showBtnTopUp = false;
  
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(

         body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,

        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                fit: StackFit.loose,
                alignment: Alignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.32,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/image1.png"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                  ),
                  Column(
                    children: [
                      Text("DIGITAL",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: CustomColor.white,
                              fontSize: 40,
                              fontStyle: FontStyle.italic)),
                      Text("WALLET",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: CustomColor.white,
                              fontSize: 40,
                              fontStyle: FontStyle.italic)),
                    ],
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: CustomColor.grayF8),
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 30),
                      child: Text(
                        "Balance",
                        style: TextStyle(fontSize: 25,
                            color: CustomColor.black),
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    Container(
                      alignment: Alignment.center,
                      height: 80,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: CustomColor.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        "Rp.76.547.000,-",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: CustomColor.black,
                            fontStyle: FontStyle.italic),
                      ),
                    ),


                    SizedBox(height: 30),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 30),
                      child: Text(
                        "QR Code",
                        style: TextStyle(fontSize: 25,
                        color: CustomColor.black),
                      ),
                    ),

                    SizedBox(
                      height: 2,
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.memory(bytes),
                          ),
                          Text("Result  $qrCode",
                            style: TextStyle(color: CustomColor.black)),

                          RaisedButton(onPressed: _scan, child: Text("Read QR Code", style: TextStyle(color: CustomColor.white)), color: CustomColor.blue4c,),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    showBtnTopUp
                        ? GestureDetector(
                            child: Container(

                              alignment: Alignment.center,
                              height: 65,
                              width: MediaQuery.of(context).size.width * 0.9,
                              decoration: BoxDecoration(
                                color: CustomColor.blue4c,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Text(
                                "TOP UP",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 26,
                                    color: CustomColor.white),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CardsScreen()));
                            },
                          )
                        : Container(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  Future _scan() async {
    String qrCode = await scanner.scan();
    setState(() => this.qrCode = qrCode);
    if(this.qrCode.length > 1){
      showBtnTopUp = true;
    }
  }
}
