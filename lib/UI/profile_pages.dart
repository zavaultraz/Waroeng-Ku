part of 'pages.dart';

class ProfilePages extends StatefulWidget {
  const ProfilePages({super.key, this.user});
  final User? user;

  @override
  State<ProfilePages> createState() => _ProfilePagesState();
}

class _ProfilePagesState extends State<ProfilePages> {
  int selectedTabIndex = 0;
  void refresh(){
    context.read<UserCubit>().getUser((context.read<UserCubit>().state as userLoaded).user);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 110,
          height: 110,
          padding: EdgeInsets.all(10),
          margin: const EdgeInsets.only(top: 26),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/food/photo_border.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
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
        ),
        SizedBox(
          height: 10,
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person, size: 25),
                SizedBox(width: 8), // Add spacing between icon and text
                Text(
                  (context.read<UserCubit>().state as userLoaded).user.name ??
                      '', // Assuming user has an email property
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400), // Optional: set text style
                ),
              ],
            ),
            SizedBox(height: 4), // Add spacing between rows
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  (context.read<UserCubit>().state as userLoaded).user.email ??
                      '', // Assuming user has an email property
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400), // Optional: set text style
                ),
              ],
            ),
          ],
        ),
        Container(
          height: 500,
          margin: EdgeInsets.only(top: 30),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 26),
          decoration: BoxDecoration(
            color: mainColor.withOpacity(0.8),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              // Tab bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTabIndex = 1; // Set index for Account
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          'Account',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: selectedTabIndex == 1
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        if (selectedTabIndex == 1)
                          Container(
                            margin: const EdgeInsets.only(top: 4),
                            height: 2,
                            width: 30,
                            color: Colors.white,
                          ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTabIndex = 2; // Set index for Food Transaction
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          'Mangan Kuy',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: selectedTabIndex == 2
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        if (selectedTabIndex == 2)
                          Container(
                            margin: const EdgeInsets.only(top: 4),
                            height: 2,
                            width: 30,
                            color: Colors.white,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16), // Spacing below the tabs
              Container(
                // Example content based on selected tab

                child: selectedTabIndex == 1
                    ? Center(
                        child: Column(
                          children: [
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  color: mainColor.withOpacity(0.9)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      'Setting',
                                      style: blackFontstyle2,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Icon(
                                      CupertinoIcons.right_chevron,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: (){
                                Get.to(EditProfilePage())!.then((value)=>refresh());
                              },
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(13),
                                    color: mainColor.withOpacity(0.9)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        'Edit Profile',
                                        style: blackFontstyle2,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8.0),
                                      child: Icon(
                                        CupertinoIcons.right_chevron,
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  color: mainColor.withOpacity(0.9)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      'Add Addres',
                                      style: blackFontstyle2,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Icon(
                                      CupertinoIcons.right_chevron,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  color: mainColor.withOpacity(0.9)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      'Payment',
                                      style: blackFontstyle2,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Icon(
                                      CupertinoIcons.right_chevron,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    : Center(
                        child: Column(
                          children: [
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  color: mainColor.withOpacity(0.9)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        context.read<UserCubit>().signOut();
                                        Get.to(SignInPage());
                                      },
                                      child: Text(
                                        'Log Out',
                                        style: blackFontstyle2,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Icon(
                                      CupertinoIcons.right_chevron,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  color: mainColor.withOpacity(0.9)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      'Developer',
                                      style: blackFontstyle2,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Icon(
                                      CupertinoIcons.right_chevron,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  color: mainColor.withOpacity(0.9)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      'Daftar mitra',
                                      style: blackFontstyle2,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Icon(
                                      CupertinoIcons.right_chevron,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  color: mainColor.withOpacity(0.9)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      'Term & Condition',
                                      style: blackFontstyle2,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Icon(
                                      CupertinoIcons.right_chevron,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
