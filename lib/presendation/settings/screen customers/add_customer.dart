import 'package:flutter/material.dart';
import 'package:restaurant_kot/consts/colors.dart';

class Customer {
  final String id;
  final String businessName;
  final String address;
  final String phone;
  final String email;
  final String country;
  final String state;
  final String gstDetails;
  final String customerType; // Normal Party/Sales Customer/Both
  final double openingBalance;
  final DateTime date;
  final String balanceType; // Dr/Cr
  final double amount;

  Customer({
    required this.id,
    required this.businessName,
    required this.address,
    required this.phone,
    required this.email,
    required this.country,
    required this.state,
    required this.gstDetails,
    required this.customerType,
    required this.openingBalance,
    required this.date,
    required this.balanceType,
    required this.amount,
  });
}

class CustomerFormPage extends StatefulWidget {
  final Customer? customer;

  const CustomerFormPage({
    super.key,
    this.customer, // Null for add, populated for edit
  });

  @override
  State<CustomerFormPage> createState() => _CustomerFormPageState();
}

class _CustomerFormPageState extends State<CustomerFormPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _businessNameController;
  late TextEditingController _addressController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _gstController;
  late TextEditingController _openingBalanceController;
  late TextEditingController _amountController;

  late String? _selectedCountry;
  late String? _selectedState;
  late String? _selectedCustomerType;
  late String? _selectedBalanceType;
  late DateTime _selectedDate;

  final List<String> _countries = ['India', 'USA', 'UK', 'Canada'];
  final List<String> _states = ['State 1', 'State 2', 'State 3'];
  final List<String> _customerTypes = [
    'Normal Party',
    'Sales Customer',
    'Both'
  ];
  final List<String> _balanceTypes = ['Dr', 'Cr'];

  bool get _isEditing => widget.customer != null;

  @override
  void initState() {
    super.initState();

    // Initialize controllers
    _businessNameController =
        TextEditingController(text: widget.customer?.businessName ?? '');
    _addressController =
        TextEditingController(text: widget.customer?.address ?? '');
    _phoneController =
        TextEditingController(text: widget.customer?.phone ?? '');
    _emailController =
        TextEditingController(text: widget.customer?.email ?? '');
    _gstController =
        TextEditingController(text: widget.customer?.gstDetails ?? '');
    _openingBalanceController = TextEditingController(
        text: widget.customer?.openingBalance.toString() ?? '');
    _amountController =
        TextEditingController(text: widget.customer?.amount.toString() ?? '');

    // Initialize dropdown values
    _selectedCountry = widget.customer?.country;
    _selectedState = widget.customer?.state;
    _selectedCustomerType = widget.customer?.customerType ?? 'Normal Party';
    _selectedBalanceType = widget.customer?.balanceType ?? 'Dr';
    _selectedDate = widget.customer?.date ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _isEditing ? 'Edit Customer' : 'Add New Customer',
          style: const TextStyle(
            color: Colors.white, // Text color
            fontSize: 15, // Text size
            fontWeight: FontWeight.bold, // Text weight
          ),
        ),
        centerTitle: true, // Center the title
        backgroundColor: mainclr, // Use your main color constant
        elevation: 4, // Shadow depth
        iconTheme: const IconThemeData(
          color: Colors.white, // Back button color
        ),
        actions: [
          if (_isEditing)
            IconButton(
              icon: const Icon(Icons.delete, size: 26), // Increased icon size
              onPressed: _confirmDelete,
              color: Colors.white, // Icon color
              tooltip: 'Delete Customer', // Accessibility hint
            ),
          const SizedBox(width: 8), // Add some spacing
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: mainclr.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.person_add_alt_1,
                      color: mainclr,
                      size: 30,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      _isEditing
                          ? 'Update Customer Details'
                          : 'Create New Customer',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: mainclr,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Business Information Section
              _buildSectionHeader('Business Information', Icons.business),
              _buildTextField('Business Name', _businessNameController,
                  icon: Icons.business),
              const SizedBox(height: 16),
              _buildTextField('GST Details', _gstController,
                  icon: Icons.receipt),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedCustomerType,
                decoration: _buildInputDecoration(
                  'Customer Type',
                  icon: Icons.category,
                ),
                items: _customerTypes.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCustomerType = value;
                  });
                },
              ),
              const SizedBox(height: 24),

              // Contact Information Section
              _buildSectionHeader('Contact Information', Icons.contact_mail),
              _buildTextField('Address', _addressController,
                  maxLines: 3, icon: Icons.location_on),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField('Phone', _phoneController,
                        icon: Icons.phone),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildTextField('Email', _emailController,
                        icon: Icons.email),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: _selectedCountry,
                      decoration: _buildInputDecoration(
                        'Country',
                        icon: Icons.public,
                      ),
                      items: _countries.map((country) {
                        return DropdownMenuItem(
                          value: country,
                          child: Text(country),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCountry = value;
                        });
                      },
                      validator: (value) =>
                          value == null ? 'Please select country' : null,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: _selectedState,
                      decoration: _buildInputDecoration(
                        'State',
                        icon: Icons.map,
                      ),
                      items: _states.map((state) {
                        return DropdownMenuItem(
                          value: state,
                          child: Text(state),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedState = value;
                        });
                      },
                      validator: (value) =>
                          value == null ? 'Please select state' : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Opening Balance Section (only for new customers)
              if (!_isEditing) ...[
                _buildSectionHeader(
                    'Opening Balance', Icons.account_balance_wallet),
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                        'Amount',
                        _openingBalanceController,
                        keyboardType: TextInputType.number,
                        icon: Icons.attach_money,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: _selectedBalanceType,
                        decoration: _buildInputDecoration(
                          'Dr/Cr',
                          icon: Icons.compare_arrows,
                        ),
                        items: _balanceTypes.map((type) {
                          return DropdownMenuItem(
                            value: type,
                            child: Text(type),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedBalanceType = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                InkWell(
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: _selectedDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (date != null) {
                      setState(() {
                        _selectedDate = date;
                      });
                    }
                  },
                  child: InputDecorator(
                    decoration: _buildInputDecoration(
                      'Date',
                      icon: Icons.calendar_today,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                        ),
                        const Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],

              // Save Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: mainclr,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
                onPressed: _saveCustomer,
                child: Text(
                  _isEditing ? 'UPDATE CUSTOMER' : 'SAVE CUSTOMER',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Icon(icon, color: mainclr, size: 20),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _buildInputDecoration(String label, {IconData? icon}) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey.shade400),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey.shade400),
      ),
      prefixIcon: icon != null ? Icon(icon, size: 20) : null,
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    );
  }

  TextFormField _buildTextField(
    String label,
    TextEditingController controller, {
    int? maxLines,
    TextInputType? keyboardType,
    IconData? icon,
  }) {
    return TextFormField(
      controller: controller,
      decoration: _buildInputDecoration(label, icon: icon),
      maxLines: maxLines ?? 1,
      keyboardType: keyboardType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
    );
  }

  void _saveCustomer() {
    if (_formKey.currentState!.validate()) {
      final customer = Customer(
        id: widget.customer?.id ??
            DateTime.now().millisecondsSinceEpoch.toString(),
        businessName: _businessNameController.text,
        address: _addressController.text,
        phone: _phoneController.text,
        email: _emailController.text,
        country: _selectedCountry!,
        state: _selectedState!,
        gstDetails: _gstController.text,
        customerType: _selectedCustomerType!,
        openingBalance: _isEditing
            ? widget.customer!.openingBalance
            : double.parse(_openingBalanceController.text),
        date: _isEditing ? widget.customer!.date : _selectedDate,
        balanceType:
            _isEditing ? widget.customer!.balanceType : _selectedBalanceType!,
        amount: _isEditing
            ? widget.customer!.amount
            : double.parse(_amountController.text),
      );

      // TODO: Implement save/update logic
      // if (_isEditing) {
      //   context.read<CustomerBloc>().add(UpdateCustomerEvent(customer));
      // } else {
      //   context.read<CustomerBloc>().add(AddCustomerEvent(customer));
      // }

      Navigator.pop(context);
    }
  }

  void _confirmDelete() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Customer'),
        content: const Text(
            'Are you sure you want to delete this customer? This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('CANCEL'),
          ),
          TextButton(
            onPressed: () {
              // TODO: Implement delete logic
              // context.read<CustomerBloc>().add(DeleteCustomerEvent(widget.customer!.id));
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Close form
            },
            child: const Text('DELETE', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _businessNameController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _gstController.dispose();
    _openingBalanceController.dispose();
    _amountController.dispose();
    super.dispose();
  }
}
