part of 'model.dart';

class User extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? address;
  final String? houseNumber;
  final String? phoneNumber;
  final String? city;
  final String? picturePath;
  static String? token;

  User({
    this.id,
    this.name,
    this.email,
    this.address,
    this.houseNumber,
    this.phoneNumber,
    this.city,
    this.picturePath,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    email,
    address,
    houseNumber,
    phoneNumber,
    city,
    picturePath,
  ];

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? address,
    String? houseNumber,
    String? phoneNumber,
    String? city,
    String? picturePath,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      address: address ?? this.address,
      houseNumber: houseNumber ?? this.houseNumber,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      city: city ?? this.city,
      picturePath: picturePath ?? this.picturePath,
    );
  }

  factory User.fromJson(Map<String, dynamic> data) => User(
    id: data['id'],
    name: data['name'],
    email: data['email'],
    address: data['address'],
    houseNumber: data['houseNumber'],
    phoneNumber: data['phoneNumber'],
    city: data['city'],
    picturePath: data['profile_photo_url'],
  );
}

User mockUser = User(
  id: 1,
  name: 'Kadir agfa',
  email: 'kadiraja@gmail.com',
  address: 'Jl.Sudirmat Timur',
  houseNumber: 'No 12d',
  phoneNumber: '08121212120',
  city: 'DKI Jakarta',
  picturePath:
      'https://i.pinimg.com/564x/e4/ed/37/e4ed374e9d27fcc199133be15f82001e.jpg',
);
