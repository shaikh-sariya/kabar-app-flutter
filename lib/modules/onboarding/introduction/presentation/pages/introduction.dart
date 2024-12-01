import 'package:news_app/core/constants/imports.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  late final IntroductionCubit cubit;
  final _prefs = SharedPreferencesWithCache.create(
    cacheOptions: const SharedPreferencesWithCacheOptions(
      allowList: <String>{'welcomeCompleted'},
    ),
  );

  @override
  void didChangeDependencies() {
    cubit = context.introductionCubit..controller = PageController();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    cubit.controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.introductionCubit;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: cubit.controller,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return HeadlinesWidget(index: index);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const PageIndicatorWidget(),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          if (cubit.currentPage.value != 0) {
                            cubit.currentPage.value -= 1;
                            cubit.controller?.animateToPage(
                              cubit.currentPage.value,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          }
                        },
                        child: Text(
                          AppStrings.back,
                          style: const TextStyle(
                            color: Color(0xFFB0B3B8),
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ValueListenableBuilder(
                        valueListenable: cubit.currentPage,
                        builder: (context, value, child) {
                          return FilledButton(
                            onPressed: () async {
                              if (cubit.currentPage.value != 2) {
                                cubit.currentPage.value += 1;
                                await cubit.controller?.animateToPage(
                                  cubit.currentPage.value,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeIn,
                                );
                              } else {
                                final prefs = await _prefs;
                                await prefs.setBool('welcomeCompleted', true);
                                if (context.mounted) {
                                  context.pushReplacementNamed(
                                    PAGES.login.screenName,
                                  );
                                }
                              }
                            },
                            style: FilledButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 13,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              backgroundColor: AppColors.primary,
                            ),
                            child: Text(
                              value == 2
                                  ? AppStrings.getStarted
                                  : AppStrings.next,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
