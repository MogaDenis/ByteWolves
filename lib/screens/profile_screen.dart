import 'package:byte_wolves/models/user.dart';
import 'package:flutter/material.dart';
import '/constants/constants.dart';
import 'login_screen.dart';

class ProfileScreen extends StatefulWidget {
  final User user;
  const ProfileScreen({super.key, required this.user});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            }, icon: const Icon(Icons.arrow_back_ios_new)),
        title: Text(
          StringConstants.profileTitle,
          style: TextStyle(
            fontFamily: FontConstants.openSans,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          )
        ],
        centerTitle: true,
      ),
      body: GestureDetector(
        // When the keyboard is up, if the screen is pressed then the keyboard is closed.
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: <Widget>[
            CustomContainers.backgroundContainer,
            SizedBox(
              height: double.infinity,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 60.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 120.0,
                      width: 120.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 10),
                            blurRadius: 6.0,
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage(ImagesConstants.logoImage),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      widget.user.username,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '@${widget.user.email}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    SizedBox(
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              foregroundColor: const Color(0xFF527DAA),
                              backgroundColor: Colors.white),
                          child: const Text(
                            "Edit Profile",
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                    const SizedBox(height: 20.0),
                    const Divider(
                      color: Color(0xFF61A4F1),
                      thickness: 0,
                    ),
                    /// PROFILE STATS CONTAINING LECTURES PASSED, EXPERIENCE, AND LEVELS PASSED
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const Text(
                              'Lectures',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'OpenSans',
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Text(
                              widget.user.lectures.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'OpenSans',
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text(
                              'Experience',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'OpenSans',
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              widget.user.experience.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'OpenSans',
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text(
                              'Levels',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'OpenSans',
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              widget.user.level.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'OpenSans',
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    /// MENU
                    ProfileMenuWidget(
                        title: 'Settings',
                        icon: Icons.settings,
                        onPress: () {}),
                    ProfileMenuWidget(
                        title: 'Privacy Policy',
                        icon: Icons.privacy_tip,
                        onPress: () {}),
                    ProfileMenuWidget(
                        title: 'Terms of Service',
                        icon: Icons.description,
                        onPress: () {}),
                    const Divider(
                      color: Color(0xFF398AE5),
                      thickness: 0,
                    ),
                    const SizedBox(height: 20.0),
                    ProfileMenuWidget(
                      title: 'Help',
                      icon: Icons.help,
                      onPress: () {},
                    ),
                    ProfileMenuWidget(
                        title: 'Log Out',
                        icon: Icons.logout,
                        onPress: () async {
                          // Log out the user
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const LogInScreen()));
                        },
                        endIcon: false,
                        color: Colors.red),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget(
      {super.key,
      required this.title,
      required this.icon,
      required this.onPress,
      this.endIcon = true,
      this.color});

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.black.withOpacity(0.1)),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: FontConstants.openSans,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: color ?? Colors.white),
      ),
      trailing: endIcon
          ? Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.black.withOpacity(0.1)),
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            )
          : null,
    );
  }
}
