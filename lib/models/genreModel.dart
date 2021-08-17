import 'package:flutter/material.dart';

class Genres {
  final String id;
  final String name;
  final String image;
  final Color color;
  Genres({
    required this.color,
    required this.image,
    required this.id,
    required this.name,
  });
  factory Genres.fromJson(json) {
    return Genres(
      id: json['id'].toString(),
      name: json['name'],
      image: json['image'].toString(),
      color: json['color'],
    );
  }
}

class GenresList {
  final List<Genres> list;
  GenresList({
    required this.list,
  });
  factory GenresList.fromJson(json) {
    return GenresList(
        list: (json as List).map((genre) => Genres.fromJson(genre)).toList());
  }
}

final genreslist = [
  {
    "id": 28,
    "name": "Action",
    "image": "https://image.tmdb.org/t/p/w500/dpoIQ9MN54cxuLZxDABEUOSFGY3.jpg",
    "color": Color(0xff526605),
  },
  {
    "id": 12,
    "name": "Adventure",
    "image": "https://image.tmdb.org/t/p/w500/hvwEfBaqm6wcwWsqVKmZnRHgpi3.jpg",
    "color": Color(0xff1d0d87)
  },
  {
    "id": 16,
    "name": "Animation",
    "image": "https://image.tmdb.org/t/p/w500/AsqUSUqXrK8JfH8WEQnCXVbIAv6.jpg",
    "color": Color(0xff51ac06)
  },
  {
    "id": 35,
    "name": "Comedy",
    "image": "https://image.tmdb.org/t/p/w500/dq18nCTTLpy9PmtzZI6Y2yAgdw5.jpg",
    "color": Color(0xff375304)
  },
  {
    "id": 80,
    "name": "Crime",
    "image": "https://image.tmdb.org/t/p/w500/iueb8P2aSE2JL21kgoyhnmmeFb5.jpg",
    "color": Color(0xff4004d7)
  },
  {
    "id": 99,
    "name": "Documentary",
    "image": "https://image.tmdb.org/t/p/w500/heMC3jAjQPNSlr1n9mZKUQ58EOE.jpg",
    "color": Color(0xff0b6a33)
  },
  {
    "id": 18,
    "name": "Drama",
    "image": "https://image.tmdb.org/t/p/w500/AsqUSUqXrK8JfH8WEQnCXVbIAv6.jpg",
    "color": Color(0xff039620)
  },
  {
    "id": 10751,
    "name": "Family",
    "image": "https://image.tmdb.org/t/p/w500/hvwEfBaqm6wcwWsqVKmZnRHgpi3.jpg",
    "color": Color(0xff4004d7)
  },
  {
    "id": 14,
    "name": "Fantasy",
    "image": "https://image.tmdb.org/t/p/w500/70AV2Xx5FQYj20labp0EGdbjI6E.jpg",
    "color": Color(0xff039620)
  },
  {
    "id": 36,
    "name": "History",
    "image": "https://image.tmdb.org/t/p/w500/dpoIQ9MN54cxuLZxDABEUOSFGY3.jpg",
    "color": Color(0xffb49208)
  },
  {
    "id": 27,
    "name": "Horror",
    "image": "https://image.tmdb.org/t/p/w500/620hnMVLu6RSZW6a5rwO8gqpt0t.jpg",
    "color": Color(0xff0c6803)
  },
  {
    "id": 10402,
    "name": "Music",
    "image": "https://image.tmdb.org/t/p/w500/bjIPzixuWnOzxDG25WaXKuy9lYZ.jpg",
    "color": Color(0xffc01111)
  },
  {
    "id": 9648,
    "name": "Mystery",
    "image": "https://image.tmdb.org/t/p/w500/8s4h9friP6Ci3adRGahHARVd76E.jpg",
    "color": Color(0xff504907)
  },
  {
    "id": 10749,
    "name": "Romance",
    "image": "https://image.tmdb.org/t/p/w500/6MQmtWk4cFwSDyNvIgoJRBIHUT3.jpg",
    "color": Color(0xffa00e80)
  },
  {
    "id": 878,
    "name": "Science Fiction",
    "image": "https://image.tmdb.org/t/p/w500/yeNH8w3yEAfZxHsTig2pG8B13vN.jpg",
    "color": Color(0xff8a08b5)
  },
  {
    "id": 53,
    "name": "Thriller",
    "image": "https://image.tmdb.org/t/p/w500/620hnMVLu6RSZW6a5rwO8gqpt0t.jpg",
    "color": Color(0xff0b7f1e)
  },
  {
    "id": 10752,
    "name": "War",
    "image": "https://image.tmdb.org/t/p/w500/70AV2Xx5FQYj20labp0EGdbjI6E.jpg",
    "color": Color(0xff9d105b)
  },
  {
    "id": 37,
    "name": "Western",
    "image": "https://image.tmdb.org/t/p/w500/8s4h9friP6Ci3adRGahHARVd76E.jpg",
    "color": Color(0xffb49208)
  },
];
