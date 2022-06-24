import 'package:e_commerce_app/routes/checkout.dart';
import 'package:e_commerce_app/screens/checkout/shipping_screen.dart';
import 'package:flutter/material.dart';

class SetupFlow extends StatefulWidget {
  const SetupFlow({Key? key, required this.setupPageRoute}) : super(key: key);

  final String setupPageRoute;

  @override
  State<SetupFlow> createState() => _SetupFlowState();
}

class _SetupFlowState extends State<SetupFlow> {
  String title = 'Titulo';

  void _onCheckOut() {
    _navigatorKey.currentState!.pushNamed(routeCheckoutStart);
  }

  void _onChekoutShipping(String deviceId) {
    _navigatorKey.currentState!.pushNamed(routeCheckoutAddress);
  }

  void _onCheckoutPayment() {
    _navigatorKey.currentState!.pushNamed(routeCheckoutPayment);
  }

  void _onCheckoutOrder() {
    _navigatorKey.currentState!.pushNamed(routeCheckoutOrder);
  }

  PreferredSizeWidget _buildFlowAppBar() {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
      ),
      centerTitle: true,
      leading: Icon(
        Icons.arrow_back_ios,
        color: Theme.of(context).colorScheme.onBackground,
      ),
      elevation: 0,
      shadowColor: Colors.transparent,
      backgroundColor: Colors.transparent,
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
                      _exitSetup();
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

  @override
  Widget build(BuildContext context) {
    void _changeAppBarTitle(String newTitle) {
      setState(() {
        title = newTitle;
      });
    }

    return WillPopScope(
      onWillPop: _isExitDesired,
      child: Scaffold(
        body: Navigator(
          key: _navigatorKey,
          initialRoute: widget.setupPageRoute,
          onGenerateRoute: _onGenerateRoute,
        ),
      ),
    );
  }

  Route _onGenerateRoute(RouteSettings settings) {
    late Widget page;
    switch (settings.name) {
      case routeCheckoutStartPage:
        page = ShippingScreen(_onChekoutShipping, _isExitDesired);
        break;
      case routeCheckoutAddress:
        page = const Center(
          child: Text("Ya la pusiste"),
        );
        break;
      // case routeDeviceSetupConnectingPage:
      //   page = WaitingPage(
      //     message: 'Connecting...',
      //     onWaitComplete: _onConnectionEstablished,
      //   );
      //   break;
      // case routeDeviceSetupFinishedPage:
      //   page = FinishedPage(
      //     onFinishPressed: _exitSetup,
      //   );
      //   break;
    }

    return MaterialPageRoute<dynamic>(
      builder: (context) {
        return page;
      },
      settings: settings,
    );
  }
}

class WaitingPage extends StatefulWidget {
  const WaitingPage({
    Key? key,
    required this.message,
    required this.onWaitComplete,
  }) : super(key: key);

  final String message;
  final VoidCallback onWaitComplete;

  @override
  _WaitingPageState createState() => _WaitingPageState();
}

class _WaitingPageState extends State<WaitingPage> {
  @override
  void initState() {
    super.initState();
    _startWaiting();
  }

  Future<void> _startWaiting() async {
    await Future<dynamic>.delayed(const Duration(seconds: 3));

    if (mounted) {
      widget.onWaitComplete();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 32),
              Text(widget.message),
            ],
          ),
        ),
      ),
    );
  }
}
