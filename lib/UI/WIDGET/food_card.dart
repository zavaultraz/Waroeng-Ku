part of 'widget.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({super.key, this.food});
  final Food? food;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 12,
              spreadRadius: 6,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Gambar bagian atas dengan border-radius yang lebih halus
            Container(
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(food?.picturePath ?? ''),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Membuat bagian nama dan rating menjadi fleksibel
            Expanded( // Wrap this container in an Expanded widget
              child: Container(
                margin: EdgeInsets.fromLTRB(16, 5, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      food?.name ?? "Makan",
                      style: blackFontstyle2.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(height: 0),
                    RatingStars(
                      rate: food?.rate,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
