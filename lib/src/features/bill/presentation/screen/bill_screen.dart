import 'package:first_app/src/features/bill/presentation/provider/bill_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/response.dart';

class BillScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  BillScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final billProvider = context.watch<BillProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to EasyPyment'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        // Permite desplazamiento si el contenido es largo
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!billProvider.isDatosEnviados)
              if (billProvider.isLoading)
                const CircularProgressIndicator()
              else
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: TextEditingController(),
                        validator: (value) {
                          return billProvider.validatorFilds(value);
                        },
                        onChanged: billProvider.setEvent,
                        decoration: const InputDecoration(
                            labelText: 'Evento', border: OutlineInputBorder()),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                          controller: TextEditingController(),
                          validator: (value) {
                            return billProvider.validatorFilds(value);
                          },
                          decoration: const InputDecoration(
                            labelText: 'Mesa',
                            border: OutlineInputBorder(),
                          ),
                          onChanged: billProvider.setMesa),
                      const SizedBox(height: 10),
                      ButtonTheme(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            foregroundColor:
                                const Color.fromARGB(255, 218, 198, 241),
                            padding: const EdgeInsets.only(
                              left: 16.0,
                              right: 16.0,
                              top: 16.0,
                              bottom: 16.0,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                               await billProvider.createBill();
                            }
                          },
                          child: const Text('Create Event'),
                        ),
                      ),
                    ],
                  ),
                ),
            const SizedBox(height: 20),
            if (billProvider.getResp?.getResultState == ResultState.success)
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.only(bottom: 50),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Evento: ${billProvider.getEvent}',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Mesa: ${billProvider.getMesa}',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'ID de Cuenta: ${billProvider.getResp?.data?.getId}',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            if (billProvider.getResp?.getResultState == ResultState.error)
              Text(
                'Para registrar gastos personales, por favor crea una cuenta primero.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
/*             const Divider(height: 30, thickness: 1),
            Text(
              'Gastos Personales',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(height: 15),
            bill.personalExpenses.isEmpty
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text('No hay gastos personales registrados aún.'),
                    ),
                  )
                : Column(
                    children: bill.personalExpenses.map((expense) {
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      expense.nameProduct,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Text(
                                      'Cantidad: ${expense.amount}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    if (expense.clientId != null)
                                      Text(
                                        'Cliente ID: ${expense.clientId}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              fontStyle: FontStyle.italic,
                                            ),
                                      ),
                                  ],
                                ),
                              ),
                              Text(
                                '\$${(expense.price * expense.amount).toStringAsFixed(2)}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
            const Divider(height: 30, thickness: 1),
            // Sección de Total
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Theme.of(context).colorScheme.tertiaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total de la Cuenta:',
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onTertiaryContainer,
                              ),
                    ),
                    Text(
                      '\$${bill.totalExpenses.toStringAsFixed(2)}',
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onTertiaryContainer,
                              ),
                    ),
                  ],
                ),
              ),
            ), */
          ],
        ),
      ),
    );
  }
}
