part of 'pages.dart';
class SuccessSignupPages extends StatelessWidget {
  const SuccessSignupPages({super.key});

  @override
  Widget build(BuildContext context) {
    return IllustrationPage(
      title: 'Yeay Complete',
      subtitle: 'Now you are able to order\nsome foods as a self-reward',
      picturePath: 'assets/images/food/food_wishes.png',
      buttonTitle1: 'Find Food',
      buttonTap1: () {},
    );
  }
}
