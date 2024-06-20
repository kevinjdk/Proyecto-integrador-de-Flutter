import 'package:flutter/material.dart';
import 'package:menu_drawer/screens/product.dart';


class CartItem extends StatelessWidget {
  final Product product;
  final Function(Product) onIncrease;
  final Function(Product) onDecrease;
  final Function(Product) onRemove;

  CartItem(this.product, this.onIncrease, this.onDecrease, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey[100],
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: ListTile(
          contentPadding:
              EdgeInsets.zero, // Elimina el padding por defecto del ListTile
          title: Text(product.title),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Cantidad: ${product.quantity}'),
              Text(
                  'Precio: \$${(product.price * product.quantity).toStringAsFixed(2)}'),
            ],
          ),
          trailing: Container(
            width: 120, // Ajusta el ancho del container para los botones
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => onIncrease(product),
                ),
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () => onDecrease(product),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => onRemove(product),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}