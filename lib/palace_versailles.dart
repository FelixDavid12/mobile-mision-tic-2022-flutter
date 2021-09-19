import 'package:flutter/material.dart';

class PalaceVersailles extends StatelessWidget {
  PalaceVersailles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Palace of Versailles')
        ),
        body: ListView(
          children: [
            Image.asset('lib/assets/versailles_0.jpg', width: 400, height: 200, fit: BoxFit.cover),
            galleryPOI,
            infoPOI,
            descriptionPOI,
            mapPOI
          ],
        )
    );
  }

  final Widget galleryPOI = Container(
    margin: const EdgeInsets.all(16),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            // Probar con BoxFit.cover
            child: Image.asset('lib/assets/versailles_0.jpg', width: 60, height: 90),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10)
            ),
          ),
          Container(
            child: Image.asset('lib/assets/versailles_1.jpg', width: 60, height: 90),
          ),
          Container(
            child: Image.asset('lib/assets/versailles_2.jpg', width: 60, height: 90),
          ),
          Container(
            child: Image.asset('lib/assets/versailles_3.jpg', width: 60, height: 90),
          ),
        ]
    ),
  );

  final Widget infoPOI = Container(
    margin: const EdgeInsets.all(16),
    child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: const Text(
                    'Palacio de Versalles',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Place d\'Armes, 78000 Versailles, Francia',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
          const Text('4.5'),
        ]
    ),
  );

  final Widget descriptionPOI = Container(
    margin: const EdgeInsets.all(16),
    child: Text('El Palacio de Versalles es un edificio que desempeñó las funciones de una residencia real desde 1682 hasta 1789. El palacio está ubicado en el municipio de Versalles, cerca de París, en la región isla de Francia.'),
  );

  final Widget mapPOI = Container(
    margin: const EdgeInsets.all(16),
    child: Image.asset('lib/assets/map_versailles.jpg', width: 400, height: 200, fit: BoxFit.cover),
  );
}