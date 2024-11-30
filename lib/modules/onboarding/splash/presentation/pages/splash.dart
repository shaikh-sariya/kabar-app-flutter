import 'package:news_app/core/constants/imports.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late final SplashCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.splashCubit
      ..controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1500),
      );
    cubit.animation = Tween<double>(begin: 0, end: 1).animate(cubit.controller);
    cubit.controller.forward().then((_) {
      context.pushReplacementNamed(PAGES.introduction.screenName);
    });
  }

  @override
  void dispose() {
    cubit.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
