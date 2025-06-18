// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pomakspo/src/core/common/providers/haptic_feedback_provider.dart';
import 'package:pomakspo/src/core/common/widgets/buttons/primary_button.dart';
import 'package:pomakspo/src/core/extensions/async_value_extension.dart';
import 'package:pomakspo/src/core/extensions/theme_data_extension.dart';
import 'package:pomakspo/src/core/resources/assets.dart';
import 'package:pomakspo/src/features/auth/presentation/auth_controller.dart';
import 'package:pomakspo/src/features/home/presentation/home_screen.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  static const routePath = '/auth';
  static const name = 'auth';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<void>>(
      authControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    final state = ref.watch(authControllerProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF161531),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: state.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : _buildLoginBody(context, ref),
        ),
      ),
    );
  }

  Widget _buildLoginBody(BuildContext context, WidgetRef ref) {
    Widget loginButton({
      required String iconPath,
      required String text,
      required VoidCallback onTap,
    }) {
      return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 60),
          backgroundColor: context.c.surface.withAlpha(222),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(iconPath),
              width: 30,
              height: 30,
              color:
                  iconPath == LogoAssets.appleLogo ? context.c.onSurface : null,
            ),
            const SizedBox(width: 8),
            Text(
              text,
              style: context.t.bodyLarge!.copyWith(
                color: context.c.onSurface,
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          LogoAssets.companyPinkLogo,
          height: 100,
        ),
        const Spacer(),
        Text(
          'Pohyb, motivace, dobročinnost',
          style: context.t.displaySmall!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        Text(
          'Přidej se k nám a začni pomáhat',
          style: context.t.titleLarge!.copyWith(
            color: Colors.white.withAlpha(180),
          ),
          textAlign: TextAlign.center,
        ),
        const Spacer(),
        PrimaryButton(
          outlined: true,
          text: 'skip',
          onPressed: () => context.goNamed(HomeScreen.name),
        ),
        Text(
          "Začněte přihlášením",
          style: context.t.bodyLarge!.copyWith(
            color: context.c.surface.withAlpha(222),
          ),
        ),
        const SizedBox(height: 16),
        loginButton(
          iconPath: LogoAssets.googleLogo,
          text: 'Sign in with Google',
          onTap: () async {
            ref.read(hapticProvider.notifier).vibrate();
            await ref.read(authControllerProvider.notifier).signInWithGoogle();
          },
        ),
        const SizedBox(height: 22),
        loginButton(
          iconPath: LogoAssets.appleLogo,
          text: 'Sign in with Apple',
          onTap: () async {
            ref.read(hapticProvider.notifier).vibrate();
            await ref.read(authControllerProvider.notifier).signInWithApple();
          },
        ),
      ],
    );
  }
}
