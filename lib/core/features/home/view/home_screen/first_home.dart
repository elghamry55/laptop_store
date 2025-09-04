import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laptop_store/core/features/auth/view/screen/auth_home.dart';
import 'package:laptop_store/core/features/card/view/screen/card_home.dart';
import 'package:laptop_store/core/features/favorite/view/screen/favorit_home.dart';
import 'package:laptop_store/core/features/home/api/cubit/body_cubit.dart';
import 'package:laptop_store/core/features/home/view/home_widgets/success_widget.dart';

class FirstHome extends StatelessWidget {
  const FirstHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1E293B),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Laptop",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.white, size: 34),
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff334155), Color(0xff1E293B)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("assets/images/img.png"),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Welcome",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Mahmoud Elghamry",
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.settings, color: Colors.white),
                title: Text("Settings", style: TextStyle(color: Colors.white)),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart, color: Colors.white),
                title: Text("Shopping Card", style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CardHome()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite, color: Colors.white),
                title: Text("Favorite", style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FavoritHome()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.person, color: Colors.white),
                title: Text("Profile", style: TextStyle(color: Colors.white)),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.red),
                title: Text("Logout", style: TextStyle(color: Colors.red)),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => AuthHome()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: BlocBuilder<BodyCubit, BodyState>(
        builder: (context, state) {
          if (state is BodySuccessState) {
            return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xff334155),
                    Color(0xff1E293B),
                  ],
                ),
              ),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.6,
                ),
                itemCount: state.product.length,
                itemBuilder: (context, index) {
                  return SuccessWidget(product: state.product[index]);
                },
              ),
            );
          }
          return Center();
        },
      ),
    );
  }
}




