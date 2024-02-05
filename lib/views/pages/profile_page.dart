import 'package:flutter/material.dart';
import 'package:second_food_delivary_app/views/widgets/profile_list_tile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 24.0,),
              CircleAvatar(
                radius: size.width > 800 ? size.height * 0.2 :size.height * 0.1 ,
                backgroundImage: const AssetImage(
                    "assets/images/userImage.jpg",
                ),
              ),
              const SizedBox(height: 24.0,),
              const Text(
                "Mohammad Ahmad",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 6.0,),
              const Text(
                "Developer",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 24.0,),
              const Divider( indent: 20, endIndent: 20,),
                ProfileListTile(
                leadingIcon: Icons.person_outline,
                title: "My Profile",
                onTapItem: (){
                 
                },
                ),
              const Divider( indent: 20, endIndent: 20,),
                ProfileListTile(
                leadingIcon: Icons.shopping_cart_outlined,
                title: "Orders",
                onTapItem: (){
                 
                },
                ),
              const Divider( indent: 20, endIndent: 20,),
              ProfileListTile(
                leadingIcon: Icons.card_giftcard_outlined,
                title: "Coupons",
                onTapItem: (){
                  
                },
                ),
              const Divider( indent: 20, endIndent: 20,),
              ProfileListTile(
                leadingIcon: Icons.settings,
                title: "Settings",
                onTapItem: (){
                  
                },
              ),
          
            ],
          ),
        ),
      ),
    );
  }
}