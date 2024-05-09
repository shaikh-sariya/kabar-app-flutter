import 'package:news_app/core/constants/imports.dart';

class HeadlinesWidget extends StatelessWidget {
  const HeadlinesWidget({required this.index, super.key});
  final int index;

  @override
  Widget build(BuildContext context) {
    String? image;
    String? title;
    String? subtitle;

    switch (index) {
      case 0:
        image = AppImages.crypto;
        title = AppStrings.cryptoCurrencyTitle;
        subtitle = AppStrings.cryptocurrencySubTitle;
      case 1:
        image = AppImages.tourism;
        title = AppStrings.tourismTitle;
        subtitle = AppStrings.tourismSubTitle;
      case 2:
        image = AppImages.healthy;
        title = AppStrings.healthyTitle;
        subtitle = AppStrings.healthySubTitle;
    }
    return Column(
      children: <Widget>[
        Image.asset(image!),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 0.025.sh,
                  bottom: 0.01.sh,
                ),
                child: Text(
                  title!,
                  style: context.theme.textTheme.headlineLarge,
                ),
              ),
              Text(
                subtitle!,
                style: context.theme.textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
