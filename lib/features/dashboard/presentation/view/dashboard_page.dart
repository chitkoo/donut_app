import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../auth/presentation/notifier/auth_session_provider.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    // final user = ref.watch(authSessionProvider.select((state) => state));
     final session = ref.watch(authSessionProvider);

  final user = session.asData?.value?.user;

    return Scaffold(body: Center(child: Text("Welcome ${user?.fullName}")));
  }
}
