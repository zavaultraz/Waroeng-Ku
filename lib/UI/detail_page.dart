part of 'pages.dart';

class DetailPage extends StatefulWidget {
  const DetailPage(
      {super.key, required this.onBackButtonPressed, this.transaction});
  final Function onBackButtonPressed;
  final Transaction? transaction;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: mainColor,
          ),
          SafeArea(
            child: Container(
              color: Colors.white,
            ),
          ),
          SafeArea(
            child: Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.transaction?.food?.picturePath ??
                        'https://ui-avatars.com/api/?name=${widget.transaction?.food?.picturePath}'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          SafeArea(
            child: ListView(
              children: [
                Container(
                  height: 100,
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultMargin,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        if (widget.onBackButtonPressed != null) {
                          widget.onBackButtonPressed!();
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(3),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.black12,
                        ),
                        child: Image.asset(
                            'assets/images/food/back_arrow_white.png'),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 180),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 26),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            //food name
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${widget.transaction?.food?.name}',
                                style: blackFontstyle2,
                                maxLines: 2,
                              ),
                              SizedBox(
                                width: 24,
                              ),
                              RatingStars(
                                rate: widget.transaction?.food?.rate,
                              )
                            ],
                          ),
                          //food description
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    quantity = max(
                                        1,
                                        quantity -
                                            1); // Decrease quantity with lower limit of 1
                                  });
                                },
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/food/btn_min.png'),
                                      fit: BoxFit
                                          .cover, // Ensure the image fits the container
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 50,
                                child: Text(
                                  quantity.toString(),
                                  textAlign: TextAlign.center,
                                  style: blackFontstyl3.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    quantity = min(
                                        999,
                                        quantity +
                                            1); // Increase quantity with upper limit of 999
                                  });
                                },
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/food/btn_add.png'),
                                      fit: BoxFit
                                          .cover, // Ensure the image fits the container
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      //food description
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 14, 0, 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "DESCRIPTION",
                                  style: blackFontstyle1,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  widget.transaction?.food?.description ?? '',
                                  style: blackFontstyl3,
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 6, 0, 16),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'INGRIDIENTS',
                                      style: blackFontstyle1,
                                      textAlign: TextAlign.justify,
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Icon(
                                      CupertinoIcons.info_circle_fill,
                                      color: mainColor,
                                      size: 20,
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 4, 0, 16),
                                  child: Text(
                                    widget.transaction?.food?.ingredients ?? '',
                                    style: blackFontstyle2,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 16),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 16),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'TOTAL PRICE ',
                                            style: blackFontstyl3,
                                          ),
                                          Icon(
                                            Icons.monetization_on,
                                            color: mainColor,
                                          ),
                                        ],
                                      ),
                                      Text(
                                        NumberFormat.currency(
                                                symbol: 'IDR ',
                                                decimalDigits: 0,
                                                locale: 'id_ID')
                                            .format(
                                                quantity * (widget.transaction!.food?.price?.toInt()?? 0)),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 16,),
                                SizedBox(
                                  width: double.infinity,
                                  height: 45,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: mainColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15)
                                      )
                                    ),
                                    onPressed: (){
                                      Get.to(
                                          PaymentPage
                                            (
                                              transaction: widget.transaction!.copyWith(
                                                quantity: quantity,
                                                total: quantity*(widget.transaction?.food?.price?.toInt() ?? 0),
                                              ),
                                          ),
                                      );
                                    }, child: Text('Pesan Sekarang',style: blackFontstyle2.copyWith(color: Colors.white,fontWeight: FontWeight.bold),),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
