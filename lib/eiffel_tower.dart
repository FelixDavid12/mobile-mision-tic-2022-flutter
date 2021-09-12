import 'package:flutter/material.dart';


class EiffelTower extends StatelessWidget {
  const EiffelTower({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Eiffel Tower"),
      ),
      body: Wrap(
        runSpacing: 20,
        children: [
          const Image(image: AssetImage('lib/assets/tower_eiffel.png')),
          Container(
            margin: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Wrap(
              runSpacing: 10,
              children: const [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Eiffel Tower",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textScaleFactor: 2.0,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Ubicada en París, Francia, exactamente en Champ de Mars. Tiene 325 metros de altura y tres pisos únicamente. Fue construida durante 2 años para la Exposición Universal de París en 1889. Cuenta con 8 ascensores y 4 formas de acceso a través de sus patas.",
                    textScaleFactor: 1.5,
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
