import 'package:flutter/material.dart';

class ShoppingCartButton extends StatefulWidget {
  const ShoppingCartButton({super.key});

  @override
  State<ShoppingCartButton> createState() => _ShoppingCartButtonState();
}

bool b = false;

class _ShoppingCartButtonState extends State<ShoppingCartButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              b = !b;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: b ? 200 : 80.0,
            height: 60,
            decoration: BoxDecoration(
              color: b ? Colors.green : Colors.blue,
              borderRadius: BorderRadius.circular(b ? 30.0 : 10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  b ? Icons.check : Icons.shopping_cart,
                  color: Colors.white,
                ),
                if(b)
                const AnimatedOpacity(
                  opacity: 1,
                  duration: Duration(milliseconds: 2500),
                  child: Text(
                    'Added to Cart',
                    style: TextStyle(color: Colors.white, fontSize: 23),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
