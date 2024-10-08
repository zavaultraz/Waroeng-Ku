part of 'pages.dart';
class SuccessOrderPage extends StatelessWidget {
  const SuccessOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  IllustrationPage(
      title: 'You have Made Order',
      subtitle: 'Just stay at home while we delivery your food',
      picturePath: 'assets/images/food/bike.png',
      buttonTitle1: 'Order Other Foods',
      buttonTap1: (){
        Get.offAll(MainPage(initialPage : 0));
      },
      buttonTitle2: 'View my order',
      buttonTap2: (){
        Get.offAll(MainPage(initialPage : 1));
      },
    );
  }
}
