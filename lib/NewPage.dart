import 'package:basicfoodapp/Food.dart';
import 'package:flutter/material.dart';

class NewPage extends StatefulWidget {
  Food food;
  NewPage(this.food);

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.food.food_name),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("img/${widget.food.food_image_name}"),
            Text(
              widget.food.food_name,
              style: TextStyle(fontSize: 50, fontStyle: FontStyle.italic),
            ),
            Text(
              widget.food.food_cost.toString(),
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              width: 100,
              height: 100,
              child: ElevatedButton(
                  onPressed: () {
                    print("Satin alindi");
                  },
                  child: Text("BUY")),
            )
          ],
        ),
      ),
    );
  }
}
