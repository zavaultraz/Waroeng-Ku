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
          // Background Color
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
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                      widget.transaction?.food?.picturePath ??
                          'https://ui-avatars.com/api/?name=${widget.transaction?.food?.picturePath}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SafeArea(
            child: ListView(
              children: [
                // Back Button
                Container(
                  height: 100,
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        if (widget.onBackButtonPressed != null) {
                          widget.onBackButtonPressed!();
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.black12,
                        ),
                        child: Image.asset('assets/images/food/back_arrow_white.png'),
                      ),
                    ),
                  ),
                ),
                // Content Container
                Container(
                  margin: EdgeInsets.only(top: 180),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 26),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, -5))],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Food Name and Rating
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.transaction?.food?.name ?? '',
                                style: blackFontstyle2.copyWith(fontSize: 24, fontWeight: FontWeight.bold,),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 2),
                              RatingStars(rate: widget.transaction?.food?.rate),
                            ],
                          ),
                          // Quantity Control
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    quantity = max(1, quantity - 1); // Decrease quantity
                                  });
                                },
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/food/btn_min.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 50,
                                child: Text(
                                  quantity.toString(),
                                  textAlign: TextAlign.center,
                                  style: blackFontstyl3.copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    quantity = min(999, quantity + 1); // Increase quantity
                                  });
                                },
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/food/btn_add.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      // Food Description
                      Text(
                        "DESCRIPTION",
                        style: blackFontstyle1.copyWith(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 10),
                      Text(
                        widget.transaction?.food?.description ?? '',
                        style: blackFontstyl3.copyWith(fontSize: 14),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 20),
                      // Ingredients Section
                      Row(
                        children: [
                          Text(
                            "INGREDIENTS",
                            style: blackFontstyle1.copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(width: 7),
                          Icon(CupertinoIcons.info_circle_fill, color: mainColor, size: 20),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        widget.transaction?.food?.ingredients ?? '',
                        style: blackFontstyle2.copyWith(fontSize: 14,fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 20),
                      // Total Price Section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'TOTAL PRICE',
                                style: blackFontstyl3.copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                              Icon(Icons.monetization_on, color: mainColor),
                            ],
                          ),
                          Text(
                            NumberFormat.currency(symbol: 'IDR ', decimalDigits: 0, locale: 'id_ID')
                                .format(quantity * (widget.transaction?.food?.price?.toInt() ?? 0)),
                            style: blackFontstyl3.copyWith(fontSize: 16,fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      // Order Button
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: mainColor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          ),
                          onPressed: () {
                            Get.to(
                              PaymentPage(
                                transaction: widget.transaction!.copyWith(
                                  quantity: quantity,
                                  total: quantity * (widget.transaction?.food?.price?.toInt() ?? 0),
                                ),
                              ),
                            );
                          },
                          child: Text(
                            'Pesan Sekarang',
                            style: blackFontstyle2.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
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
