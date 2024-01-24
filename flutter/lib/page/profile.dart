import 'package:e_learning/utils/shared_preferences_manager.dart';
import 'package:e_learning/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  SharedPreferences? prefs = SharedPreferencesManager.preferences;
  String? username;
  String? email;
  String? userId;
  String? phno;
  String? city;
  String? college;
  String? branch;

  void getUserDetails() {
    username = prefs!.getString("username");
    email = prefs!.getString("email");
    userId = prefs!.getString("userId");
    phno = prefs!.getString("phno");
    city = prefs!.getString("city");
    college = prefs!.getString("college");
    branch = prefs!.getString("branch");
  }

  @override
  Widget build(BuildContext context) {
    getUserDetails();
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 153, 0, 255),
          foregroundColor: Colors.white,
          title: const Text("Profile"),
          centerTitle: true,
        ),
        drawer: CustomDrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(30),
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Row(
                children: [
                  Spacer(),
                  Text(
                    "$username",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 30),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Email:              $email",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                // fontWeight: FontWeight.bold,
                                ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        "Phone No:       $phno",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                // fontWeight: FontWeight.bold,
                                ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        "City:                 $city",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                // fontWeight: FontWeight.bold,
                                ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        "College:           $college",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                // fontWeight: FontWeight.bold,
                                ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        "Branch:            $branch",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                // fontWeight: FontWeight.bold,
                                ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
