import 'package:daladala_smart/src/widgets/app_base_screen.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScannerPage extends StatefulWidget {
  @override
  _QRScannerPageState createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  late QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
      appBar: AppBar(
        title: Text('QR Scanner'),
      ),
      backgroundAuth: false,
      backgroundImage: false,
      isvisible: false,
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      final busHoursService _busesHoursService = await busHoursService();
    final List busesHoursList =
        await _busesHoursService.getBusHours(context, widget.id);
    setState(() {
      hours = busesHoursList;
    });
    return busesHoursList;
      print('Scanned data: ${scanData.code}');
      
    });
  }
}
