import 'package:flutter/material.dart';

// create data for stable with horse and rider and the name of the stable
class Stable {
  final String name;
  final String horse;
  final String rider;

  Stable(this.name, this.horse, this.rider);
}

List<>

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
        title: const Text('Equitation'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(Ecuries.length, (index) {
          return Center(
            child: ListTile(
              // text center
              title: Text(
                Ecuries[index].getname,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
              ),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(Ecuries[index].getname),
                        content: TextEcuries[index].getchevaux),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    });
              },
            ),
          );
        }),
      ),
    );
  }
}


