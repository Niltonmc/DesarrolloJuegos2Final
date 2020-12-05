import 'package:flutter/material.dart';
import 'package:awesome_card/awesome_card.dart';
import 'package:flutter_final_exam/features/wallet_screen.dart';
import 'package:flutter_final_exam/features/card_data_screen.dart';
import 'package:flutter_final_exam/global/custom_color.dart';
import 'package:flutter_final_exam/model/item_card.dart';

class CardsScreen extends StatefulWidget {
  @override
  _CardsScreenState createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {

  List<ItemCard> cards;

  @override
  void initState() {
    cards = new List<ItemCard>();
    cards.add(new ItemCard(name: 'MasterCard',imagePath: 'image10'));
    cards.add(new ItemCard(name: 'Visa',imagePath: 'image11'));
    cards.add(new ItemCard(name: 'JCB',imagePath: 'image12'));
    cards.add(new ItemCard(name: 'American Express',imagePath: 'image13'));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
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
                              image: AssetImage('assets/images/image9.png'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40))),
                    ),
                    Column(
                      children: [
                        Text('CREDIT',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: CustomColor.white,
                                fontSize: 40,
                                fontStyle: FontStyle.italic)),
                        Text('CARD',
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
                      SizedBox(height: 20),
                      ListView.separated(
                        itemCount: cards.length,
                        separatorBuilder: (context, i) => const Divider(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, i) {
                          return ItemCardModel(
                              name: cards[i].name,
                              imagePath: cards[i].imagePath);
                        },
                      ),
                      SizedBox(height: 30),
                      GestureDetector(
                        child: Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: MediaQuery.of(context).size.width * 0.95,
                          decoration: BoxDecoration(
                            color: CustomColor.blue4c,
                            borderRadius: BorderRadius.circular(55),
                          ),
                          child: Text(
                            'ADD CARD',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: CustomColor.white),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CardDataScreen()));
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
