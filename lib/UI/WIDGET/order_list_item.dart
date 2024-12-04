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
          height: 90,
          width: 100,
          margin: EdgeInsets.only(right: 16), // Adjusted margin for better spacing
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), // Subtle rounded corners
            image: DecorationImage(
              image: NetworkImage(transaction.food?.picturePath ?? ''),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: itemWidth! - 191, //(80-92+90)
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.food?.name ?? 'no name',
                style: blackFontstyle2.copyWith(fontWeight: FontWeight.w600,fontSize: 18),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Row(
                children: [
                  Text(
                    transaction.quantity.toString() + ' items ~ ',
                    style: blackFontstyl3.copyWith(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 15),
                  ),
                  Text(
                    NumberFormat.currency(
                            symbol: 'IDR', decimalDigits: 0, locale: 'id-ID')
                        .format(transaction.total),
                    style: blackFontstyl3.copyWith(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 13,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(convertDateTimeDisplay(transaction.dateTime!),style: blackFontstyl3.copyWith(fontWeight: FontWeight.w700,fontSize: 13),),
            ),
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
                      : Colors.black,
                  fontWeight: FontWeight.w600,fontSize: 14// Hitam untuk Unknown Status
                ),
              ),
            ),
          ],


        ),
      ],
    );
  }
}
