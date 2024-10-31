import 'package:flutter/material.dart';
import '../models/product_request.dart';

class ViewRequestsPage extends StatefulWidget {
  final List<ProductRequest> requests;
  const ViewRequestsPage({super.key, required this.requests});

  @override
  State<ViewRequestsPage> createState() => _ViewRequestsPageState();
}

class _ViewRequestsPageState extends State<ViewRequestsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Solicitudes'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: widget.requests.length,
        itemBuilder: (context, index) {
          final request = widget.requests[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              title: Text(request.productType),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Solicitante: ${request.name}'),
                  Text('Fecha: ${_formatDate(request.requestDate)}'),
                ],
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                _showRequestDetails(context, request);
              },
            ),
          );
        },
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  void _showRequestDetails(BuildContext context, ProductRequest request) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(request.productType),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nombre: ${request.name}'),
            const SizedBox(height: 8),
            Text('Email: ${request.email}'),
            const SizedBox(height: 8),
            Text('Teléfono: ${request.phone}'),
            const SizedBox(height: 8),
            Text('Fecha: ${_formatDate(request.requestDate)}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }
}
