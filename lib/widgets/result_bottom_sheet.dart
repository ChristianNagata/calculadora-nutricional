import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import '../form_controller.dart';

class ResultBottomSheet extends StatelessWidget {
  const ResultBottomSheet(this.controller, {super.key});

  final FormController controller;

  Future<void> show(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      builder: (_) => this,
    );
  }

  @override
  Widget build(BuildContext context) {
    var dottedLine =
        Expanded(child: DottedLine(dashColor: Colors.grey.withOpacity(0.5)));

    return Container(
      height: 400,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Custo para atingir ${controller.desiredProteinValue}g de proteína:',
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                  'Filé de Frango (${controller.filletKgNeeded.toStringAsFixed(3)}kg)'),
              dottedLine,
              Text('R\$${controller.filletCost.toStringAsFixed(2)}'),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                  'Peito com Osso (${controller.breastKgNeeded.toStringAsFixed(3)}kg)'),
              dottedLine,
              Text('R\$${controller.brestCost.toStringAsFixed(2)}')
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Text('Diferença de preço'),
              dottedLine,
              Text('R\$${controller.priceDiff.toStringAsFixed(2)}')
            ],
          ),
          const SizedBox(height: 20),
          Text(
            controller.filletCost < controller.brestCost
                ? 'Compensa mais comprar Filé de Frango'
                : 'Compensa mais comprar Peito com Osso',
            style: const TextStyle(
                fontWeight: FontWeight.w600, color: Colors.green),
          ),
        ],
      ),
    );
  }
}
