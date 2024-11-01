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
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: widget.requests.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.inbox_outlined,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No hay solicitudes',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.grey[600],
                        ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(24),
              itemCount: widget.requests.length,
              itemBuilder: (context, index) {
                final request = widget.requests[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () => _showRequestDetails(context, request),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Icon(
                                  Icons.credit_card,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      request.productType,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      request.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: Colors.grey[600],
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.grey[400],
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Divider(color: Colors.grey[200]),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today_outlined,
                                size: 16,
                                color: Colors.grey[600],
                              ),
                              const SizedBox(width: 8),
                              Text(
                                _formatDate(request.requestDate),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: Colors.grey[600],
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Detalles de la Solicitud',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 24),
              _buildDetailRow(context, 'Producto', request.productType),
              _buildDetailRow(context, 'Nombre', request.name),
              _buildDetailRow(context, 'Email', request.email),
              _buildDetailRow(context, 'Teléfono', request.phone),
              _buildDetailRow(
                  context, 'Fecha', _formatDate(request.requestDate)),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cerrar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
