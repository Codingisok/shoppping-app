import 'package:flutter/material.dart';
import '../models/product.dart';


class ProductTile extends StatelessWidget {
  final Product mancare;
  final void Function()? onTap;
 const ProductTile({super.key, required this.mancare, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25),
      width: 280,
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(12)),
      child: Column(
        // aici spatiu intre poza si descriere si numelemancarii
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // food picture
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(mancare.imagePath)),

          // descriere mancare
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:25.0),
            child: Text(
              mancare.description,
              style: TextStyle(color: Colors.grey[500]),
            ),
          ),

          // pret + detalii
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  // ducem scrisul la inceput de container, pretul si denumirea
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // numele mancarii
          
                    Text(
                      mancare.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    // pret
                    Text(
                      '${mancare.price} RON',
          
                      )
                  ],
                ),
          
                // plus button
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
