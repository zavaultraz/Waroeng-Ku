part of 'widget.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({super.key, this.food});
  final Food? food;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 3,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            Container(
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: NetworkImage(food?.picturePath ?? ''),
                    fit: BoxFit.cover,
                  scale: 1.0
                 ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(12, 12, 12, 6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(food?.name ?? "makan",style: blackFontstyle2,overflow: TextOverflow.ellipsis,maxLines: 1,
                  ),
                  RatingStars(rate: food?.rate,)


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
