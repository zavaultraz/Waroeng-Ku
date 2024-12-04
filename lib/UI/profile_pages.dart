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
        // Profile Picture Section
        Container(
          width: 150,
          height: 150,
          padding: EdgeInsets.all(5),
          margin: const EdgeInsets.only(top: 26),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white, // Border color to highlight the image
              width: 3,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 4), // Shadow positioning
              ),
            ],
            shape: BoxShape.circle, // Circle shape for the profile container
          ),
          child: ClipOval(
            child: Image.network(
              (context.read<UserCubit>().state as userLoaded)
                  .user
                  .picturePath ??
                  'https://ui-avatars.com/api/?name=${(context.read<UserCubit>().state as userLoaded).user.name}',
              fit: BoxFit.cover,
              height: 110,
              width: 110,
            ),
          ),
        ),

        SizedBox(height: 5),

// User Info Section (Name, Email)
        Column(
          children: [
            // Name Text
            Text(
              (context.read<UserCubit>().state as userLoaded).user.name ?? '',
              style: GoogleFonts.rubik().copyWith(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  letterSpacing: 1.2, // Added spacing for a cleaner look
              )
            ),


            // Email Text
            Text(
              (context.read<UserCubit>().state as userLoaded).user.email ?? '',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.grey[600],
                letterSpacing: 0.8, // Added spacing for readability
              ),
            ),
          ],
        ),


        SizedBox(height: 4),

        // Settings and Transactions Section (Tabs)
        Container(
          height: 550,
          margin: EdgeInsets.only(top: 30),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 26),
          decoration: BoxDecoration(
            color: Colors.orange.withOpacity(0.7),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              // Tab bar
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                                : Colors.white,
                            fontSize: 16
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
                  SizedBox(width: 40),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTabIndex = 2; // Set index for Food Transaction
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          'App Setting',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: selectedTabIndex == 2
                                ? Colors.white
                                : Colors.white,
                            fontSize: 16
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

              SizedBox(height: 20),

              // Dynamic Content for Selected Tab
              Expanded(
                child: selectedTabIndex == 1
                    ? Column(
                  children: [
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.orangeAccent.withOpacity(0.9),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Text(
                              'Setting',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Icon(
                              CupertinoIcons.right_chevron,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        Get.to(EditProfilePage())!.then((value) => refresh());
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.orangeAccent.withOpacity(0.9),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Text(
                                'Edit Profile',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: Icon(
                                CupertinoIcons.right_chevron,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.orangeAccent.withOpacity(0.9),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Text(
                              'Add Address',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Icon(
                              CupertinoIcons.right_chevron,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.orangeAccent.withOpacity(0.9),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Text(
                              'Payment',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Icon(
                              CupertinoIcons.right_chevron,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
                    : Column(
                  children: [
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.orangeAccent.withOpacity(0.9),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: GestureDetector(
                              onTap: () {
                                context.read<UserCubit>().signOut();
                                Get.to(SignInPage());
                              },
                              child: Text(
                                'Log Out',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Icon(
                              CupertinoIcons.right_chevron,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.orangeAccent.withOpacity(0.9),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Text(
                              'Developer',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Icon(
                              CupertinoIcons.right_chevron,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.orangeAccent.withOpacity(0.9),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Text(
                              'Daftar Mitra',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Icon(
                              CupertinoIcons.right_chevron,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.orangeAccent.withOpacity(0.9),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Text(
                              'Term & Condition',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Icon(
                              CupertinoIcons.right_chevron,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );

  }
}
