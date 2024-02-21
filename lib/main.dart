import 'package:basicfoodapp/Food.dart';
import 'package:basicfoodapp/NewPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BasicFoodAppDesign'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Food>> getFood() async {
    var food = <Food>[];
    var y1 = Food(
        food_id: 1,
        food_name: "Köfte",
        food_image_name: "kofte.png",
        food_cost: 15.99);
    var y2 = Food(
        food_id: 2,
        food_name: "Makarna",
        food_image_name: "makarna.png",
        food_cost: 15.99);
    var y3 = Food(
        food_id: 3,
        food_name: "Kadayif",
        food_image_name: "kadayif.png",
        food_cost: 15.99);
    var y4 = Food(
        food_id: 4,
        food_name: "Fanta",
        food_image_name: "fanta.png",
        food_cost: 15.99);
    var y5 = Food(
        food_id: 5,
        food_name: "Baklava",
        food_image_name: "baklava.png",
        food_cost: 15.99);
    var y6 = Food(
        food_id: 6,
        food_name: "Ayran",
        food_image_name: "ayran.png",
        food_cost: 15.99);
    food.add(y1);
    food.add(y2);
    food.addAll([y3, y4, y5, y6]);

    return food;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: FutureBuilder<List<Food>>(
            future: getFood(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var food = snapshot.data;
                return ListView.builder(
                  itemCount: food!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewPage(food[index])));
                      },
                      child: Card(
                        child: Row(
                          children: [
                            Image.asset("img/${food[index].food_image_name}"),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  food[index].food_name,
                                  style: TextStyle(fontSize: 25),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                Text(
                                  food[index].food_cost.toString() + "\u{20BA}",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 20),
                                ),
                              ],
                            ),
                            Spacer(),
                            Icon(Icons.keyboard_arrow_right),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Center();
              }
            }));
  }
}
