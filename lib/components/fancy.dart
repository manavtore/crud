
import 'package:fancy_element/fancy_element.dart';
import 'package:flutter/material.dart';

class fancyCard extends StatefulWidget {
  const fancyCard({super.key, required title});

  @override
  State<fancyCard> createState() => _fancyCardState();
}

class _fancyCardState extends State<fancyCard> {
  @override
  Widget build(BuildContext context) {
    return FancyCard(
                width: Fancy.width(context),
                height: Fancy.height(context) * 0.40,
                redius: 10,
                child: Center(
                  child: Container(
                    child: const Text(
                      "This Is Fancy Card",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              );
  }
}