import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String name, code, amount;
  final IconData icon;
  final bool isInverted;
  final double orderX, orderY;

  const CurrencyCard({
    super.key,
    required this.name,
    required this.code,
    required this.amount,
    required this.icon,
    required this.isInverted,
    required this.orderX,
    required this.orderY,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(orderX * 10, orderY * 10),
      child: Container(
        decoration: BoxDecoration(
          color: isInverted ? Colors.lightGreen : Colors.pink[300],
          borderRadius: BorderRadius.circular(25),
        ),
        clipBehavior: Clip.hardEdge,
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        amount,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        code,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          fontSize: 18,
                          fontWeight: FontWeight.w200,
                        ),
                      )
                    ],
                  )
                ],
              ),
              Transform.scale(
                scale: 3,
                child: Transform.translate(
                  offset: const Offset(5, 9),
                  child: Icon(
                    icon,
                    color: Colors.black,
                    size: 78,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
