import 'package:flutter/material.dart';
import 'request_product_page.dart';
import 'view_requests_page.dart';
import '../models/product_request.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<ProductRequest> _requests = [];

  void _addRequest(ProductRequest request) {
    setState(() {
      _requests.add(request);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Container(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Consulta Tus Productos',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
            ),
            const SizedBox(height: 32),
            _buildMenuCard(
              context,
              'Solicitar Producto',
              Icons.add_circle_outline,
              'Realiza una nueva solicitud de producto',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        RequestProductPage(onRequestAdded: _addRequest),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            _buildMenuCard(
              context,
              'Ver Solicitudes',
              Icons.list_alt,
              'Revisa tus solicitudes anteriores',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewRequestsPage(requests: _requests),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, String title, IconData icon,
      String subtitle, VoidCallback onTap) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  size: 32,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey[600],
                          ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey[400],
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
