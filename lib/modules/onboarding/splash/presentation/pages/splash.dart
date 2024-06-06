import 'package:news_app/core/constants/imports.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    final cubit = context.splashCubit
      ..controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1500),
      );
    cubit.animation = Tween<double>(begin: 0, end: 1).animate(cubit.controller);
    cubit.controller.forward().then((_) {
      context.goNamed(PAGES.introduction.screenName);
    });
  }

  @override
  void dispose() {
    final cubit = context.splashCubit;
    cubit.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.splashCubit;
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: cubit.animation,
          child: SvgPicture.asset(AppImages.appLogo),
        ),
      ),
    );
  }
}
