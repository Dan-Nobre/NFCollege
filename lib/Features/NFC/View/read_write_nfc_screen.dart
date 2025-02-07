import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:provider/provider.dart';

class ReadWriteNFCScreen extends StatelessWidget {
  const ReadWriteNFCScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NFCNotifier(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("NFC READ/WRITE"),
        ),
        body: Builder(
          builder: (BuildContext context) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        scanningDialog(context);
                        Provider.of<NFCNotifier>(context, listen: false)
                            .startNFCOperation(nfcOperation: NFCOperation.read);
                      },
                      child: const Text("READ NFC")),
                  Consumer<NFCNotifier>(builder: (context, provider, _) {
                    if (provider.isProcessing) {
                      return const CircularProgressIndicator();
                    }
                    if (provider.message.isNotEmpty) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Navigator.pop(context);
                        showResultDialog(context, provider.message);
                      });
                    }
                    return Column(
                      children: [
                        if (provider.nfcIdentifier.isNotEmpty)
                          Text("NFC Identifier: ${provider.nfcIdentifier}"),
                        if (provider.nfcIdentifier.isNotEmpty)
                          ElevatedButton(
                            onPressed: () {
                              provider.saveNFCIdentifier();
                            },
                            child: const Text("Save NFC Identifier"),
                          ),
                        if (provider.savedIdentifiers.isNotEmpty)
                          Column(
                            children: [
                              const Text("Saved Identifiers:"),
                              ...provider.savedIdentifiers.map((identifier) {
                                return Text(identifier);
                              }).toList(),
                            ],
                          ),
                      ],
                    );
                  }),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void scanningDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text("Scanning NFC"),
          content: Text("Please hold your device near the NFC tag."),
        );
      },
    );
  }

  void showResultDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Result"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}

class NFCNotifier extends ChangeNotifier {
  bool _isProcessing = false;
  String _message = "";
  String _nfcIdentifier = "";
  List<String> _savedIdentifiers = [];

  bool get isProcessing => _isProcessing;

  String get message => _message;

  String get nfcIdentifier => _nfcIdentifier;

  List<String> get savedIdentifiers => _savedIdentifiers;

  Future<void> startNFCOperation(
      {required NFCOperation nfcOperation, String dataType = ""}) async {
    try {
      _isProcessing = true;
      notifyListeners();

      bool isAvail = await NfcManager.instance.isAvailable();

      if (isAvail) {
        if (nfcOperation == NFCOperation.read) {
          _message = "Scanning";
        } else if (nfcOperation == NFCOperation.write) {
          _message = "Writing To Tag";
        }

        notifyListeners();

        NfcManager.instance.startSession(onDiscovered: (NfcTag nfcTag) async {
          if (nfcOperation == NFCOperation.read) {
            _readFromTag(tag: nfcTag);
          } else if (nfcOperation == NFCOperation.write) {
            _writeToTag(nfcTag: nfcTag, dataType: dataType);
            _message = "DONE";
          }

          _isProcessing = false;
          notifyListeners();
          await NfcManager.instance.stopSession();
        }, onError: (e) async {
          _isProcessing = false;
          _message = e.toString();
          notifyListeners();
        });
      } else {
        _isProcessing = false;
        _message = "Please Enable NFC From Settings";
        notifyListeners();
      }
    } catch (e) {
      _isProcessing = false;
      _message = e.toString();
      notifyListeners();
    }
  }

  Future<void> _readFromTag({required NfcTag tag}) async {
    Map<String, dynamic> nfcData = {
      'nfca': tag.data['nfca'],
      'mifareultralight': tag.data['mifareultralight'],
      'ndef': tag.data['ndefformatable']
    };

    if (nfcData.containsKey('ndef')) {
      var ndef = nfcData['ndef'];
      var identifier = ndef["identifier"];
      _nfcIdentifier = String.fromCharCodes(identifier);
      _message = "NFC Identifier: $_nfcIdentifier";
    } else {
      _message = "No Data Found";
    }
  }

  void saveNFCIdentifier() {
    _savedIdentifiers.add(_nfcIdentifier);
    notifyListeners();
  }

  Future<void> _writeToTag(
      {required NfcTag nfcTag, required String dataType}) async {
    NdefMessage message = _createNdefMessage(dataType: dataType);
    await Ndef.from(nfcTag)?.write(message);
  }

  NdefMessage _createNdefMessage({required String dataType}) {
    switch (dataType) {
      case 'URL':
        {
          return NdefMessage([
            NdefRecord.createUri(
              Uri.parse("https://www.devadnani.com"),
            ),
          ]);
        }
      case 'MAIL':
        {
          String emailData = 'mailto:devadnani26@gmail.com';
          return NdefMessage(
            [
              NdefRecord.createUri(
                Uri.parse(emailData),
              ),
            ],
          );
        }
      case 'CONTACT':
        {
          String contactData =
              'BEGIN:VCARD\nVERSION:2.1\nN:John Doe\nTEL:+1234567890\nEMAIL:devadnani26@gmail.com\nEND:VCARD';
          Uint8List contactBytes = utf8.encode(contactData);
          return NdefMessage([
            NdefRecord.createMime(
              'text/vcard',
              contactBytes,
            )
          ]);
        }
      default:
        return const NdefMessage([]);
    }
  }
}

enum NFCOperation { read, write }