import 'package:flutter/material.dart';
import 'package:app_flutter_coding/view/icons.dart';

// create data for stable with horse and rider and the name of the stable
class Stable {
  final String name;
  final String horse;
  final String rider;

  Stable(this.name, this.horse, this.rider);
}

// create array of stable
List<Stable> stables = [
  Stable('Stable 1', 'Horse 1', 'Rider 1'),
  Stable('Stable 2', 'Horse 2', 'Rider 2'),
  Stable('Stable 3', 'Horse 3', 'Rider 3'),
  Stable('Stable 4', 'Horse 4', 'Rider 4'),
  Stable('Stable 5', 'Horse 5', 'Rider 5'),
  Stable('Stable 6', 'Horse 6', 'Rider 6'),
  Stable('Stable 7', 'Horse 7', 'Rider 7'),
  Stable('Stable 8', 'Horse 8', 'Rider 8'),
  Stable('Stable 9', 'Horse 9', 'Rider 9'),
];


class Ecurie extends StatefulWidget {
  const Ecurie({Key? key}) : super(key: key);

  @override
  _Ecurie createState() => _Ecurie();
}

class _Ecurie extends State<Ecurie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ecurie'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(stables.length, (index) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // create a card with the name of the stable and onTap you see the name of the horse and the rider
                Card(
                  child: ListTile(
                    title: Text(stables[index].name, textAlign: TextAlign.center),
                    subtitle: const Icon(MyFlutterApp.horseshoe),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(stables[index].name),
                              content: Text(
                                  'Horse: ${stables[index].horse} and Rider: ${stables[index].rider}'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Close'),
                                ),
                              ],
                            );
                          });
                    },
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}


