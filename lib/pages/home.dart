import 'package:blisser/models/category_model.dart';
import 'package:blisser/models/cloth_model.dart';
import 'package:blisser/pages/account.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<ClothModel> clothes = [];
  void _getData() {
    categories = CategoryModel.getCategories();
    clothes = ClothModel.getClothes();
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    _getData();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _searchBox(),
          const SizedBox(
            height: 20,
          ),
          _categories(),
          const SizedBox(
            height: 20,
          ),
          //_newArrivals()
          _products(),
        ],
      ),
      bottomNavigationBar: bottomNav(),
    );
  }

  BottomAppBar bottomNav() {
    return BottomAppBar(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.home),
            iconSize: 30,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
            iconSize: 30,
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AccountPage()));
            },
            icon: const Icon(Icons.person_2_rounded),
            iconSize: 30,
          ),
        ],
      ),
    );
  }

  Column _products() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Popular Products',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        ListView.separated(
          itemCount: clothes.length,
          shrinkWrap: true,
          separatorBuilder: (context, index) => const SizedBox(
            height: 25,
          ),
          padding: const EdgeInsets.only(left: 20, right: 20),
          itemBuilder: (context, index) {
            return InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () => {},
                splashColor: Colors.white10,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  height: 140,
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.network(
                        clothes[index].picturePath,
                        fit: BoxFit.contain,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            clothes[index].name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18),
                          ),
                          Row(
                            children: [
                              for (var color in clothes[index].availableColor)
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0, 0, 4, 3),
                                  width: 18,
                                  height: 18,
                                  decoration: BoxDecoration(
                                    color: Color(int.parse(color)),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.grey.withOpacity(0.3),
                                        width: 1),
                                  ),
                                ),
                            ],
                          ),
                          Text(
                            clothes[index].price,
                            style: const TextStyle(
                                color: Color(0xff7B6F72),
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: const Icon(Icons.arrow_forward_ios_rounded))
                    ],
                  ),
                ));
          },
        )
      ],
    );
  }

  Column _newArrivals() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'New Arrivals',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }

  Column _categories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Categories',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          height: 120,
          color: Colors.white,
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              width: 15,
            ),
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, right: 20),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Container(
                width: 100,
                decoration: BoxDecoration(
                    color: categories[index].boxColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        categories[index].iconPath,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      categories[index].name,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Container _searchBox() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 35, 20, 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ]),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: MaterialStateTextStyle.resolveWith(
              (states) => const TextStyle(color: Colors.grey, fontSize: 16)),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(10),
          prefixIcon: const Padding(
            padding: EdgeInsets.all(10),
            child: Icon(Icons.search),
          ),
          suffixIcon: SizedBox(
            width: 100,
            child: IntrinsicHeight(
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              const VerticalDivider(
                color: Colors.grey,
                indent: 10,
                endIndent: 10,
                width: 20,
              ),
              GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 10, 15, 10),
                    child: SvgPicture.asset(
                      'assets/icons/filter.svg',
                    ),
                  ))
            ])),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'blisser',
        textWidthBasis: TextWidthBasis.parent,
        style: TextStyle(
            letterSpacing: -1.0,
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w300),
      ),
      centerTitle: true,
      backgroundColor: Colors.blueGrey[50],
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(10),
            width: 50,
            height: 30,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              'assets/icons/cart.svg',
              fit: BoxFit.contain,
            ),
          ),
        )
      ],
    );
  }
}
