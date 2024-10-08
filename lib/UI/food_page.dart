part of 'pages.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int selectedIndex = 0;
  @override
  void initState(){
    context.read<FoodCubit>().getFoods();
    super.initState();
  }
  void onRefresh(){
    context.read<FoodCubit>().getFoods();
  }

  @override
  Widget build(BuildContext context) {
    double listItemWidth =
        MediaQuery.of(context).size.width - 2 * defaultMargin;
    return ListView(
      children: [
        //header
        Container(
          color: Colors.white,
          height: 100,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Mangan Kuy",
                    style: blackFontstyle1,
                  ),
                  Text(
                    'Mau makan apa hari ini',
                    style: blackFontstyle2,
                  ),
                ],
              ),
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      (context.read<UserCubit>().state as userLoaded)
                          .user
                          .picturePath ??
                          'https://ui-avatars.com/api/?name=${(context.read<UserCubit>().state as userLoaded)}',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
        //cardlayout
        Container(
          height: 220,
          width: double.infinity,
          margin: EdgeInsets.symmetric(
            vertical: defaultMargin,
          ),
          child: BlocBuilder<FoodCubit, FoodState>(
            builder: (_, state) => (state is FoodLoaded)
                ? ListView(
              scrollDirection: Axis.horizontal,
              children: state.foods.map((food) => Padding(
                padding: EdgeInsets.only(
                    left: (food == state.foods.first) ? defaultMargin : 0,
                    right: defaultMargin),
                child: GestureDetector(
                  onTap: () {
                    Get.to(
                      DetailPage(
                        onBackButtonPressed: () {
                          Get.back();
                        },
                        transaction: Transaction(
                            food: food,
                            user: (context.read<UserCubit>().state
                            as userLoaded)
                                .user),
                      ),
                    )!.then((value){
                      //method refresh
                      onRefresh();
                    });
                  },
                  child: FoodCard(food: food),
                ),
              )).toList(),
            )
                : Center(),
          ),

        ),
        //tablayout
        Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              CustomTabbar(
                selectedIndex: selectedIndex,
                titles: ['All', 'New Taste', 'Popular', 'Recommended'],
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
              SizedBox(height: 16),
              BlocBuilder<FoodCubit, FoodState>(
                builder: (_, state) {
                  if (state is FoodLoaded) {
                    List<Food> foods;

                    // Adjust filtering logic based on selectedIndex
                    if (selectedIndex == 0) {
                      foods = state.foods; // Show all foods
                    } else {
                      FoodType filterType;
                      switch (selectedIndex) {
                        case 1:
                          filterType = FoodType.new_food;
                          break;
                        case 2:
                          filterType = FoodType.popular;
                          break;
                        case 3:
                          filterType = FoodType.recommended;
                          break;
                        default:
                          filterType = FoodType.new_food; // Fallback
                      }
                      foods = state.foods.where((e) => e.types?.contains(filterType) ?? false).toList();
                    }

                    return Column(
                      children: foods
                          .map(
                            (e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(
                                DetailPage(
                                  onBackButtonPressed: () {
                                    Get.back();
                                  },
                                  transaction: Transaction(
                                    food: e,
                                    user: (context.read<UserCubit>().state as userLoaded).user,
                                  ),
                                ),
                              );
                            },
                            child: FoodListItem(
                              food: e,
                              itemWidth: listItemWidth,
                            ),
                          ),
                        ),
                      )
                          .toList(),
                    );
                  } else {
                    return Center(
                      child: loadingIndicator,
                    );
                  }
                },
              ),
              SizedBox(height: 80),
            ],
          ),
        )

      ],
    );
  }
}
