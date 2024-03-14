import 'dart:ui';
import 'package:oc/models/comboprd.dart';
import 'package:oc/models/product.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Combo> _comboprd = [];
  List<product> n_prd = [];

  @override
  void initState() {
    super.initState();
    _getInitialInfo();
  }

  Future<void> _getInitialInfo() async {
    try {
      List<Combo> combos = await Combo.getCombo();
      List<product> prd = await product.getproduct();
      setState(() {
        _comboprd = combos;
        n_prd = prd;
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
      appBar: appBar(), // Call the appBar function here

      body: ListView(
        children: [
          _searchField(),
          CarouselSlider(
            items: [
              //1st Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage("assets/images/a.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //2nd Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage("assets/images/a.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //3rd Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage("assets/images/a.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //4th Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage("assets/images/a.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //5th Image of Slider
            ],

            //Slider Container properties
            options: CarouselOptions(
              height: 180.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 70, // Adjust the height of the banner as needed
            // Adjust the height of the banner as needed
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color:
                  Color(0xFFFFE5E5), // Set the background color of the banner
              //     image: DecorationImage(
              //       image: AssetImage(
              //           'assets/images/2.png'), // Provide the path to your banner image asset
              //      fit: BoxFit.cover, // Adjust the image fit as needed
              //   ),
            ),
            child: Center(
              child: Text(
                'Sell with Us', // Add text for the banner if needed
                style: TextStyle(
                  color: Color.fromRGBO(238, 59, 59, 1), // Set the text color
                  fontSize: 20, // Adjust the font size as needed
                  fontWeight:
                      FontWeight.bold, // Adjust the font weight as needed
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            // Adjust the height of the banner as needed
            child: const Center(
              child: Text(
                'New Arrivals', // Add text for the banner if needed
                style: TextStyle(
                  color: Color.fromRGBO(166, 59, 238, 1), // Set the text color
                  fontSize: 20, // Adjust the font size as needed
                  fontWeight:
                      FontWeight.bold, // Adjust the font weight as needed
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // First item
                  Container(
                    width: 150,
                    height: 150,
                    margin: EdgeInsets.only(right: 10.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 252, 240, 251),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Item 1',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Second item
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Combo',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 120,
                child: ListView.separated(
                  itemCount: _comboprd.length,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 25,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailPage(
                              product: _comboprd[index],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 243, 220, 220),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              _comboprd[index].name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Top Picks',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 120,
                child: ListView.separated(
                  itemCount: n_prd.length,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 25,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      width: 100,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 243, 220, 220),
                          borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            n_prd[index].name,
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontSize: 14),
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
          Center(
            child: Text(
              '______',
              style: TextStyle(
                color: Colors.black,
                fontSize: 40.0,
              ),
            ),
          ),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 175, 76, 142),
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 215, 224, 216)),
                accountName: Text(
                  "Ajay",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("ha ha.com"),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 0, 0, 0),
                  child: Text(
                    "A",
                    style: TextStyle(fontSize: 30.0, color: Colors.blue),
                  ), //Text
                ), //circleAvatar
              ), //UserAccountDrawerHeader
            ), //DrawerHeader
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' My Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text(' My Course '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.workspace_premium),
              title: const Text(' Go Premium '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.video_label),
              title: const Text(' Saved Videos '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text(' Edit Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ), //Drawer
    );
  }

  // Define the appBar function here
  AppBar appBar() {
    return AppBar(
      toolbarHeight: 90,
      backgroundColor: Color.fromARGB(255, 140, 63, 255),
      centerTitle: true,
      // Leading property containing the menu icon
      leading: Builder(builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: (90.0 - 45.0) / 2, // Center vertically within AppBar
          ),
          child: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white, // Set the color to white
              size: 40, // Increase the size of the icon
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        );
      }),
      // Action icon for cart
      actions: [
        Padding(
          // padding: const EdgeInsets.all(15.0),
          padding: EdgeInsets.symmetric(
            vertical: (90.0 - 45.0) / 2, // Center vertically within AppBar
          ),

          child: IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white, // Set the color to white
              size: 35, // Increase the size of the icon
            ),
            onPressed: () {
              // Handle cart action
            },
          ),
        ),
      ],
      // FlexibleSpace containing the image asset
      flexibleSpace: SafeArea(
        child: Center(
          child: SizedBox(
            height: 75, // Adjust height as needed
            child: Image.asset(
              'assets/images/1.png', // Path to your image asset
            ),
          ),
        ),
      ),
    );
  }
}

Container _searchField() {
  return Container(
    margin: const EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
      border: Border.all(
        color: Colors.grey, // Add border color if needed
        width: 1.0, // Add border width if needed
      ),
    ),
    child: Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search...',
              border: InputBorder.none, // Remove TextField border
              contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            // Implement search functionality here
          },
        ),
      ],
    ),
  );
}

class ProductDetailPage extends StatelessWidget {
  final Combo product; // Change the type here

  ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Product Name: ${product.name}', // Access name directly from product
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Product Name: ${product.price}', // Access name directly from product
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Add other details you want to display
          ],
        ),
      ),
    );
  }
}
