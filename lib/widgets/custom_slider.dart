import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, //Use the complete screen width
      height: 200,
      color: Colors.amber,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text("Most popular movies", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
          ),
          Expanded(
            child:
            ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder:(_,int index){
              return Container(
                width: 150,
                height: 170,
                color: Colors.deepOrangeAccent,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              );
            }
          )
          ),
          

        ],
      ),
    );
  }
}