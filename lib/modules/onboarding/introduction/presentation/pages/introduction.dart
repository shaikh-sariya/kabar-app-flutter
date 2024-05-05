import 'package:news_app/core/constants/imports.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  final currentPage = ValueNotifier<int>(0);
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller,
              // physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return HeadlinesWidget(index: index);
              },
            ),
          ),
          Container(
            height: 0.1.sh,
            margin: EdgeInsets.symmetric(horizontal: 0.05.sw),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                PageIndicatorWidget(currentPage: currentPage),
                const SizedBox(
                  width: 140,
                ),
                TextButton(
                  onPressed: () {},
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
                FilledButton(
                  onPressed: () {},
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
                  child: Text(AppStrings.next),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
