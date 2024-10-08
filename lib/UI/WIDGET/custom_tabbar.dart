part of 'widget.dart';

class CustomTabbar extends StatelessWidget {
  const CustomTabbar({super.key,required this.selectedIndex,required this.titles, this.onTap});
  final int selectedIndex;
  final List<String> titles;
  final Function(int index)? onTap;

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 50,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 48),
            height: 1,
            color: "F2F2F2".toColor(),
          ),
          Row(
            children: titles.map((e) => Padding(
              padding: EdgeInsets.only(left: defaultMargin),
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (onTap != null) {
                              onTap!(titles.indexOf(e));
                            }
                          },
                          child: Text(
                            e,
                            style: (titles.indexOf(e) == selectedIndex)
                                ? blackFontstyl3.copyWith(fontWeight: FontWeight.w500)
                                : blackFontstyl3, // Menambahkan kondisi alternatif jika diperlukan
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 40,
                      height: 3,
                      margin: EdgeInsets.only(top: 13),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: (titles.indexOf(e)==selectedIndex)
                        ? "020202".toColor()
                        :Colors.transparent,
                      ),
                    ),
                  ],
                ),
              ),
            ).toList(),
          ),
        ],
      ),
    );
  }
}
