import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Screens/loginScreen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}



class _MainScreenState extends State<MainScreen> {

  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  late GoogleMapController newGoogleMapController;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(30.074330, 31.268062),
    zoom: 14.4746,
  );

  late String uid;

  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width*0.7;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0.0),
          children: [
            // First container
            Container(
              color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Drawer Header
                  Padding(
                    padding: EdgeInsets.only(top: 80.0, bottom: 30.0, right: 20.0, left: 20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header Left Part
                        Container(
                            height: 70.0,
                            width: 70.0,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Icon(
                              Icons.person_rounded, color: Colors.grey[500],
                              size: 50.0,
                            )
                        ),
                        SizedBox(width: 20.0,),

                        // Header Right Part
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text('Mahmoud Ahm...',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                              ),
                            ),
                            SizedBox(height: 10.0,),
                            Row(
                              children: [
                                Text('4.47',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey[500],
                                  ),
                                ),
                                Icon(Icons.star,
                                  color: Colors.grey[500],
                                  size: 15.0,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Color(0xFF595959),
                    height: 10,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                  ),
                  FlatButton(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                      onPressed: () {

                      },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Messages',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios,
                          color: Color(0xFF595959),
                          size: 20.0,
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Color(0xFF595959),
                    height: 10,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Do more with your account',
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                        ),
                        SizedBox(height: 20.0,),
                        Text('Make money driving',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                        ),
                        SizedBox(height: 30.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20.0,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20.0),
                    onPressed: () {

                    },
                    child: Row(
                      children: [
                        Text('Your Trips',
                          style: TextStyle(
                            fontSize: 22.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20.0),
                    onPressed: () {

                    },
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Wallet',
                              style: TextStyle(
                                fontSize: 22.0,
                              ),
                            ),
                            SizedBox(height: 10.0,),
                            Text('Uber Cash: EGP 32.00',
                              style: TextStyle(
                                color: Colors.grey[500],
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                  FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20.0),
                    onPressed: () {

                    },
                    child: Row(
                      children: [
                        Text('Help',
                          style: TextStyle(
                            fontSize: 22.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20.0),
                    onPressed: () {

                    },
                    child: Row(
                      children: [
                        Text('Fish Routes',
                          style: TextStyle(
                            fontSize: 22.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20.0),
                    onPressed: () {

                    },
                    child: Row(
                      children: [
                        Text('Settings',
                          style: TextStyle(
                            fontSize: 22.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 70.0),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Legal"),
                  Text("v4.23410003"),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Color(0xff8ca2ad),
        shadowColor: Colors.white.withOpacity(0.0),
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
      ),
      body: ListView(
        children: [
          Container(
            color: Color(0xff8ca2ad),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('XFish route nearby!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 26.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 15.0,),
                            Text('Introducing Uber XFish!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                            ),),
                            // Text(uid),
                            SizedBox(height: 15.0,),
                            FlatButton(
                              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                              color: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              onPressed: (){
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(builder: (context) => LoginScreen()),
                                        (route) => false);
                              },
                              child: Text('Check Routes',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SvgPicture.asset('images/Asset7.svg', height: 200,),
                  ],
              ),

              // Second Container
              Column(
                children: [
                  // Three vehicles buttons
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 18.0),
                    color: Colors.white,
                    child: Row(
                      children: [
                        FlatButton(
                          onPressed: () => {},
                          color: Colors.grey[200],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                          child: Column( // Replace with a Row for horizontal icon + text
                            children: <Widget>[
                              SvgPicture.asset('images/Asset3.svg', height: 50.0,),
                              SizedBox(height: 10.0,),
                              Text("xBird",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),)
                            ],
                          ),
                        ),
                        SizedBox(width: 20.0,),
                        FlatButton(
                          onPressed: () => {},
                          color: Colors.grey[200],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                          child: Column( // Replace with a Row for horizontal icon + text
                            children: <Widget>[
                              SvgPicture.asset('images/Asset4.svg', height: 50.0,),
                              SizedBox(height: 10.0,),
                              Text("xFly",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),)
                            ],
                          ),
                        ),
                        SizedBox(width: 20.0,),
                        FlatButton(
                          onPressed: () => {},
                          color: Colors.grey[200],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                          child: Column( // Replace with a Row for horizontal icon + text
                            children: <Widget>[
                              SvgPicture.asset('images/Asset8.svg', height: 50.0,),
                              SizedBox(height: 10.0,),
                              Text("xDog",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // "Where to?" Container
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 18.0),
                    child: Container(
                      color: Colors.grey[200],
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 22.0,
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 22, horizontal: 16.0),
                                filled: true,
                                fillColor: Colors.grey[200],
                                hintText: 'Where to?',
                                hintStyle: TextStyle(color: Colors.black),
                                border: InputBorder.none,
                              ),
                            ),
                          ),

                          // Divider
                          Container(
                            height: 55.0,
                            width: 1.0,
                            color: Colors.grey[400],
                          ),

                          // "Now" Button with two icons
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                            child: FlatButton(
                              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),

                              onPressed: () {
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.access_time_filled, size: 22.0,),
                                  SizedBox(width: 8.0,),
                                  Text('Now',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                    ),),
                                  SizedBox(width: 5.0,),
                                  Icon(Icons.keyboard_arrow_down),
                                ],
                              ),

                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 105.0,
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 18.0),
                    child: Row(
                      children: [
                        Icon(Icons.access_time_filled, size: 30.0, color: Color(0xFF545454),),
                        SizedBox(width: 20.0,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Home',
                            style: TextStyle(
                            fontSize: 17.0,
                              fontWeight: FontWeight.w600
                            ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5.0),
                              width: c_width,
                                child: Text('Masr We Al Sodan, Al Khassah, Hada\'iq st 3454 El Qobbah, Cairo Governorate',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.grey[700],
                                    height: 1.5,
                                  ),
                                )
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 10.0,
                    color: Colors.grey[300],
                  ),
                  Container(
                    height: 300,
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 18.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('Around you',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Color(0xFF404040),
                            ),),
                          ],
                        ),
                        SizedBox(height: 20.0,),
                        Column(
                          children: [
                            Container(
                              height: 220.0,
                              width: 400.0,
                              child: GoogleMap(
                                initialCameraPosition: _kGooglePlex,
                                // mapType: MapType.hybrid,
                                myLocationButtonEnabled: false,
                                onMapCreated: (GoogleMapController controller) {
                                  setState(() {
                                    Marker(
                                      markerId: MarkerId('id-1'),
                                      position: LatLng(30.074330, 31.268062),
                                      onTap: () {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(builder: (context) => LoginScreen()),
                                                (route) => false);
                                      }
                                    );
                                  });
                                  controller.setMapStyle(Utils.mapStyle);
                                  _controllerGoogleMap.complete(controller);
                                  newGoogleMapController = controller;
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
        ),
          ),
        ]
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    uid = FirebaseAuth.instance.currentUser!.uid;
  }
}

// Google Maps Silver Style
class Utils {
  static String mapStyle = '''
  [
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#f5f5f5"
      }
    ]
  },
  {
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#f5f5f5"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#bdbdbd"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#eeeeee"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e5e5e5"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#ffffff"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#dadada"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "transit.line",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e5e5e5"
      }
    ]
  },
  {
    "featureType": "transit.station",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#eeeeee"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#c9c9c9"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  }
]
  ''';
}

