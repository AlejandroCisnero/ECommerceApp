import 'package:e_commerce_app/routes/checkout.dart';
import 'package:flutter/material.dart';

class SetupFlow extends StatefulWidget {
  const SetupFlow({Key? key, required this.setupPageRoute}) : super(key: key);

  final String setupPageRoute;

  @override
  State<SetupFlow> createState() => _SetupFlowState();
}

class _SetupFlowState extends State<SetupFlow> {
  PreferredSizeWidget _buildFlowAppBar() {
    return AppBar(
      title: const Text('Bulb Setup'),
    );
  }

  Future<void> _onExitPressed() async {
    final isConfirmed = await _isExitDesired();

    if (isConfirmed && mounted) {
      _exitSetup();
    }
  }

  Future<bool> _isExitDesired() async {
    return await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Are you sure?'),
                content: const Text(
                    'If you exit device setup, your progress will be lost.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: const Text('Leave'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: const Text('Stay'),
                  ),
                ],
              );
            }) ??
        false;
  }

  void _exitSetup() {
    Navigator.of(context).pop();
  }

  final _navigatorKey = GlobalKey<NavigatorState>();

  void _onCheckOut() {
    _navigatorKey.currentState!.pushNamed(routeCheckoutStart);
  }

  void _onChekoutAddress(String deviceId) {
    _navigatorKey.currentState!.pushNamed(routeCheckoutAddress);
  }

  void _onCheckoutPayment() {
    _navigatorKey.currentState!.pushNamed(routeCheckoutPayment);
  }

  void _onCheckoutOrder() {
    _navigatorKey.currentState!.pushNamed(routeCheckoutOrder);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _isExitDesired,
      child: Scaffold(
        appBar: _buildFlowAppBar(),
        body: Navigator(
          key: _navigatorKey,
          initialRoute: widget.setupPageRoute,
          onGenerateRoute: _onGenerateRoute,
        ),
      ),
    );
  }
}

Route _onGenerateRoute(RouteSettings settings) {
  late Widget page;
  switch (settings.name) {
    case routeCheckoutStartPage:
      page = WaitingPage(
        message: 'Searching for nearby bulb...',
        onWaitComplete: _onDiscoveryComplete,
      );
      break;
    case routeDeviceSetupSelectDevicePage:
      page = SelectDevicePage(
        onDeviceSelected: _onDeviceSelected,
      );
      break;
    case routeDeviceSetupConnectingPage:
      page = WaitingPage(
        message: 'Connecting...',
        onWaitComplete: _onConnectionEstablished,
      );
      break;
    case routeDeviceSetupFinishedPage:
      page = FinishedPage(
        onFinishPressed: _exitSetup,
      );
      break;
  }

  return MaterialPageRoute<dynamic>(
    builder: (context) {
      return page;
    },
    settings: settings,
  );
}
