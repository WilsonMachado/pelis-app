import 'dart:convert';

class Movie {
    Movie({
        required this.adult,
        this.backdropPath,
        required this.genreIds,
        required this.id,
        required this.originalLanguage,
        required this.originalTitle,
        required this.overview,
        required this.popularity,
        this.posterPath,
        this.releaseDate,
        required this.title,
        required this.video,
        required this.voteAverage,
        required this.voteCount,
    });

    bool adult;
    String? backdropPath;
    List<int> genreIds;
    int id;
    String originalLanguage;// Ahora será de tipo String: OriginalLanguage originalLanguage;
    String originalTitle;
    String overview;
    double popularity;
    String? posterPath;
    String? releaseDate; // Se cambia a String opcional DateTime? releaseDate;
    String title;
    bool video;
    double voteAverage;
    int voteCount;

    factory Movie.fromJson(String str) => Movie.fromMap(json.decode(str));

    //String toJson() => json.encode(toMap()); // convierte la instancia de la clase a un JSON

    factory Movie.fromMap(Map<String, dynamic> json) => Movie(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],///! Aquí intenta manejar el originalLanguageValues.map[json["original_language"]], basado en una enumeración. Se maneja mejor como un string
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        releaseDate: json["release_date"],// Como dijimos, se maneja como un string: DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
    );

    ///! Esto se usa para realizar envío de datos por HTTP, en este caso no se realiza

    // Map<String, dynamic> toMap() => {
    //     "adult": adult,
    //     "backdrop_path": backdropPath,
    //     "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
    //     "id": id,
    //     "original_language": originalLanguageValues.reverse[originalLanguage],
    //     "original_title": originalTitle,
    //     "overview": overview,
    //     "popularity": popularity,
    //     "poster_path": posterPath,
    //     "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
    //     "title": title,
    //     "video": video,
    //     "vote_average": voteAverage,
    //     "vote_count": voteCount,
    // };
}

///! Esto es para el lenguaje original de la película. En este caso no se usará tampoco.

// enum OriginalLanguage { EN, ES, JA, MK }

// final originalLanguageValues = EnumValues({
//     "en": OriginalLanguage.EN,
//     "es": OriginalLanguage.ES,
//     "ja": OriginalLanguage.JA,
//     "mk": OriginalLanguage.MK
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         if (reverseMap == null) {
//             reverseMap = map.map((k, v) => new MapEntry(v, k));
//         }
//         return reverseMap;
//     }
// }