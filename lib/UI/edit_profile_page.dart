part of 'pages.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController houseNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    var user = (context.read<UserCubit>().state as userLoaded).user;
    nameController.text = user.name ?? '';
    phoneNumberController.text = user.phoneNumber ?? '';
    houseNumberController.text = user.houseNumber ?? '';
    addressController.text = user.address ?? '';
    cityController.text = user.city ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Edit Profile', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: mainColor,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 26),
                _buildLabel("Name"),
                _buildTextField(nameController, 'Type your name', Icons.person),
                SizedBox(height: 20),
                _buildLabel("Phone Number"),
                _buildTextField(
                    phoneNumberController, 'Phone Number', Icons.phone),
                SizedBox(height: 20),
                _buildLabel("Address"),
                _buildTextField(addressController, 'Edit address', Icons.home),
                SizedBox(height: 20),
                _buildLabel("City"),
                _buildTextField(
                    cityController, 'Edit city', Icons.location_city),
                SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 24),
                  height: 45,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: (isLoading == true)
                      ? loadingIndicator
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: mainColor,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10), // Rounded corners
                            ),
                          ),
                          onPressed: () async{
                            setState(() {
                              isLoading == false;
                            });
                            User user = (context.read<UserCubit>().state as userLoaded).user.copyWith(
                              name: nameController.text,
                              phoneNumber: phoneNumberController.text,
                              houseNumber: houseNumberController.text,
                              address: addressController.text,
                              city: cityController.text,
                            );
                            ApiReturnValue<User> result = await UserServices.updateProfile(user);
                            if(result.value != null){
                              context.read<UserCubit>().getUser(result.value!);

                              Get.snackbar(
                                "",
                                "",
                                backgroundColor: "2ECC71".toColor(),
                                icon: Icon(
                                  MdiIcons.checkCircleOutline,
                                  color: Colors.white,
                                ),
                                titleText: Text(
                                  "Update Profile Success",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                messageText: Text(
                                  "Your Profile Has Been Edited",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            }else {
                              Get.snackbar(
                                "",
                                "",
                                backgroundColor: "D9435E".toColor(),
                                icon: Icon(
                                  MdiIcons.closeCircleOutline,
                                  color: Colors.white,
                                ),
                                titleText: Text(
                                  "Update Profile",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                messageText: Text(
                                  "Please Try Again Later",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            }
                            setState(() {
                              isLoading = false;
                            });
                            Get.back();
                            context.read<UserCubit>().getUser(user);
                          }, // No action for now
                          child: Text(
                            "UPDATE PROFILE",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white), // Text style
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String hint, IconData icon) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        style: TextStyle(fontSize: 16),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.grey),
          hintText: hint,
          prefixIcon: Icon(icon, color: mainColor),
          contentPadding: EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }
}
