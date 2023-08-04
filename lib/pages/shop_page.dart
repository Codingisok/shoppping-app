import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/models/product.dart';

import '../components/product_tile.dart';
import '../models/cart.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, value, child) => Column(
      children: [
        // search bar
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(8)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Search',
                style: TextStyle(color: Colors.grey),
              ),
              Icon(
                Icons.search,
                color: Colors.grey,
              )
            ],
          ),
        ),

        // message
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: Text(
            'Incearca sa cumperi si sa mananci responsabil',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),

       
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text(
                'Profita acum',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Text(
                'See all',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
        //hot picks
        Expanded(
          child: ListView.builder(
            itemCount: 7,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
             Product product = value.getProductList()[index];
                 
              return ProductTile(
                mancare: product,
                onTap: ()=> addProductToCart(product),
              );
            },
          ),

        ),
        const Padding(
          padding: EdgeInsets.only(top: 25.0, left: 25, right: 25),
          child: Divider(
            color: Colors.white,
          ),
        ),
      ],
    ),
    );
  }

  void addProductToCart(Product mancare){
    Provider.of<Cart>(context, listen: false).addItemToCart(mancare);

    // alert the userr food is in the cart
    showDialog(
      context: context, 
      builder:(context) => const AlertDialog(
        title: Text('Ati adaugat produsul!'),
        content: Text('Verifica, cosul de cumparaturi'),
      ),
      );
  }
}
