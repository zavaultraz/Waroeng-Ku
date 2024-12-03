part of 'pages.dart';

class orderHistory extends StatefulWidget {
  const orderHistory({super.key});

  @override
  State<orderHistory> createState() => _orderHistoryState();
}

class _orderHistoryState extends State<orderHistory> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: ()async{
      await context.read<TransactionCubit>().getTransactions();
    },
      child: BlocBuilder<TransactionCubit, TransactionState>(
        builder: (_, state) {
          if (state is TransactionLoaded) {
            if (state.transactions.length == 0) {
              return IllustrationPage(
                title: 'Waduh, Laper Loh!',
                subtitle: 'Kayaknya perutmu lagi ngeluh,Yuk, pesan sekarang !',
                picturePath: 'assets/images/food/laper_icon.png',
                buttonTitle1: 'Cari sekarang',
                buttonTap1: () {},
              );
            } else {
              double listItemWidth =
                  MediaQuery.of(context).size.width - 2 * defaultMargin;
              return ListView(
                children: [
                  Container(
                    color: Colors.white,
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: defaultMargin),
                    padding: EdgeInsets.symmetric(
                        horizontal: defaultMargin, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your Orders',
                          style: blackFontstyle2,
                        ),
                        Text(
                          'Wait for the best meal',
                          style: blackFontstyl3.copyWith(color: greyColor),
                        ),
                        SizedBox(
                          height: 26,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Column(
                      children: [
                        CustomTabbar(
                          selectedIndex: selectedIndex,
                          titles: ['In progres', 'past order'],
                          onTap: (index) {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Builder(
                          builder: (_) {
                            List<Transaction> transaction = (selectedIndex == 0
                                ? state.transactions
                                    .where((e) =>
                                        e.status ==
                                            TransactionStatus.on_delivery ||
                                        e.status == TransactionStatus.pending)
                                    .toList()
                                : state.transactions
                                    .where((e) =>
                                        e.status == TransactionStatus.canceled ||
                                        e.status == TransactionStatus.delivered)
                                    .toList());
                            return Column(
                              children: transaction
                                  .map(
                                    (e) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: ()async{
                                         await launch(e.paymentUrl!);
                                        },
                                        child: OrderListItem(
                                          transaction: e,
                                          itemWidth: listItemWidth,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              );
            }
          } else {
            return Center(
              child: loadingIndicator,
            );
          }
        },
      ),
    );
  }
}
