part of 'widget.dart';

class OrderListItem extends StatelessWidget {
  const OrderListItem(
      {super.key, required this.itemWidth, required this.transaction});
  final Transaction transaction;
  final double itemWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 80,
          width: 80,
          margin: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image: NetworkImage(transaction.food?.picturePath ??
                    'https://ui-avatars.com/api/?name=${transaction.food?.name}'),
                fit: BoxFit.cover),
          ),
        ),
        SizedBox(
          width: itemWidth! - 182, //(80-92+90)
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.food?.name ?? 'no name',
                style: blackFontstyle2,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Row(
                children: [
                  Text(
                    transaction.quantity.toString() + ' items ~ ',
                    style: blackFontstyl3,
                  ),
                  Text(
                    NumberFormat.currency(
                            symbol: 'IDR', decimalDigits: 0, locale: 'id-ID')
                        .format(transaction.total),
                  ),
                ],
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(convertDateTimeDisplay(transaction.dateTime!),style: blackFontstyl3,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12), // Padding untuk teks
              decoration: BoxDecoration(
                color: transaction.status == TransactionStatus.delivered
                    ? Colors.green.withOpacity(0.2) // Hijau transparan untuk Delivered
                    : transaction.status == TransactionStatus.canceled
                    ? Colors.red.withOpacity(0.2) // Merah transparan untuk Cancelled
                    : transaction.status == TransactionStatus.on_delivery
                    ? Colors.blue.withOpacity(0.2) // Biru transparan untuk On Delivery
                    : transaction.status == TransactionStatus.pending
                    ? Colors.yellow.withOpacity(0.2) // Kuning transparan untuk Pending
                    : Colors.grey.withOpacity(0.2), // Abu-abu transparan untuk Unknown Status
                borderRadius: BorderRadius.circular(8), // Border radius
              ),
              child: Text(
                transaction.status == TransactionStatus.delivered
                    ? 'Delivered'
                    : transaction.status == TransactionStatus.canceled
                    ? 'Cancelled'
                    : transaction.status == TransactionStatus.on_delivery
                    ? 'On Delivery'
                    : transaction.status == TransactionStatus.pending
                    ? 'Pending'
                    : 'Unknown Status',
                style: TextStyle(
                  color: transaction.status == TransactionStatus.delivered
                      ? Colors.green // Hijau untuk Delivered
                      : transaction.status == TransactionStatus.canceled
                      ? Colors.red // Merah untuk Cancelled
                      : transaction.status == TransactionStatus.on_delivery
                      ? Colors.blue // Biru untuk On Delivery
                      : transaction.status == TransactionStatus.pending
                      ? Colors.orangeAccent // Kuning untuk Pending
                      : Colors.black, // Hitam untuk Unknown Status
                ),
              ),
            ),
          ],


        ),
      ],
    );
  }
}
