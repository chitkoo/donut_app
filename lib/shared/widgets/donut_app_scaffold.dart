import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DonutAppScaffold extends ConsumerWidget {
  const DonutAppScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.backgroundColor,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.resizeToAvoidBottomInset,
    this.safeArea = true,
  });

  final Widget body;
  final PreferredSizeWidget? appBar;
  final Color? backgroundColor;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final bool? resizeToAvoidBottomInset;
  final bool safeArea;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.listen<AsyncValue<bool>>(connectivityProvider, (previous, next) {
    //   final wasConnected = previous?.value;
    //   final isConnected = next.value;

    //   if (wasConnected == null || isConnected == null) return;
    //   if (wasConnected == isConnected) return;

    //   final messenger = ScaffoldMessenger.maybeOf(context);
    //   if (messenger == null) return;

    //   messenger
    //     ..hideCurrentSnackBar()
    //     ..showSnackBar(
    //       SnackBar(
    //         content: Text(
    //           isConnected ? 'Connection restored' : 'No network connection',
    //         ),
    //         duration: const Duration(seconds: 2),
    //       ),
    //     );
    // });

    return Scaffold(
      appBar: appBar,
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: safeArea
            ? SafeArea(
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: 20.0,
                    vertical: 20.0,
                  ),
                  child: body,
                ),
              )
            : Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: 20.0,
                  vertical: 20.0,
                ),
                child: body,
              ),
      ),
    );
  }
}

final connectivityProvider = StreamProvider<bool>((ref) async* {
  final connectivity = Connectivity();

  bool isConnected(List<ConnectivityResult> results) {
    return results.any((result) => result != ConnectivityResult.none);
  }

  // Initial connectivity status
  yield isConnected(await connectivity.checkConnectivity());

  // Listen for connectivity changes
  await for (final results in connectivity.onConnectivityChanged) {
    yield isConnected(results);
  }
});
