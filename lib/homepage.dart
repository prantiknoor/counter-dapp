import 'package:counter_dapp/contract.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web3/ethers.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BigInt _counter = BigInt.from(0);
  Contract? counterContract;

  @override
  void initState() {
    super.initState();
    counterContract = getCounterContract();

    getCount().then((value) => _counter = value!);
  }

  Future<BigInt?> getCount() async {
    if (counterContract != null) {
      var response = await counterContract?.call('count');
      return BigInt.parse(response);
    }
    return null;
  }

  void _incrementCounter() async {
    if (counterContract != null) {
      var tx = await counterContract?.send('incrementCount');
      await tx?.wait();
      setState(() {
        _counter += BigInt.one;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
