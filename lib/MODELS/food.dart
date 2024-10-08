part of 'model.dart';
enum FoodType { new_food, popular, recommended }

class Food extends Equatable {
  final int? id;
  final String? name;
  final String? picturePath;
  final String? description;
  final String? ingredients;
  final double? price;
  final double? rate;
  final List<FoodType>? types;

  Food({
    this.id,
    this.name,
    this.picturePath,
    this.description,
    this.ingredients,
    this.price,
    this.rate,
    this.types = const [],
  });

  factory Food.fromJson(Map<String, dynamic> data) => Food(
    id: data['id'],
    name: data['name'],
    picturePath: data['picturePath'],
    description: data['description'],
    ingredients: data['ingredients'],
    price: data['price'].toDouble(),
    rate: data['rate'].toDouble(),
    types: data['types'].toString().split(',').map((e) {
      switch (e) {
        case 'new_food':
          return FoodType.new_food;
        case 'popular':
          return FoodType.popular;
        case 'recomended':
          return FoodType.recommended;
        default:
          return FoodType.new_food;
      }
    }).toList(),
  );


  @override
  List<Object?> get props => [
    id,
    name,
    picturePath,
    description,
    ingredients,
    price,
    rate,
  ];
}


List<Food> mockFoods = [
  Food(
      id: 1,
      picturePath: 'https://i.pinimg.com/236x/5b/f2/7e/5bf27e721ed7bc858e0a7f0d905632e8.jpg',
      name: 'Sate Sayur Sultan',
      description: 'Sate Sayur Sultan adalah menu sate vegan paling terkenal di Jakarta. Sate ini dibuat dari berbagai macam bahan berkualitas terbaik dan langsung dibuat oleh chef handal. Sate ini sangat sehat dan bergizi.',
      price: 150000,
      rate: 4.2,
      ingredients: 'daging pilihan, rempah, kasih sayang',
    types: [FoodType.new_food],
  ),
  Food(
      id: 2,
      picturePath: 'https://i.pinimg.com/236x/e4/c8/ac/e4c8ac48c71738d0493b6e824f0094ed.jpg',
      name: 'Nasi Goreng Kambing',
      description: 'Nasi Goreng Kambing spesial dengan bumbu rempah rahasia yang kaya akan cita rasa. Cocok untuk Anda yang menggemari makanan gurih dan pedas.',
      price: 25000,
      rate: 4.5,
      ingredients: 'beras, kambing, bawang merah, bawang putih, cabai, kecap manis, rempah-rempah',
    types: [FoodType.recommended],
  ),
  Food(
      id: 3,
      picturePath: 'https://i.pinimg.com/236x/1a/b7/ee/1ab7ee51c29e366c9c47311773c09dde.jpg',
      name: 'Mie Ayam Jamur',
      description: 'Mie Ayam Jamur dengan topping ayam yang empuk dan jamur yang segar, disajikan dengan kuah kaldu yang lezat.',
      price: 20000,
      rate: 4.7,
      ingredients: 'mie, ayam, jamur, bawang putih, bawang merah, kaldu ayam, daun bawang',
    types: [FoodType.popular],
  ),
  Food(
      id: 4,
      picturePath: 'https://i.pinimg.com/236x/80/a9/1a/80a91a42cea42a2dcda727a48847642c.jpg',
      name: 'Bakso Beranak',
      description: 'Bakso Beranak dengan ukuran jumbo berisi bakso kecil di dalamnya. Sangat cocok untuk pecinta makanan berkuah.',
      price: 30000,
      rate: 4.3,
      ingredients: 'daging sapi, tepung tapioka, bawang putih, telur, bumbu bakso, kaldu'
  ),
  Food(
      id: 5,
      picturePath: 'https://i.pinimg.com/236x/20/80/e0/2080e0aeb6d1d9c91b990892dcbbb455.jpg',
      name: 'Ayam Bakar Taliwang',
      description: 'Ayam Bakar khas Lombok dengan bumbu pedas dan gurih, disajikan dengan plecing kangkung dan sambal terasi.',
      price: 50000,
      rate: 4.8,
      ingredients: 'ayam, bumbu taliwang (cabai, bawang merah, bawang putih, terasi, kemiri), plecing kangkung',
    types: [FoodType.new_food],
  ),
  Food(
      id: 6,
      picturePath: 'https://i.pinimg.com/236x/6f/b7/f9/6fb7f9d36a80ee104e5a417ec2287b15.jpg',
      name: 'Gado-Gado Jakarta',
      description: 'Gado-Gado dengan sayuran segar, tahu, tempe, dan lontong, disiram saus kacang kental yang gurih.',
      price: 20000,
      rate: 4.6,
      ingredients: 'sayuran segar, tahu, tempe, lontong, saus kacang (kacang tanah, gula merah, cabai, bawang putih, air asam)',
    types: [FoodType.popular],
  ),
  Food(
      id: 7,
      picturePath: 'https://i.pinimg.com/236x/6e/35/3d/6e353dfdcef71ce2f3dfe363390cb6b4.jpg',
      name: 'Es Cendol Durian',
      description: 'Minuman es cendol dengan topping buah durian yang manis dan creamy, cocok untuk menghilangkan dahaga.',
      price: 25000,
      rate: 4.4,
      ingredients: 'cendol, buah durian, santan, gula merah, es',
    types: [FoodType.popular],
  ),
  Food(
    id: 8,
    picturePath: 'https://img.freepik.com/free-photo/front-view-chicken-burger-with-cheese-green-salad-wooden-desk-sandwich-fast-food-meal-food_140725-25937.jpg?t=st=1727229339~exp=1727232939~hmac=7ebeb79027a71c9f02d5dcb728ad78bb05b4273f1a6eab70ff335e6865222b55&w=996',
    name: 'Burger Keju',
    description: 'Burger juicy dengan keju leleh, sayuran segar, dan saus spesial.',
    price: 35000,
    rate: 4.6,
    ingredients: 'daging sapi, roti burger, keju, selada, saus',
    types: [FoodType.popular],
  ),
  Food(
    id: 9,
    picturePath: 'https://img.freepik.com/free-photo/crispy-french-fries-with-ketchup-mayonnaise_1150-26588.jpg?ga=GA1.1.1885645576.1710291338&semt=ais_hybrid',
    name: 'Kentang Goreng',
    description: 'Kentang goreng renyah yang sempurna untuk teman makan.',
    price: 15000,
    rate: 4.5,
    ingredients: 'kentang, minyak goreng, garam',
    types: [FoodType.popular],
  ),
  Food(
    id: 10,
    picturePath: 'https://img.freepik.com/free-photo/fried-chicken-french-fries-black-cement-floor_1150-28542.jpg?ga=GA1.1.1885645576.1710291338&semt=ais_hybrid',
    name: 'Ayam Goreng Crispy',
    description: 'Ayam goreng crispy dengan bumbu rahasia, gurih dan lezat.',
    price: 40000,
    rate: 4.8,
    ingredients: 'ayam, bumbu, tepung panir',
    types: [FoodType.popular],
  ),
  Food(
    id: 11,
    picturePath: 'https://img.freepik.com/free-photo/fresh-tasty-hot-dog-with-fried-potatoes_144627-24398.jpg?ga=GA1.1.1885645576.1710291338&semt=ais_hybrid',
    name: 'Hot Dog',
    description: 'Sosis lezat dalam roti dengan saus tomat dan mustard.',
    price: 20000,
    rate: 4.3,
    ingredients: 'roti hot dog, sosis, saus tomat, mustard',
  ),
  Food(
    id: 12,
    picturePath: 'https://img.freepik.com/free-photo/slice-crispy-pizza-with-meat-cheese_140725-6974.jpg?ga=GA1.1.1885645576.1710291338&semt=ais_hybrid',
    name: 'Pizza Margherita',
    description: 'Pizza dengan saus tomat, keju mozzarella, dan daun basil.',
    price: 70000,
    rate: 4.7,
    ingredients: 'tepung, saus tomat, keju mozzarella, basil',
    types: [FoodType.new_food]
  ),
  Food(
    id: 13,
    picturePath: 'https://img.freepik.com/free-photo/delicious-taco-studio_23-2150770607.jpg?ga=GA1.1.1885645576.1710291338&semt=ais_hybrid',
    name: 'Taco',
    description: 'Taco isi daging, sayuran, dan salsa segar.',
    price: 25000,
    rate: 4.4,
    ingredients: 'tortilla, daging, sayuran, salsa',
      types: [FoodType.new_food,FoodType.recommended]
  ),
  Food(
    id: 14,
    picturePath: 'https://img.freepik.com/free-photo/mexican-nacho-chips-salsa-dip-bowl_2829-14457.jpg?ga=GA1.1.1885645576.1710291338&semt=ais_hybrid',
    name: 'Nachos Keju',
    description: 'Nachos renyah dengan lelehan keju dan jalapeño.',
    price: 30000,
    rate: 3,
    ingredients: 'nachos, keju, jalapeño, saus salsa',
      types: [FoodType.new_food,FoodType.recommended]
  ),
  Food(
    id: 15,
    picturePath: 'https://img.freepik.com/free-photo/flat-lay-salad-with-chicken-sesame-seeds_23-2148700369.jpg?t=st=1727229752~exp=1727233352~hmac=a6fd553a9e93efbf090862acd551ae84292488ac738a3259ab7f781abb4f1dec&w=996',
    name: 'Salad Caesar',
    description: 'Salad segar dengan potongan ayam, croutons, dan saus Caesar.',
    price: 20000,
    rate: 4,
    ingredients: 'selada romaine, ayam, croutons, saus Caesar',
      types: [FoodType.recommended]
  ),
  Food(
    id: 16,
    picturePath: 'https://img.freepik.com/free-photo/side-view-shawarma-with-fried-potatoes-board-cookware_176474-3215.jpg?t=st=1727229789~exp=1727233389~hmac=43860e8e76ac72ec7d46a18f9f8ca4b7718910f0bb830b6ca74d71766b30f8de&w=740',
    name: 'Kebab',
    description: 'Kebab daging dengan sayuran segar dan saus yogurt.',
    price: 18000,
    rate: 4.5,
    ingredients: 'daging, roti pita, sayuran, saus yogurt',
      types: [FoodType.recommended]
  ),
];


