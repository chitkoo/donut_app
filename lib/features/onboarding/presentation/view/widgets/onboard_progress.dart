import 'package:donut_app/features/onboarding/presentation/notifiers/auth_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../../configs/theme/app_theme.dart';
import '../../../../../utils/enums/auth_step.dart';

class AuthStepProgress extends HookConsumerWidget {
  const AuthStepProgress({
    super.key,
    // required this.step,
    this.size = 30,
    this.strokeWidth = 8,
  });

  // final AuthStep step;
  final double size;
  final double strokeWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final step = ref.watch(authProvider.select((state) => state.currentStep));

    return SizedBox(
      width: size,
      height: size,
      child: step == .birthday
          ? Icon(
              Icons.check_circle_rounded,
              color: AppColors.progress,
              size: 40,
            )
          : CircularProgressIndicator(
              value: step.progress,
              strokeWidth: strokeWidth,
              strokeCap: StrokeCap.round,
              backgroundColor: AppColors.button,
              valueColor: const AlwaysStoppedAnimation(AppColors.progress),
            ),
      // child: Stack(
      //   alignment: Alignment.center,
      //   children: [
      //     CircularProgressIndicator(
      //       value: step.progress,
      //       strokeWidth: strokeWidth,
      //       strokeCap: StrokeCap.round,
      //       backgroundColor: Colors.grey.shade200,
      //       valueColor: const AlwaysStoppedAnimation(
      //         Color(0xFFF25AA0),
      //       ),
      //     ),
      //     Text(
      //       '${step.stepNumber}/4',
      //       style: const TextStyle(
      //         fontWeight: FontWeight.bold,
      //         fontSize: 12,
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

// class OnboardProgress extends HookWidget {
//   const OnboardProgress({
//     super.key,
//     required this.step,
//     this.size = 48,
//     this.strokeWidth = 5,
//   });

//   final AuthStep step;
//   final double size;
//   final double strokeWidth;

//   @override
//   Widget build(BuildContext context) {
//     final controller = useAnimationController(
//       duration: const Duration(milliseconds: 600),
//     );

//     final animation = useMemoized(
//       () => CurvedAnimation(
//         parent: controller,
//         curve: Curves.easeInOutCubic,
//       ),
//       [controller],
//     );

//     useEffect(() {
//       controller.animateTo(step.progress);
//       return null;
//     }, [step]);

//     return SizedBox(
//       width: size,
//       height: size,
//       child: AnimatedBuilder(
//         animation: animation,
//         builder: (context, child) {
//           return CircularProgressIndicator(
//             value: animation.value,
//             strokeWidth: strokeWidth,
//             strokeCap: StrokeCap.round,
//             backgroundColor: Colors.grey.shade200,
//             valueColor: const AlwaysStoppedAnimation(
//               Color(0xFFF25AA0),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
