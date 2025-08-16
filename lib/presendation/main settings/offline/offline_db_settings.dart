import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:permission_handler/permission_handler.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _mode = 'local';
  String _dbPath = '';
  bool _dbConnected = false;
  bool _isLoading = false;
  double _creationProgress = 0;
  bool _isCreatingDb = false;
  bool _showAddNewDbOptions = false;
  String _newDbName = 'restaurant.db';
  final TextEditingController _dbNameController = TextEditingController();
  List<String> _existingDbFiles = [];

  final List<Map<String, String>> _databaseSchema = [
    {
      'table': 'Login',
      'query': '''
        CREATE TABLE Login (
          Id INTEGER PRIMARY KEY AUTOINCREMENT,
          username TEXT NOT NULL,
          password TEXT NOT NULL,
          role TEXT NOT NULL,
          sale INTEGER DEFAULT 0,
          saler INTEGER DEFAULT 0,
          purchase INTEGER DEFAULT 0,
          purchaser INTEGER DEFAULT 0,
          stockadjin INTEGER DEFAULT 0,
          stockadjout INTEGER DEFAULT 0
        )
      '''
    },
  ];

  @override
  void initState() {
    super.initState();
    _dbNameController.text = _newDbName;
    _loadSettings();
    _checkPermission();
    _scanForExistingDatabases();
  }

  Future<void> _scanForExistingDatabases() async {
    final appDir = await getApplicationDocumentsDirectory();
    final files = await Directory(appDir.path).list().toList();
    setState(() {
      _existingDbFiles = files
          .where((file) =>
              file.path.endsWith('.db') || file.path.endsWith('.sqlite'))
          .map((file) => p.basename(file.path))
          .toList();
    });
  }

  Future<void> _checkPermission() async {
    var status = await Permission.storage.status;
    if (status.isDenied) {
      status = await Permission.storage.request();
    }
    if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  Future<void> _loadSettings() async {
    setState(() => _isLoading = true);
    try {
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        _mode = prefs.getString('mode') ?? 'local';
        _dbPath = prefs.getString('db_path') ?? '';
      });
      if (_dbPath.isNotEmpty) {
        await _validateDatabase(_dbPath);
      }
    } catch (e) {
      log('Error loading settings: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _toggleMode() async {
    setState(() => _isLoading = true);
    try {
      final prefs = await SharedPreferences.getInstance();
      final newMode = _mode == 'local' ? 'remote' : 'local';
      await prefs.setString('mode', newMode);
      setState(() => _mode = newMode);
      _showSuccess('Switched to ${newMode.toUpperCase()} mode');
    } catch (e) {
      _showError('Failed to switch mode: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _importDbFromStorage() async {
    setState(() => _isLoading = true);
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['db', 'sqlite'],
        dialogTitle: 'Select SQLite Database File',
      );

      if (result == null || result.files.single.path == null) return;

      final filePath = result.files.single.path!;
      final fileName = result.files.single.name.toLowerCase();

      if (!fileName.endsWith('.db') && !fileName.endsWith('.sqlite')) {
        throw Exception(
            'Invalid file type. Please select a .db or .sqlite file');
      }

      await _validateDatabase(filePath);

      final appDir = await getApplicationDocumentsDirectory();
      final newPath = p.join(appDir.path, fileName);
      await File(filePath).copy(newPath);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('db_path', newPath);

      setState(() {
        _dbPath = newPath;
        _dbConnected = true;
        _showAddNewDbOptions = false;
      });

      await _scanForExistingDatabases();
      _showSuccess('✅ Database imported successfully');
    } on PlatformException catch (e) {
      _showError('File picker error: ${e.message}');
    } catch (e) {
      _showError('Failed to import DB: ${e.toString()}');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _createNewDatabase() async {
    if (_newDbName.isEmpty) {
      _showError('Please enter a database name');
      return;
    }

    setState(() {
      _isCreatingDb = true;
      _creationProgress = 0;
    });

    try {
      final appDir = await getApplicationDocumentsDirectory();
      final newPath = p.join(appDir.path, _newDbName);

      // Check if file already exists
      if (await File(newPath).exists()) {
        throw Exception('Database file already exists');
      }

      // Create new database
      final db = await openDatabase(newPath);

      // Create tables with progress tracking
      for (int i = 0; i < _databaseSchema.length; i++) {
        final schema = _databaseSchema[i];
        await db.execute(schema['query']!);

        setState(() {
          _creationProgress = (i + 1) / _databaseSchema.length;
        });

        await Future.delayed(const Duration(milliseconds: 200));
      }

      await db.close();

      // Save settings
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('db_path', newPath);

      setState(() {
        _dbPath = newPath;
        _dbConnected = true;
        _isCreatingDb = false;
        _showAddNewDbOptions = false;
      });

      await _scanForExistingDatabases();
      _showSuccess('🆕 Database $_newDbName created successfully');
    } catch (e) {
      setState(() => _isCreatingDb = false);
      _showError('Failed to create database: ${e.toString()}');
    }
  }

  Future<void> _validateDatabase(String path) async {
    try {
      final db = await openDatabase(path);

      // Check if all required tables exist
      for (final schema in _databaseSchema) {
        final tables = await db.rawQuery(
          "SELECT name FROM sqlite_master WHERE type='table' AND name='${schema['table']}';",
        );

        if (tables.isEmpty) {
          await db.close();
          throw Exception(
              'Database is invalid: table ${schema['table']} not found');
        }
      }

      await db.close();
      setState(() => _dbConnected = true);
      return;
    } catch (e) {
      setState(() => _dbConnected = false);
      throw Exception('Invalid database file: ${e.toString()}');
    }
  }

  Future<void> _useExistingDatabase(String dbName) async {
    setState(() => _isLoading = true);
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final dbPath = p.join(appDir.path, dbName);

      await _validateDatabase(dbPath);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('db_path', dbPath);

      setState(() {
        _dbPath = dbPath;
        _dbConnected = true;
        _showAddNewDbOptions = false;
      });

      _showSuccess('📦 Using existing database: $dbName');
    } catch (e) {
      _showError('Failed to use database: ${e.toString()}');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _connectToDb() async {
    if (_dbPath.isEmpty) {
      _showError('No database file selected');
      return;
    }

    setState(() => _isLoading = true);
    try {
      await _validateDatabase(_dbPath);
      _showSuccess('✅ Connected to database successfully');
    } catch (e) {
      _showError('Connection failed: ${e.toString()}');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _testDbConnection() async {
    if (_dbPath.isEmpty) {
      _showError('No database file selected');
      return;
    }

    setState(() => _isLoading = true);

    try {
      if (!await File(_dbPath).exists()) {
        throw Exception('Database file not found at the specified path');
      }

      final db = await openDatabase(_dbPath);
      final tableInfo = await db.rawQuery("PRAGMA table_info('Login');");

      if (tableInfo.isEmpty) {
        throw Exception('Login table not found in the database');
      }

      final requiredColumns = [
        'Id',
        'username',
        'password',
        'role',
        'sale',
        'saler',
        'purchase',
        'purchaser',
        'stockadjin',
        'stockadjout'
      ];

      final existingColumns =
          tableInfo.map((col) => col['name'] as String).toList();

      for (final column in requiredColumns) {
        if (!existingColumns.contains(column)) {
          throw Exception('Missing required column: $column');
        }
      }

      final testQuery = await db.rawQuery("SELECT COUNT(*) FROM Login");
      log('Test query result: $testQuery');

      await db.close();

      setState(() => _dbConnected = true);
      _showSuccess(
          '✅ Database connection successful!\nAll required tables and columns exist');
    } catch (e) {
      setState(() => _dbConnected = false);
      _showError('Connection test failed: ${e.toString()}');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red.shade800,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  void _showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green.shade800,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _buildDatabaseStatus() {
    if (_dbPath.isEmpty) {
      return const Chip(
        label: Text('No database selected'),
        avatar: Icon(Icons.warning, size: 18),
        backgroundColor: Colors.orange,
      );
    }

    return Row(
      children: [
        Chip(
          label: Text(_dbConnected ? 'Connected' : 'Disconnected'),
          avatar: Icon(
            _dbConnected ? Icons.check_circle : Icons.error,
            size: 18,
            color: _dbConnected ? Colors.green : Colors.red,
          ),
          backgroundColor:
              _dbConnected ? Colors.green.shade100 : Colors.red.shade100,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            p.basename(_dbPath),
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDatabaseCreationDialog() {
    return AlertDialog(
      title: const Text('Creating Database'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Setting up your new database...'),
          const SizedBox(height: 16),
          LinearProgressIndicator(
            value: _creationProgress,
            backgroundColor: Colors.grey.shade200,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(height: 8),
          Text(
            '${(_creationProgress * 100).toStringAsFixed(0)}% complete',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Widget _buildAddNewDbOptions() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.add_circle_outline),
                const SizedBox(width: 8),
                Text(
                  'Add New Database',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _dbNameController,
              decoration: InputDecoration(
                labelText: 'Database Name',
                hintText: 'e.g. restaurant.db',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                suffixText: '.db',
              ),
              onChanged: (value) =>
                  _newDbName = value.endsWith('.db') ? value : '$value.db',
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                FilledButton.icon(
                  icon: const Icon(Icons.upload_file),
                  label: const Text('Import Database'),
                  onPressed: _importDbFromStorage,
                ),
                FilledButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text('Create New'),
                  onPressed: _createNewDatabase,
                ),
                OutlinedButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    setState(() {
                      _showAddNewDbOptions = false;
                      _dbNameController.text = 'restaurant.db';
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExistingDatabasesList() {
    if (_existingDbFiles.isEmpty) {
      return const ListTile(
        leading: Icon(Icons.info_outline),
        title: Text('No existing databases found'),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text('Existing Databases:'),
        ),
        ..._existingDbFiles.map((dbFile) => ListTile(
              leading: dbFile == p.basename(_dbPath)
                  ? const Icon(Icons.check_circle, color: Colors.green)
                  : const Icon(Icons.storage),
              title: Text(dbFile),
              trailing: dbFile == p.basename(_dbPath)
                  ? null
                  : IconButton(
                      icon: const Icon(Icons.link),
                      onPressed: () => _useExistingDatabase(dbFile),
                    ),
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Database Settings'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              _loadSettings();
              _scanForExistingDatabases();
            },
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      // Mode Selection Card
                      Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.settings,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    'Application Mode',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      _mode == 'local'
                                          ? 'Local mode stores data on your device'
                                          : 'Remote mode connects to a server',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  FilledButton.tonal(
                                    onPressed: _toggleMode,
                                    style: FilledButton.styleFrom(
                                      backgroundColor: _mode == 'local'
                                          ? Colors.blue.shade100
                                          : Colors.purple.shade100,
                                      foregroundColor: _mode == 'local'
                                          ? Colors.blue.shade800
                                          : Colors.purple.shade800,
                                    ),
                                    child: Text(
                                      _mode == 'local'
                                          ? 'Switch to Remote'
                                          : 'Switch to Local',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Database Section - Only show in local mode
                      if (_mode == 'local') ...[
                        Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.storage,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      'Database Configuration',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                _buildDatabaseStatus(),
                                const SizedBox(height: 16),
                                const Divider(),
                                const SizedBox(height: 16),

                                // Show existing databases or add new options
                                if (!_showAddNewDbOptions) ...[
                                  _buildExistingDatabasesList(),
                                  const SizedBox(height: 16),
                                  FilledButton.icon(
                                    icon: const Icon(Icons.add),
                                    label: const Text('Add New Database'),
                                    onPressed: () => setState(
                                        () => _showAddNewDbOptions = true),
                                    style: FilledButton.styleFrom(
                                      minimumSize: const Size.fromHeight(50),
                                    ),
                                  ),
                                ] else ...[
                                  _buildAddNewDbOptions(),
                                ],

                                const SizedBox(height: 16),
                                if (_dbPath.isNotEmpty) ...[
                                  const Divider(),
                                  const SizedBox(height: 16),
                                  Wrap(
                                    spacing: 12,
                                    runSpacing: 12,
                                    children: [
                                      FilledButton.icon(
                                        icon:
                                            const Icon(Icons.health_and_safety),
                                        label: const Text('Test Connection'),
                                        onPressed: _testDbConnection,
                                        style: FilledButton.styleFrom(
                                          backgroundColor: _dbConnected
                                              ? Colors.green.shade800
                                              : Colors.blue.shade800,
                                        ),
                                      ),
                                      FilledButton.icon(
                                        icon: Icon(
                                          _dbConnected
                                              ? Icons.check_circle
                                              : Icons.link,
                                        ),
                                        label: Text(_dbConnected
                                            ? 'Reconnect'
                                            : 'Connect'),
                                        onPressed: _connectToDb,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'Database path:',
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    _dbPath,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'monospace',
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                if (_isCreatingDb) _buildDatabaseCreationDialog(),
              ],
            ),
    );
  }
}
