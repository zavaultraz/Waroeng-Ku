part of 'widget.dart';

class FoodListItem extends StatelessWidget {
  const FoodListItem({super.key, this.food, this.itemWidth});
  final Food? food;
  final double? itemWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 80,
          width: 80,
          margin: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: NetworkImage(food?.picturePath ??
                  ''),
              fit: BoxFit.cover,
              scale: 1.0
            ),
          ),
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                food?.name ?? 'no name',
                style: blackFontstyle2,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                NumberFormat.currency(
                  symbol: 'IDR',
                  decimalDigits: 0,
                  locale: 'id-ID',
                ).format(food?.price),
              ),
              Row(
                children: food?.types?.map((type) {
                  return Container(
                    margin: EdgeInsets.only(right: 5),
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.orange[400],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      type.toString().split('.').last.replaceAll('_', ' '),
                      style: blackFontstyle2.copyWith(
                        fontSize: 10,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  );
                })?.toList() ?? [],
              ),
            ],
          ),
        ),
        RatingStars(rate: food?.rate),
      ],
    );
  }

}
