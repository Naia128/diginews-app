import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {

  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text(
          "Profile",
        ),

      ),

      body: const Center(

        child: Column(

          mainAxisAlignment:

              MainAxisAlignment.center,

          children: [

            CircleAvatar(

              radius: 50,

              child: Icon(

                Icons.person,

                size: 50,

              ),

            ),

            SizedBox(

              height: 16,

            ),

            Text(

              "Naia Sila Azachra",

              style: TextStyle(

                fontSize: 20,

                fontWeight:

                    FontWeight.bold,

              ),

            ),

            SizedBox(

              height: 8,

            ),

            Text(

              "20123061",

            )

          ],

        ),

      ),

    );

  }

}