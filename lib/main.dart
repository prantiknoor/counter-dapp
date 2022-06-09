import 'package:counter_dapp/homepage.dart';
import 'package:counter_dapp/installation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web3/flutter_web3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Widget destination() {
    // `Ethereum.isSupported` is the same as `ethereum != null`
    if (ethereum != null) {
      try {
        return const HomePage();
      } on EthereumUserRejected {
        print('User rejected the modal');
        return const InstallationPage();
      }
    } else {
      return const InstallationPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: destination(),
    );
  }
}
