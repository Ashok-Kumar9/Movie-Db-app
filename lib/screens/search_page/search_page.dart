import 'package:flutter/material.dart';
import 'package:teachedison/controllers/search_movie_controller.dart';
import 'package:teachedison/models/genreModel.dart';
import 'package:teachedison/models/search_movie_model.dart';
import 'package:teachedison/screens/search_page/search_result_page.dart';
import 'package:teachedison/utils/reusable_widgets.dart';
import 'package:get/get.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final genres = GenresList.fromJson(genreslist).list;
  TextEditingController textEditingController = TextEditingController();
  late String queryText;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  child: Text("Search",
                      style:
                          TextStyle(color: Colors.lightBlue, fontSize: 24.0)),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: textEditingController,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.white, fontSize: 17.0),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    suffixIcon: Icon(
                      Icons.mic,
                      color: Colors.white,
                    ),
                    hintText: "Search movie title, actor ...",
                    hintStyle: TextStyle(color: Colors.white, fontSize: 17.0),
                    fillColor: Colors.grey.withOpacity(0.5),
                    filled: true,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onSubmitted: (query) {
                    setState(() {
                      queryText = query;
                      Get.to(()=> SearchMovieResult(queryText: queryText));
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  top: 8,
                ),
                child: Text(
                  "Popular Genres",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, right: 10.0, left: 10.0),
                child: GridView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1.4 / 1),
                  children: [
                    for (var i = 0; i < 4; i++)
                      ReusableWidgets().genreCard(
                          genres[i].color, genres[i].name, genres[i].image),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  top: 8,
                ),
                child: Text(
                  "Browse all",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, right: 5.0, left: 5.0),
                child: GridView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1.4 / 1),
                  children: [
                    for (var i = 4; i < genres.length; i++)
                      ReusableWidgets().genreCard(
                          genres[i].color, genres[i].name, genres[i].image),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
