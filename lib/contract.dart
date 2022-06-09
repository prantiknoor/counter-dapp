import 'package:flutter_web3/ethereum.dart';
import 'package:flutter_web3/ethers.dart';

Contract? getCounterContract() {
  String contractAddress = '';
  List contractABI = [
    {
      "inputs": [],
      "name": "count",
      "outputs": [
        {"internalType": "uint256", "name": "", "type": "uint256"}
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "incrementCounter",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    }
  ];

  if (ethereum != null) {
    Web3Provider provider = Web3Provider(ethereum);
    return Contract(contractAddress, contractABI, provider.getSigner());
  } else {
    print('install ethereum');
    return null;
  }
}
