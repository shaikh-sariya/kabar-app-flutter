import 'package:news_app/core/constants/imports.dart';

class PageIndicatorWidget extends StatelessWidget {
  const PageIndicatorWidget({required this.currentPage, super.key});
  final ValueNotifier<int> currentPage;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: currentPage,
      builder: (context, value, child) {
        return Row(
          children: List.generate(
            3,
            (index) => Container(
              width: 15,
              height: 15,
              margin: EdgeInsets.only(right: 0.015.sw),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index == value ? AppColors.primary : AppColors.body,
              ),
            ),
          ),
        );
      },
    );
  }
}
