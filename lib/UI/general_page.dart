part of 'pages.dart';

class GeneralPage extends StatelessWidget {
  const GeneralPage({
    super.key,
    this.title = 'Title',
    this.subtitle = "Subtitle",
    this.bgcolor,
    this.onbackButtonPressed,
    this.child,
  });
  final String title;
  final String subtitle;
  final Color? bgcolor;
  final Function? onbackButtonPressed;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
          ),
          SafeArea(
            child: Container(
              color: bgcolor ?? Colors.white,
            ),
          ),
          SafeArea(
            child: ListView(
              children: <Widget>[
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 100,
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        children: [
                          onbackButtonPressed != null
                              ? GestureDetector(
                                  onTap: () {
                                    if (onbackButtonPressed != null){
                                      onbackButtonPressed!();
                                    } ;
                                  },
                                  child: Container(
                                    width: defaultMargin,
                                    height: defaultMargin,
                                    margin: EdgeInsets.only(right: 26),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/food/back_arrow.png')),
                                    ),
                                  ),
                                )
                              : SizedBox(

                                ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                title,
                                style: blackFontstyle1,
                              ),
                              Text(
                                subtitle,
                                style: blackFontstyle2,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  height: defaultMargin,
                  width: double.infinity,
                  color: "A5A5".toColor(),
                ),
                child ?? SizedBox()
              ],
            ),
          ),
        ],
      ),
    );
  }
}