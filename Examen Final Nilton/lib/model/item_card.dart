import 'package:flutter/material.dart';
import 'package:flutter_final_exam/global/custom_color.dart';

class ItemCard{
  String name;
  String imagePath;

  ItemCard({this.name,this.imagePath});
}

class ItemCardModel extends StatelessWidget{
  final String name;
  final String imagePath;

  const ItemCardModel({Key key, this.name, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 60,
        width: MediaQuery.of(context).size.width*0.8,
        decoration: BoxDecoration(
          color: CustomColor.white,
          borderRadius: BorderRadius.circular(50),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30),
                  child: Image(image: AssetImage("assets/images/${imagePath}.png")),
                ),

                Container(
                    margin: EdgeInsets.only(left: 30),
                    child: Text(name)
                ),
              ],
            ),

              Container(
                  margin: EdgeInsets.only(right: 20),
                  child:  Icon(Icons.keyboard_arrow_right, color: CustomColor.grayAd,)
              ),
          ],
        )
    );
  }

}