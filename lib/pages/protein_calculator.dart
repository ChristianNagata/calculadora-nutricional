import 'package:calculadora_nutricional/form_controller.dart';
import 'package:flutter/material.dart';

import '../widgets/result_bottom_sheet.dart';

class ProteinCalculator extends StatefulWidget {
  const ProteinCalculator({super.key});

  @override
  _ProteinCalculatorState createState() => _ProteinCalculatorState();
}

class _ProteinCalculatorState extends State<ProteinCalculator> {
  final FormController controller = FormController();

  void onCalculate() {
    if (!controller.formKey.currentState!.validate()) return;
    controller.calculateCosts();
    if (!(controller.filletCost > 0 && controller.brestCost > 0)) return;
    ResultBottomSheet(controller).show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: onCalculate,
        child: const Icon(Icons.calculate_outlined),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: controller.formKey,
              child: ListView(
                children: [
                  Card(
                    margin: EdgeInsets.zero,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Comparação de preço',
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(height: 24),
                          TextFormField(
                            controller: controller.breastPrice,
                            decoration: const InputDecoration(
                              labelText: 'Peito com osso',
                              suffixText: '/ kg',
                              prefixText: 'R\$ ',
                            ),
                            validator: controller.emptyFieldValidator,
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: controller.filletPrice,
                            decoration: const InputDecoration(
                              labelText: 'Filé',
                              suffixText: '/ kg',
                              prefixText: 'R\$ ',
                            ),
                            validator: controller.emptyFieldValidator,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Card(
                    margin: EdgeInsets.zero,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Proteína desejada',
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(height: 24),
                          TextFormField(
                            controller: controller.desiredProtein,
                            decoration: const InputDecoration(
                              labelText: 'Proteína (g)',
                              suffixText: 'g',
                            ),
                            keyboardType: TextInputType.number,
                            validator: controller.emptyFieldValidator,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
