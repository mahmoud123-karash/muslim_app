import 'package:flutter/material.dart';
import 'package:muslim_app/core/cache/save_data.dart';
import 'package:muslim_app/core/shared/assets.dart';
import 'package:muslim_app/core/shared/components.dart';
import 'package:muslim_app/core/styles/text_styles.dart';
import 'package:muslim_app/features/nav_bar/presentation/views/navbar_screen.dart';
import 'package:muslim_app/features/onboarding/presentation/views/widegts/page_view_item_widget.dart';
import 'package:muslim_app/generated/l10n.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController controller = PageController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    List<String> onImages = [
      Assets.imagesOnboarding1,
      Assets.imagesOnboarging2,
      Assets.imagesOnboarding3,
    ];
    List<String> onTitles = [
      S.of(context).on_boarding_1,
      S.of(context).on_boarding_2,
      S.of(context).on_boarding_3,
    ];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                physics: const BouncingScrollPhysics(),
                controller: controller,
                children: List.generate(
                  3,
                  (index) => PageViewItemWidget(
                    image: onImages[index],
                    lable: onTitles[index],
                  ),
                ),
                onPageChanged: (value) {
                  index = value;
                  setState(() {});
                },
              ),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    if (index != 2) {
                      controller.nextPage(
                        duration: const Duration(milliseconds: 900),
                        curve: Curves.decelerate,
                      );
                    } else {
                      saveIsSkip(true);
                      navigateToAndFinish(context, const NavBarScreen());
                    }
                  },
                  child: Text(
                    index == 2 ? S.of(context).start_now : S.of(context).next,
                    style: TextStyles.style14.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (index != 0) const Spacer(),
                if (index != 0)
                  TextButton(
                    onPressed: () {
                      controller.previousPage(
                        duration: const Duration(milliseconds: 900),
                        curve: Curves.decelerate,
                      );
                    },
                    child: Text(
                      S.of(context).previous,
                      style: TextStyles.style14.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
