import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pos_printer_platform_image_3/flutter_pos_printer_platform_image_3.dart';
import 'package:restaurant_kot/presendation/conn/bluetooth.dart';

var cmpname, cmpAdd, cmpgst, cmpcontact;
 var defaultPrinterType = PrinterType.bluetooth;
  var isBle = false;
  var reconnect = false;
  var isConnected = false;
  var printerManager = PrinterManager.instance;
  var devices = <BluetoothPrinter>[];
  StreamSubscription<PrinterDevice>? subscription;
  StreamSubscription<BTStatus>? subscriptionBtStatus;
  StreamSubscription<USBStatus>? subscriptionUsbStatus;
  // StreamSubscription<TCPStatus>? subscriptionTCPStatus;
  BTStatus currentStatus = BTStatus.none;
  // ignore: unused_field
  // TCPStatus _currentTCPStatus = TCPStatus.none;
  // currentUsbStatus is only supports on Android
  // ignore: unused_field
  USBStatus currentUsbStatus = USBStatus.none;
  List<int>? pendingTask;
  String ipAddress = '';
  String port = '9100';
  final ipController = TextEditingController();
  final portController = TextEditingController();
  BluetoothPrinter? selectedPrinter;