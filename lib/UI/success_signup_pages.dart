part of 'pages.dart';
class SuccessSignupPages extends StatelessWidget {
  const SuccessSignupPages({super.key});

  @override
  Widget build(BuildContext context) {
    return IllustrationPage(
      title: 'Sugeng Rawuh',
      subtitle: 'Sudah selesai semua, sekarang saatnya memanjakan diri. Pesan sekarang!',
      picturePath: 'assets/images/food/food_wishes.png',
      buttonTitle1: 'Find Food',
      buttonTap1: () {
        Get.to(MainPage());
      },
    );
  }
}
