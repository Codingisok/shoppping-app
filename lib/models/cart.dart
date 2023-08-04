import 'package:flutter/widgets.dart';

import 'product.dart';

class Cart extends ChangeNotifier {
// list of products
  List<Product> availableProducts = [
    Product(
      name: 'Avocado',
      price: '7',
      description: 'ready to eat',
      imagePath: 'lib/images/avocado.png',
    ),
    Product(
      name: 'Banane',
      price: '8',
      description: 'DOLE',
      imagePath: 'lib/images/banane.png',
    ),
    Product(
      name: 'Lubenita',
      price: '57',
      description: 'lubenita fara samburi',
      imagePath: 'lib/images/lubenita.png',
    ),
    Product(
      name: 'Jambon',
      price: '101',
      description: 'Jamón Serrano Bodega',
      imagePath: 'lib/images/jambon.png',
    ),
    Product(
      name: 'Capsune',
      price: '44',
      description: 'capsune de gradina',
      imagePath: 'lib/images/capsune.png',
    ),
    Product(
      name: 'Cartofi',
      price: '6.5',
      description: 'Cartofi albi',
      imagePath: 'lib/images/cartofi.png',
    ),
    Product(
      name: 'Portocale',
      price: '9',
      description: 'portocale de Grecia',
      imagePath: 'lib/images/portocale.png',
    ),
    Product(
      name: 'Usturoi',
      price: '12',
      description: 'usturoi BIO',
      imagePath: 'lib/images/cartofi.png',
    ),
  ];
// products wich will be add into the basket
List<Product> userCart = [];


List<Product> getProductList(){
  return availableProducts;
}

// get cart
List<Product> getUserCart(){
  return userCart;
}

// add items to cart
void addItemToCart(Product product){
  userCart.add(product);
  notifyListeners();
}

// remove items from cart
void removeItemFromCart(Product product) {
  userCart.remove(product);
  notifyListeners();
  }
}
