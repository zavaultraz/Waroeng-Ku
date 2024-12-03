part of 'widget.dart';

class RatingStars extends StatelessWidget {
  const RatingStars({super.key, this.rate});
final double? rate;

  @override
  Widget build(BuildContext context) {
    int? numberOfStar =rate?.round();
    return Row(
      children: List<Widget>.generate(
        5,
            (index) => Icon(
            index < numberOfStar! ? MdiIcons.star : MdiIcons.starOutline,
              size: 20,
              color: mainColor,
        ),
      ) + [
        SizedBox(width: 4,),
        Text(rate.toString(),style: blackFontstyl3.copyWith(fontSize: 13,fontWeight: FontWeight.w700),),
      ],
    );
  }
}
