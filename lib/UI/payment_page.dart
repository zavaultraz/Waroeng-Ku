part of 'pages.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key, required this.transaction});
  final Transaction transaction;

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Payment',
      subtitle: 'Semua berhak makan enak',
      onbackButtonPressed: () {
        Get.back();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(vertical: 12),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Item Order',
                  style: blackFontstyl3.copyWith(fontSize: 20),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                              widget.transaction.food?.picturePath ?? ''),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 13,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                            width: MediaQuery.of(context).size.width - 189,
                            child: Text(
                              widget.transaction.food!.name!,
                              style: blackFontstyle2.copyWith(fontSize: 20),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )),
                        Text(
                          NumberFormat.currency(
                                  symbol: 'IDR ',
                                  decimalDigits: 0,
                                  locale: 'id_ID')
                              .format(widget.transaction.food?.price!),
                          style: blackFontstyle2,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Text(
                        '${widget.transaction.quantity} items',
                        style: greyFontStyle.copyWith(fontSize: 12),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 19,
                ),
                Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  "Datail transaction",
                  style: blackFontstyle2.copyWith(fontSize: 20),
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Text(
                      widget.transaction.food!.name!,
                      style: blackFontstyle2.copyWith(fontSize: 18),
                    ),
                    Spacer(),
                    Text(
                      NumberFormat.currency(
                              symbol: 'IDR ', decimalDigits: 0, locale: 'id_ID')
                          .format(widget.transaction.food?.price!),
                      style: blackFontstyle2.copyWith(fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Text(
                      'Quantity',
                      style: blackFontstyle2.copyWith(fontSize: 18),
                    ),
                    Spacer(),
                    Text(
                      "${widget.transaction.quantity.toString()} items",
                      style: blackFontstyle2.copyWith(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Text(
                      'Sub Total',
                      style: blackFontstyle2.copyWith(fontSize: 18),
                    ),
                    Spacer(),
                    Text(
                      NumberFormat.currency(
                              symbol: 'IDR ', decimalDigits: 0, locale: 'id_ID')
                          .format(widget.transaction.food!.price! *
                              widget.transaction.quantity!),
                      style:
                          blackFontstyle2.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Divider(
                  thickness: 0.5,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Text(
                      'Biaya Admin',
                      style: blackFontstyle2.copyWith(fontSize: 18),
                    ),
                    Spacer(),
                    Text(
                      NumberFormat.currency(
                              symbol: 'IDR ', decimalDigits: 0, locale: 'id_ID')
                          .format(widget.transaction.food!.price! *
                              widget.transaction.quantity! *
                              0.10),
                      style: blackFontstyle2,
                    ),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Text(
                      'Delivery Fee',
                      style: blackFontstyle2.copyWith(fontSize: 18),
                    ),
                    Spacer(),
                    Text(
                      NumberFormat.currency(
                              symbol: 'IDR ', decimalDigits: 0, locale: 'id_ID')
                          .format(20000),
                      style: blackFontstyle2.copyWith(fontSize: 15),
                    ),
                  ],
                ),
                // total
                SizedBox(
                  height: 12,
                ),
                Divider(
                  thickness: 2,
                  color: Colors.black,
                ),
                Row(
                  children: [
                    Text(
                      'TOTAL',
                      style: blackFontstyle2.copyWith(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      NumberFormat.currency(
                              symbol: 'IDR ', decimalDigits: 0, locale: 'id_ID')
                          .format(widget.transaction.total! +
                              (widget.transaction.food!.price! *
                                  widget.transaction.quantity! *
                                  0.1) +
                              20000),
                      style:
                          blackFontstyle2.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                //profile
                SizedBox(
                  height: 20,
                ),
                Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Detail Penerima',
                      style:
                          blackFontstyle2.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          'Penerima',
                          style: blackFontstyle2.copyWith(fontSize: 18),
                        ),
                        Spacer(),
                        Text(
                          widget.transaction.user!.name!,
                          style: blackFontstyle2,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Email',
                          style: blackFontstyle2.copyWith(fontSize: 18),
                        ),
                        Spacer(),
                        Text(
                          widget.transaction.user!.email!,
                          style: blackFontstyle2,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'No Hp',
                          style: blackFontstyle2.copyWith(fontSize: 18),
                        ),
                        Spacer(),
                        Text(
                          widget.transaction.user!.phoneNumber!,
                          style: blackFontstyle2,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Alamat',
                          style: blackFontstyle2.copyWith(fontSize: 18),
                        ),
                        Spacer(),
                        Text(
                          widget.transaction.user!.address!,
                          style: blackFontstyle2,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'No Rumah',
                          style: blackFontstyle2.copyWith(fontSize: 18),
                        ),
                        Spacer(),
                        Text(
                          widget.transaction.user!.houseNumber!,
                          style: blackFontstyle2,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Kota',
                          style: blackFontstyle2.copyWith(fontSize: 18),
                        ),
                        Spacer(),
                        Text(
                          widget.transaction.user!.city!,
                          style: blackFontstyle2,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: mainColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          var paymentURl = await context
                              .read<TransactionCubit>()
                              .submitTransaction(widget.transaction.copyWith(
                                  dateTime: DateTime.now(),
                                  total: (widget.transaction.total! * 1.1)
                                          .toInt() +
                                      20000));
                          if (paymentURl != null) {
                            Get.to(PaymentMethodPage(paymentURL: paymentURl));
                          } else {
                            Get.snackbar(
                              "",
                              "",
                              backgroundColor: "D9435E".toColor(),
                              icon: Icon(
                                MdiIcons.closeCircleMultipleOutline,
                                color: Colors.white,
                              ),
                              titleText: Text(
                                'Sign In Failed',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              messageText: Text(
                                'Please try again',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            );
                          }
                        },
                        child: Text(
                          'Pesan Sekarang',
                          style: blackFontstyle2.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
