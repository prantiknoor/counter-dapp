import 'package:flutter/material.dart';

class InstallationPage extends StatelessWidget {
  const InstallationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Install MateMask",
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }
}
