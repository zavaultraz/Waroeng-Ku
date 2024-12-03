part of 'widget.dart';

class FoodListItem extends StatelessWidget {
  const FoodListItem({super.key, this.food, this.itemWidth});
  final Food? food;
  final double? itemWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16), // Padding untuk keseluruhan widget
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20), // Rounded corner
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 12,
              spreadRadius: 6,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar makanan
            Container(
              height: 150,
              width: double.infinity, // Memastikan gambar memenuhi lebar penuh
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(food?.picturePath ?? ''),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 12), // Memberikan jarak antar elemen

            // Nama makanan dan harga
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16), // Padding untuk teks
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nama makanan dengan font size besar dan lebih tebal
                  Text(
                    food?.name ?? 'No Name',
                    style: blackFontstyle2.copyWith(
                      fontSize: 20, // Memperbesar ukuran font
                      fontWeight: FontWeight.w700, // Membuat teks lebih tebal
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  SizedBox(height: 8), // Jarak antara nama dan harga
                  // Harga dengan font yang lebih besar
                  Text(
                    NumberFormat.currency(
                      symbol: 'IDR ',
                      decimalDigits: 0,
                      locale: 'id-ID',
                    ).format(food?.price),
                    style: blackFontstyle2.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12), // Jarak antar harga dan tipe makanan

            // Tipe makanan (jenis makanan)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                spacing: 8, // Jarak antar tipe
                runSpacing: 4, // Jarak antar baris
                children: food?.types?.map((type) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.orange[400],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      type.toString().split('.').last.replaceAll('_', ' '),
                      style: blackFontstyle2.copyWith(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                })?.toList() ?? [],
              ),
            ),
            SizedBox(height: 12), // Jarak antara tipe dan rating

            // Rating makanan
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  RatingStars(
                    rate: food?.rate,
                     // Menambah ukuran rating agar lebih jelas
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}
