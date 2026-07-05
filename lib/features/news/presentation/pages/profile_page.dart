import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ProfilePage extends StatefulWidget{

const ProfilePage({super.key});

@override
State<ProfilePage> createState()

=> _ProfilePageState();

}

class _ProfilePageState

extends State<ProfilePage>{

int tapCount=0;

bool showSecret=false;

void onTap(){

tapCount++;

if(tapCount==1){

setState((){

showSecret=true;

});

Timer(

const Duration(

seconds:3

),

(){

setState((){

showSecret=false;

});

tapCount=0;

}

);

}

}

@override
Widget build(BuildContext context){

return Scaffold(

appBar: AppBar(

title:

const Text(

'About'

)

),

body:

Stack(

children:[

Center(

child:

GestureDetector(

onTap:onTap,

child:

CircleAvatar(

radius:70,

backgroundImage:

AssetImage(

'assets/profile.jpg'

),

),

),

),

if(showSecret)

Container(

color: Colors.black87,

child:

Center(

child:

Lottie.asset(

'assets/animations/secret.json',

width:350,

height:350

),

),

),

)

],

),

);

}

}