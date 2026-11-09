import 'package:donut_app/features/auth/presentation/notifier/auth_session_provider.dart';
import 'package:donut_app/shared/widgets/donut_app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      child: Center(
        child: DonutAppButton(
          width: 150,
          onPressed: () => _showLogoutDialog(context, ref),
          text: 'Logout',
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(dialogContext);

                await ref.read(authSessionProvider.notifier).logout();
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}
