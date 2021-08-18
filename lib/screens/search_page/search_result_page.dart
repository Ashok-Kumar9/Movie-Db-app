import 'package:flutter/material.dart';
import 'package:teachedison/controllers/search_movie_controller.dart';
import 'package:teachedison/models/search_movie_model.dart';
import 'package:teachedison/screens/movie_info_page/movie_info_page.dart';
import 'package:teachedison/utils/reusable_widgets.dart';
import 'package:get/get.dart';

class SearchMovieResult extends StatefulWidget {
  final String queryText;
  SearchMovieResult({required this.queryText});

  @override
  _SearchMovieResultState createState() => _SearchMovieResultState();
}

class _SearchMovieResultState extends State<SearchMovieResult> {
  List<Search> searchedMovies = <Search>[];
  bool isLoading = true;
  int page = 0;
  ScrollController scrollController = ScrollController(keepScrollOffset: false);

  @override
  void initState() {
    super.initState();
    searchedData();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        searchedData();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void searchedData() async {
    page = page + 1;
    SearchMovieModel data = await SearchMovieController()
        .detailsFromQuery(query: widget.queryText, page: page);
    if (data.response == 'True') {
      setState(() {
        data.search!.forEach((element) {
          searchedMovies.add(element);
        });
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.lightBlue),
          backgroundColor: Colors.black,
          title: Text(
            'Searched Movies',
            style: TextStyle(color: Colors.lightBlue, fontSize: 24.0),
          ),
        ),
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false,
        body: isLoading
            ? Center(child: RefreshProgressIndicator())
            : ListView.separated(
                separatorBuilder: (BuildContext context, int index) => Padding(
                  padding: EdgeInsets.only(bottom: 8.0, top: 8.0),
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1.0,
                  ),
                ),
                controller: scrollController,
                itemCount: searchedMovies.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == searchedMovies.length) {
                    return Center(child: RefreshProgressIndicator());
                  } else {
                    return GestureDetector(
                      onTap: () {
                        print('clicked');
                        Get.to(() => MovieInfoPage(
                              imdbId: searchedMovies[index].imdbID,
                            ));
                      },
                      child: Row(
                        children: [
                          ReusableWidgets().movieImageTile(
                            posterPath: searchedMovies[index].poster != 'N/A'
                                ? searchedMovies[index].poster
                                : 'https://s.yimg.com/fz/api/res/1.2/mDcnefIbAriP.n_dPJZKUw--~C/YXBwaWQ9c3JjaGRkO2ZpPWZpbGw7aD0yMjA7cT04MDt3PTIyMA--/https://s.yimg.com/zb/imgv1/aa0ebe51-bd0c-3d05-b78d-87e856fd0b10/t_1024x1024',
                            onTap: () {},
                          ),
                          movieDetail(searchedMovies[index]),
                        ],
                      ),
                    );
                  }
                },
              ),
      ),
    );
  }

  movieDetail(Search searchedMovie) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              searchedMovie.title.toString(),
              style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w900),
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                Text(
                  "Year: ",
                  style: TextStyle(color: Colors.grey[300], fontSize: 18.0),
                ),
                Text(
                  searchedMovie.year.toString(),
                  style: TextStyle(color: Colors.grey[350], fontSize: 18.0),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Type: ",
                  style: TextStyle(color: Colors.grey[300], fontSize: 18.0),
                ),
                Text(
                  searchedMovie.type!.toUpperCase().toString(),
                  style: TextStyle(color: Colors.grey[350], fontSize: 18.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
