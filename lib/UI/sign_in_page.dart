part of 'pages.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GeneralPage(
        title: "Sign In",
        subtitle: "Find your best ever meal",
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
              child: Text(
                "Email Address",
                style: blackFontstyle2,
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black,
                  )),
              child: TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: greyFontStyle,
                    hintText: 'Type your email address'),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
              child: Text(
                "Password",
                style: blackFontstyle2,
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black,
                  )),
              child: TextField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: greyFontStyle,
                    hintText: 'Type your password'),
              ),
            ),
            Container(
              width: double.infinity,
              height: 45,
              margin: EdgeInsets.only(top: 24),
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: isLoading
                  ? loadingIndicator
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });

                        await context.read<UserCubit>().signIn(
                              emailController.text,
                              passwordController.text,
                            );
                        UserState state = context.read<UserCubit>().state;

                        if (state is userLoaded) {
                          context.read<FoodCubit>().getFoods();
                          context.read<TransactionCubit>().getTransactions();
                          Get.to(() => MainPage());
                        } else {
                          Get.snackbar("", "",
                              backgroundColor: "D9435E".toColor(),
                              icon: Icon(
                                MdiIcons.closeCircleOutline,
                                color: Colors.white,
                              ),
                              titleText: Text(
                                'Sign In Failed',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              messageText: Text(
                                "Please try again later",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ));
                          setState(() {
                            isLoading = false;
                          });
                        }
                      },
                      child: Text(
                        "Login",
                        style: blackFontstyl3.copyWith(color: Colors.white),
                      ),
                    ),
            ),
            Container(
              width: double.infinity,
              height: 45,
              margin: EdgeInsets.only(top: 12.0),
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => SignUpPages());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: greyColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Register",
                  style: blackFontstyl3.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
