import 'package:news_app/core/constants/imports.dart';

class PageIndicatorWidget extends StatelessWidget {
  const PageIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.introductionCubit;

    return ValueListenableBuilder(
      valueListenable: cubit.currentPage,
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
