import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  bool _isBarcodeScan = true; // Toggle for barcode or label scan
  String _scanResult = "Scan result will appear here"; // To display scan result
  List<String> _scannedBarcodes = []; // List to store scanned results

  Future<void> scanCode() async {
    String barCodeScanRes;
    try {
      barCodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "Cancel", true, ScanMode.BARCODE,
      );
    } on PlatformException {
      barCodeScanRes = "Failed to scan";
    }

    setState(() {
      _scanResult = barCodeScanRes;
      if (barCodeScanRes != "-1") { // Ensure a valid barcode is scanned
        _scannedBarcodes.add(barCodeScanRes); // Save the scanned result
      }
    });
  }

  void _toggleScanType() {
    setState(() {
      _isBarcodeScan = !_isBarcodeScan;
    });
  }

  void _navigateToScanList() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ScanListPage(scannedBarcodes: _scannedBarcodes),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Color(0xFF006FFD), // Custom color for the icon
            size: 28, // Adjust size if needed
          ),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        title: Center(
          child: Text(
            'Quét mã',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(_isBarcodeScan ? Icons.qr_code : Icons.label_important),
            onPressed: _toggleScanType,
          ),
        ],
        backgroundColor: Color(0xFFEEEEEE), // Background color of the AppBar
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey[300],
            height: 1, // Separator line between AppBar and content
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _isBarcodeScan ? 'Barcode Scanner' : 'Label Scanner',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: scanCode, // Trigger the scanCode function on press
                    child: Text('Start Scan'),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(16.0), // Added padding for better layout
                    child: Text(
                      'Scan Result: $_scanResult',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      textAlign: TextAlign.center, // Center align text
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.grey[300],
            height: 1, // Separator line between content and bottom navbar
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white, // Background color of the BottomAppBar
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center align the Danh sách option
          children: [
            Expanded(
              child: InkWell(
                onTap: _navigateToScanList, // Navigate to ScanListPage
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.list, color: Color(0xFF006FFD), size: 24), // List icon
                    Text(
                      'Danh sách',
                      style: TextStyle(fontSize: 16, color: Color(0xFF006FFD)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScanListPage extends StatefulWidget {
  final List<String> scannedBarcodes;

  ScanListPage({required this.scannedBarcodes});

  @override
  _ScanListPageState createState() => _ScanListPageState();
}

class _ScanListPageState extends State<ScanListPage> {
  List<String> _scannedBarcodes = [];

  @override
  void initState() {
    super.initState();
    _scannedBarcodes = widget.scannedBarcodes;
  }

  void _removeBarcode(int index) {
    setState(() {
      _scannedBarcodes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Color(0xFF006FFD), // Custom color for the icon
            size: 28, // Adjust size if needed
          ),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 32.0), // Adjust left padding here
          child: Text(
            'Danh sách đã quét',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Color(0xFFEEEEEE), // Background color of the AppBar
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _scannedBarcodes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_scannedBarcodes[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.cancel, color: Colors.red),
                    onPressed: () => _removeBarcode(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
