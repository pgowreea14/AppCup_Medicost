import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicalapp/constants/constants.dart';

class Settings_Page extends StatelessWidget {
  const Settings_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          const SizedBox(height: 30),
          SizedBox(
            height: 180,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final card = profileCompletionCards[index];
                return SizedBox(
                  width: 160,
                  child: Card(
                    color: kPrimaryColor, // Background color for the card
                    shadowColor: Colors.black12,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Icon(
                            card.icon,
                            size: 30,
                            color: Colors.white, // Set icon color to white
                          ),
                          const SizedBox(height: 10),
                          Text(
                            card.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white), // Set text color to white
                          ),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              elevation: 0, backgroundColor: kPrimaryLightColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10)), // Button color
                            ),
                            child: Text(
                              card.buttonText,
                              style: const TextStyle(
                                  color: Colors
                                      .white), // Set button text color to white
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  const Padding(padding: EdgeInsets.only(right: 5)),
              itemCount: profileCompletionCards.length,
            ),
          ),
          const SizedBox(height: 35),
          ...List.generate(
            customListTiles.length,
            (index) {
              final tile = customListTiles[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Card(
                  color: kPrimaryColor, // Background color for the card
                  elevation: 4,
                  shadowColor: Colors.black12,
                  child: ListTile(
                    leading: Icon(
                      tile.icon,
                      color: Colors.white, // Set icon color to white
                    ),
                    title: Text(
                      tile.title,
                      style: const TextStyle(
                          color: Colors.white), // Set text color to white
                    ),
                    trailing: const Icon(
                      Icons.chevron_right,
                      color: Colors.white, // Set trailing icon color to white
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class ProfileCompletionCard {
  final String title;
  final String buttonText;
  final IconData icon;
  ProfileCompletionCard({
    required this.title,
    required this.buttonText,
    required this.icon,
  });
}

List<ProfileCompletionCard> profileCompletionCards = [
  ProfileCompletionCard(
    title: "Connect Social Media",
    icon: CupertinoIcons.share,
    buttonText: "Connect",
  ),
  ProfileCompletionCard(
    title: "Verify Your Email",
    icon: CupertinoIcons.mail,
    buttonText: "Verify",
  ),
  ProfileCompletionCard(
    title: "Complete Your Profile",
    icon: CupertinoIcons.pencil,
    buttonText: "Complete",
  ),
];

class CustomListTile {
  final IconData icon;
  final String title;
  CustomListTile({
    required this.icon,
    required this.title,
  });
}

List<CustomListTile> customListTiles = [
  CustomListTile(
    icon: Icons.location_on_outlined,
    title: "Location",
  ),
  CustomListTile(
    title: "Notifications",
    icon: CupertinoIcons.bell,
  ),
  CustomListTile(
    title: "Logout",
    icon: CupertinoIcons.arrow_right_arrow_left,
  ),
];
