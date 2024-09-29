import 'package:hive/hive.dart';

part 'image_model.g.dart';

@HiveType(typeId: 0)
class ImageItems {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final int width;

  @HiveField(2)
  final int height;

  @HiveField(3)
  final String blurHash;

  @HiveField(4)
  final Urls urls;

  @HiveField(5)
  final Links links;

  @HiveField(6)
  final User user;

  ImageItems({
    required this.id,
    required this.width,
    required this.height,
    required this.blurHash,
    required this.urls,
    required this.links,
    required this.user,
  });

  factory ImageItems.fromJson(Map<String, dynamic> json) {
    return ImageItems(
      id: json["id"],
      width: json["width"],
      height: json["height"],
      blurHash: json["blur_hash"],
      urls: Urls.fromJson(json["urls"]),
      links: Links.fromJson(json["links"]),
      user: User.fromJson(json["user"]),
    );
  }
}

@HiveType(typeId: 1)
class Urls {
  @HiveField(0)
  final String raw;

  @HiveField(1)
  final String full;

  @HiveField(2)
  final String regular;

  @HiveField(3)
  final String small;

  @HiveField(4)
  final String thumb;

  @HiveField(5)
  final String smallS3;

  Urls({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
    required this.smallS3,
  });

  factory Urls.fromJson(Map<String, dynamic> json) {
    return Urls(
      raw: json["raw"],
      full: json["full"],
      regular: json["regular"],
      small: json["small"],
      thumb: json["thumb"],
      smallS3: json["small_s3"],
    );
  }
}

@HiveType(typeId: 2)
class Links {
  @HiveField(0)
  final String download;

  @HiveField(1)
  final String downloadLocation;

  Links({
    required this.download,
    required this.downloadLocation,
  });

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      download: json["download"],
      downloadLocation: json["download_location"],
    );
  }
}

@HiveType(typeId: 3)
class User {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String? bio;

  @HiveField(3)
  final ProfileImage profileImage;

  User({
    required this.id,
    required this.name,
    required this.bio,
    required this.profileImage,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      name: json["name"],
      bio: json["bio"],
      profileImage: ProfileImage.fromJson(json["profile_image"]),
    );
  }
}

@HiveType(typeId: 4)
class ProfileImage {
  @HiveField(0)
  final String small;

  @HiveField(1)
  final String medium;

  @HiveField(2)
  final String large;

  ProfileImage({
    required this.small,
    required this.medium,
    required this.large,
  });

  factory ProfileImage.fromJson(Map<String, dynamic> json) {
    return ProfileImage(
      small: json["small"],
      medium: json["medium"],
      large: json["large"],
    );
  }
}
