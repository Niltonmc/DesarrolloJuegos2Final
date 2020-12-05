import 'package:awesome_card/awesome_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_exam/global/custom_color.dart';

class CardDataScreen extends StatefulWidget {
  @override
  _CardDataScreenState createState() => _CardDataScreenState();
}

class _CardDataScreenState extends State<CardDataScreen> {
  static Widget mainColor = new Container(
    width: double.maxFinite,
    height: double.maxFinite,
    color: CustomColor.blue4c,
  );

  String cardNumber = "";
  String cvv = "";
  bool showBehindCard = false;
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  FocusNode focusNodeCardNumber = FocusNode();
  FocusNode focusNodeCvv = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    focusNodeCvv.addListener(() {
      if(focusNodeCvv.hasFocus){
        showBehindCard = true;
      }else{
        showBehindCard = false;
      }
      setState(() {

      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                CreditCard(
                    cardHolderName: "NO C BRO",
                    cardExpiry: "12/26",
                    cardNumber: cardNumber,
                    cvv: cvv,
                    showShadow: true,
                    showBackSide: showBehindCard,
                    bankName: "INTERBANK",
                    frontBackground: _CardDataScreenState.mainColor,
                    backBackground: CardBackgrounds.black),
                SizedBox(
                  height: 25,
                ),
                TextField(
//                  controller: cardNumberController,
                  focusNode: focusNodeCardNumber,
                  style: TextStyle(
                    fontSize: 26,
                    color: CustomColor.black,
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,

                  maxLength: 16,

                  decoration: InputDecoration(
                    counterText: "",
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextField(
                  focusNode: focusNodeCvv,
                  //                controller: cvvController,
                  style: TextStyle(
                    fontSize: 25,
                    color: CustomColor.black,
                  ),
                  keyboardType: TextInputType.number,
                  maxLength: 4,

                  decoration: InputDecoration(
                    counterText: "",
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
