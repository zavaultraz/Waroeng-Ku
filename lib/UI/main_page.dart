part of 'pages.dart';

class MainPage extends StatefulWidget {
  final int initialPage;

  const MainPage({super.key, this.initialPage = 0});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage = 0;

  @override
  void initState(){
    super.initState();
    selectedPage = widget.initialPage;
    pageController = PageController(initialPage: widget.initialPage);
  }


  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          Container(
            color: 'FAFAFC'.toColor(),
          ),
          SafeArea(
            child: PageView(
              controller: pageController,
              onPageChanged: (index){
                setState(() {
                  selectedPage=index;
                });
              },
              children: [
                Center(child: FoodPage(),),
                Center(child: orderHistory(),),
                Center(child: ProfilePages())

              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomButtomNavbar(onTap: (int index){
              setState(() {
                selectedPage =index;
              });
              pageController.jumpToPage(selectedPage);
            }, selectedIndex: selectedPage),
          )
        ],
      ),
    );
  }
}
