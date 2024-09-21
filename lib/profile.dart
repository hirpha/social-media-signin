import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';

import 'package:social_media_sign/assets.dart';
import 'package:social_media_sign/colors.dart';
import 'package:social_media_sign/home.dart';
import 'package:social_media_sign/login.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = "ProfileScreen";
  final String name;

  const ProfileScreen({
    super.key,
    this.name = "Hirpha",
  });
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String imageUrl = "";
  // bool isUploading = false;

  String fileName = "";
  bool isDarkMode = false;
  bool isImageSelected = false;
  bool isImageLoading = false;
  String name = "";
  String phoneNumber = "";
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    // imageUrl = widget.profileArgument.imageUrl;
    // name = widget.profileArgument.name;
    // setState(() {});
  }

  showLogoutLoading() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SizedBox(
                width: MediaQuery.of(context).size.width * .3,
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("please wait"),
                  ],
                )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Profile",
        onGoBack: () {
          Navigator.pop(context);
        },
      ),
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .23,
            child: Stack(
              children: [
                Positioned(
                    top: 30,
                    left: 0,
                    right: 0,
                    child: Hero(
                      tag: "profile",
                      child: Container(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                            backgroundColor:
                                AppColors.primaryColor.withOpacity(.5),
                            radius: 60,
                            child: Container(
                              width: 110,
                              height: 110,
                              margin: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(100)),
                              alignment: Alignment.center,
                              child: Text(
                                name.isEmpty ? widget.name[0] : name[0],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 70,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )),
                      ),
                    )),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * .7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                              color: Color(0xff000000),
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.call,
                              color: Color(0xffADADAD),
                            ),
                            Text(
                              "+25190000000",
                              style: const TextStyle(
                                color: Color(0xffADADAD),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          ProfileMenuItem(
            icon: AppAssets.users,
            onTap: () {},
            title: "Account Details",
          ),
          ProfileMenuItem(
              icon: AppAssets.users, onTap: () {}, title: "Update Profile"),
          ProfileMenuItem(
            icon: AppAssets.key,
            onTap: () => Navigator.pushNamed(context, HomeScreen.routeName),
            title: "Change Password",
          ),
          ProfileMenuItem(
            icon: AppAssets.termsCondition,
            onTap: () async {},
            title: "Terms and Condition",
          ),
          ProfileMenuItem(
            icon: AppAssets.lock,
            onTap: () {},
            title: "Privacy Policy",
          ),
          ProfileMenuItem(
            icon: AppAssets.logout,
            // onTap: () => showLogoutDialog(context),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, SignInScreen.routeName, (_) => false);
            },
            title: "Logout",
          ),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool? showLeading;
  final bool? centerTitle;

  final Function()? onGoBack;
  final List<Widget>? actions;
  const CustomAppBar({
    super.key,
    this.showLeading,
    this.centerTitle,
    required this.title,
    this.onGoBack,
    this.actions,
  });

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      backgroundColor: Colors.transparent,
      title: CustomText(
        title: title,
        fontSize: 22,
        fontWeight: FontWeight.w700,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor:
            Colors.transparent, // Make the status bar transparent if needed
        statusBarIconBrightness:
            Brightness.dark, // For Android: make the icons dark
        statusBarBrightness:
            Brightness.dark, // For iOS: make the status bar icons dark
      ),
      toolbarHeight: MediaQuery.of(context).size.height * .053,
      leadingWidth: MediaQuery.of(context).size.width * .19,
      actions: actions,
      leading: showLeading != null || showLeading == false
          ? null
          : InkWell(
              onTap: onGoBack ?? () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .07,
                ),
                // width: 100.0,
                height: 20.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xFF9E9E9E),
                    width: 1.20,
                  ),
                ),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.grey,
                  size: 30,
                ),
              ),
            ),
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomText extends StatelessWidget {
  final String title;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool? centerText;
  const CustomText(
      {super.key,
      required this.title,
      this.fontSize,
      this.fontWeight,
      this.centerText,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: centerText == true ? TextAlign.center : null,
      style: TextStyle(
        fontSize: fontSize ?? 12,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final Function() onTap;
  final String title;
  final String icon;
  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      decoration: BoxDecoration(
        color: const Color(0xFFffffff),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 225, 221, 221),
            blurRadius: 1.0, // soften the shadow
            spreadRadius: 1.0, //extend the shadow
            offset: Offset(
              1.0, // Move to right 5  horizontally
              3.0, // Move to bottom 5 Vertically
            ),
          )
        ],
      ),
      child: MenuItem(title: title, onTap: onTap, icon: icon),
    );
  }
}

class MenuItem extends StatelessWidget {
  final Function() onTap;
  final String title;
  final String icon;
  Widget? iconPng;
  MenuItem(
      {super.key,
      iconPng,
      required this.onTap,
      required this.title,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        style: ListTileStyle.drawer,
        iconColor: Colors.black,
        leading: CircleAvatar(
          backgroundColor: const Color(0xffEDEDED),
          child: iconPng ??
              SvgPicture.asset(
                icon,
                colorFilter:
                    const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
              ),
        ),
        trailing: InkWell(
          onTap: onTap,
          child: const Icon(
            Icons.arrow_forward_ios,
            color: Color(0xff9E9E9E),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
              color: Color(0xff171D29),
              fontWeight: FontWeight.w600,
              fontSize: 14),
        ),
        onTap: onTap);
  }
}
