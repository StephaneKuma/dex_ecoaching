import 'package:auto_route/auto_route.dart';
import 'package:e_coaching/src/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.r),
                    child: Image.asset(
                      'assets/images/user.png',
                      height: 175.h,
                      width: 175.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey.shade300,
                      spreadRadius: .5,
                      blurRadius: 5,
                    )
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.h),
                    Text(
                      "James S. Hernández",
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "Jhernandex.redial@gmail.ac.in",
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    const ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.user,
                        color: kTitleColor,
                      ),
                      title: Text(
                        "Editer le profil",
                        style: TextStyle(
                          color: kTitleColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: RotatedBox(
                        quarterTurns: 2,
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: kTitleColor,
                        ),
                      ),
                    ),
                    const ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.wallet,
                        color: kTitleColor,
                      ),
                      title: Text(
                        "Modalité de paiement",
                        style: TextStyle(
                          color: kTitleColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: RotatedBox(
                        quarterTurns: 2,
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: kTitleColor,
                        ),
                      ),
                    ),
                    const ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.bell,
                        color: kTitleColor,
                      ),
                      title: Text(
                        "Notifications",
                        style: TextStyle(
                          color: kTitleColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: RotatedBox(
                        quarterTurns: 2,
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: kTitleColor,
                        ),
                      ),
                    ),
                    const ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.gears,
                        color: kTitleColor,
                      ),
                      title: Text(
                        "Sécurité",
                        style: TextStyle(
                          color: kTitleColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: RotatedBox(
                        quarterTurns: 2,
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: kTitleColor,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: const FaIcon(
                        FontAwesomeIcons.language,
                        color: kTitleColor,
                      ),
                      title: const Text(
                        "Langue",
                        style: TextStyle(
                          color: kTitleColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "Français (Togo)",
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const RotatedBox(
                            quarterTurns: 2,
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: kTitleColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.eyeLowVision,
                        color: kTitleColor,
                      ),
                      title: Text(
                        "Mode sombre",
                        style: TextStyle(
                          color: kTitleColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: RotatedBox(
                        quarterTurns: 2,
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: kTitleColor,
                        ),
                      ),
                    ),
                    const ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.lock,
                        color: kTitleColor,
                      ),
                      title: Text(
                        "Termes & Conditions",
                        style: TextStyle(
                          color: kTitleColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: RotatedBox(
                        quarterTurns: 2,
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: kTitleColor,
                        ),
                      ),
                    ),
                    const ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.question,
                        color: kTitleColor,
                      ),
                      title: Text(
                        "Centre d'aide",
                        style: TextStyle(
                          color: kTitleColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: RotatedBox(
                        quarterTurns: 2,
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: kTitleColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
