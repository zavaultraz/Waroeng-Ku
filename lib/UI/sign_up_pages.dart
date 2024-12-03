part of 'pages.dart';

class SignUpPages extends StatefulWidget {
  const SignUpPages({super.key});

  @override
  State<SignUpPages> createState() => _SignUpPagesState();
}

class _SignUpPagesState extends State<SignUpPages> {
  User? users;
  File? pictureFile;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GeneralPage(
        title: "Sign Up",
        subtitle: "Create Account",
        onbackButtonPressed: () {
          Get.back();
        },
        child: Column(
          children: [
            GestureDetector(
              onTap: () async {
                XFile? pickedFile =
                await ImagePicker().pickImage(source: ImageSource.gallery);

                if (pickedFile != null) {
                  pictureFile = File(pickedFile.path);
                  setState(() {});
                }
              },
              child: Container(
                height: 110,
                width: 110,
                margin: EdgeInsets.only(top: 26),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/food/photo_border.png'),
                  ),
                ),
                child: (pictureFile != null)
                    ? Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: FileImage(pictureFile!),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
                    : Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/food/photo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(
                defaultMargin,
                26,
                defaultMargin,
                6,
              ),
              child: Text(
                "Name",
                style: blackFontstyle2.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black)),
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: greyFontStyle.copyWith(fontWeight: FontWeight.w600),
                    hintText: 'type your name'),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(
                defaultMargin,
                26,
                defaultMargin,
                6,
              ),
              child: Text(
                "Email Address",
                style: blackFontstyle2.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black)),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: greyFontStyle.copyWith(fontWeight: FontWeight.w600),
                    hintText: 'type your email address'),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(
                defaultMargin,
                21,
                defaultMargin,
                6,
              ),
              child: Text(
                "Password",
                style: blackFontstyle2.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black)),
              child: TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: greyFontStyle.copyWith(fontWeight: FontWeight.w600),
                    hintText: 'type your password'),
              ),
            ),
            Container(
                width: double.infinity,
                height: 45,
                margin: EdgeInsets.only(top: 24),
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    onPressed: () {

                      if (nameController.text == "" ||
                          emailController.text == "" ||
                          passwordController.text == "") {
                        Get.snackbar("", "",
                            backgroundColor: "D9435E".toColor(),
                            icon: Icon(
                              MdiIcons.closeCircleOutline,
                              color: Colors.white,
                            ),
                            titleText: Text(
                              "Please fill all the field",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            messageText: Text(
                              "We need your name, email, and password to register",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ));
                      } else if (pictureFile == null) {
                        Get.snackbar("", "",
                            backgroundColor: "D9435E".toColor(),
                            icon: Icon(
                              MdiIcons.closeCircleOutline,
                              color: Colors.white,
                            ),
                            titleText: Text(
                              "Please select your profile picture",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            messageText: Text(
                              "We need your profile picture to identify you",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ));
                      } else {
                        Get.to(() => AddressPages(
                          users: User(
                            name: nameController.text,
                            email: emailController.text,
                          ),
                          password: passwordController.text,
                          pictureFile: pictureFile!,
                        ));
                      }
                    },
                    child: Text("CONTINUE",style: blackFontstyl3.copyWith(fontWeight: FontWeight.w600,color: Colors.white,fontSize: 17),))),
          ],
        ),
      ),
    );
  }
}
