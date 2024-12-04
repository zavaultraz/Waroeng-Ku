part of 'pages.dart';

class IllustrationPage extends StatelessWidget {
  const IllustrationPage(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.picturePath,
      required this.buttonTitle1,
      this.buttonTitle2,
      required this.buttonTap1,
      this.buttonTap2});
  final String title;
  final String subtitle;
  final String picturePath;
  final String buttonTitle1;
  final String? buttonTitle2;
  final Function buttonTap1;
  final Function? buttonTap2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              picturePath,
              width: 240,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                title,
                style: blackFontstyle1.copyWith(fontWeight: FontWeight.w600,fontSize: 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                subtitle,
                style: greyFontStyle.copyWith(fontSize: 16,fontWeight: FontWeight.w500),textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: mainColor,
              ),
              onPressed: () {
                buttonTap1();
              },
              child: Text(buttonTitle1,style: blackFontstyl3.copyWith(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 18),),
            ),
            (buttonTap2 == null)
                ? SizedBox()
                : ElevatedButton(
                    onPressed: () {
                      buttonTap2!();
                    },
                    child: Text(buttonTitle2!,style: blackFontstyl3.copyWith(color: mainColor,fontWeight: FontWeight.w700,fontSize: 18),),
                  )
          ],
        ),
      ),
    );
  }
}
