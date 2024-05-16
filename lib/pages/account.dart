import 'package:flutter/cupertino.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Account'),
        transitionBetweenRoutes: true,
      ),
      child: Center(
        child: Text('Account Page'),
      ),
    );
  }
}
