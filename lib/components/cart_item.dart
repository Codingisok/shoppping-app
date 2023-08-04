import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/models/cart.dart';
import 'package:shopping/models/product.dart';

class CartItem extends StatefulWidget {
  final Product product;
  const CartItem({
    super.key,
    required this.product});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[100],
      borderRadius: BorderRadius.circular(8)
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(widget.product.imagePath),
        title: Text(widget.product.name),
        subtitle: Text('${widget.product.price} RON'),
        trailing:  IconButton(
          icon: const Icon(Icons.delete),
        onPressed: removeItemFromCart,
      ),
    ),
    );
  }

   //remove item from cart
  void removeItemFromCart(){
    Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.product);
  }
}