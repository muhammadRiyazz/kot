import 'package:flutter/material.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/presendation/settings/screen%20customers/add_customer.dart';

class CustomerDetailPage extends StatelessWidget {

  const CustomerDetailPage({super.key, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('businessName'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Navigate to edit page
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => EditCustomerPage(customer: customer),
              //   ),
              // );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildDetailCard(
              icon: Icons.business,
              title: 'Business Information',
              children: [
                _buildDetailRow('Business Name', 'businessName'),
                _buildDetailRow('Customer Type', 'customerType'),
                _buildDetailRow('GST Details', 'gstDetails'),
              ],
            ),
            const SizedBox(height: 16),
            _buildDetailCard(
              icon: Icons.location_on,
              title: 'Address',
              children: [
                _buildDetailRow('Address', 'address'),
                _buildDetailRow('Country', 'country'),
                _buildDetailRow('State', 'state'),
              ],
            ),
            const SizedBox(height: 16),
            _buildDetailCard(
              icon: Icons.contact_phone,
              title: 'Contact Information',
              children: [
                _buildDetailRow('Phone', 'phone'),
                _buildDetailRow('Email','email'),
              ],
            ),
            const SizedBox(height: 16),
            // _buildDetailCard(
            //   icon: Icons.account_balance_wallet,
            //   title: 'Financial Information',
            //   children: [
            //     _buildDetailRow('Opening Balance',
            //         '${customer.balanceType} ${customer.openingBalance}'),
            //     _buildDetailRow('Date',
            //         '${customer.date.day}/${customer.date.month}/${customer.date.year}'),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailCard({
    required IconData icon,
    required String title,
    required List<Widget> children,
  }) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: mainclr),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}