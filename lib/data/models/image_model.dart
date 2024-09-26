class ImageItems {
  late String id;
  late int width;
  late int height;
  late String blurHash;
  late Urls urls;
  late Links links;
  late User user;

  ImageItems({
    required this.id,
    required this.width,
    required this.height,
    required this.blurHash,
    required this.urls,
    required this.links,
    required this.user,
  });

  ImageItems.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    width = json["width"];
    height = json["height"];
    blurHash = json["blur_hash"];
    urls = Urls.fromJson(json["urls"]);
    links = Links.fromJson(json["links"]);
    user = User.fromJson(json["user"]);
  }
}

class Urls {
  late String raw;
  late String full;
  late String regular;
  late String small;
  late String thumb;
  late String smallS3;

  Urls({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
    required this.smallS3,
  });

  Urls.fromJson(Map<String, dynamic> json) {
    raw = json["raw"];
    full = json["full"];
    regular = json["regular"];
    small = json["small"];
    thumb = json["thumb"];
    smallS3 = json["small_s3"];
  }
}

class Links {
  late String download;
  late String downloadLocation;

  Links({
    required this.download,
    required this.downloadLocation,
  });

  Links.fromJson(Map<String, dynamic> json) {
    download = json["download"];
    downloadLocation = json["download_location"];
  }
}

class User {
  late String id;
  late String name;
  late String? bio;
  late ProfileImage profileImage;

  User({
    required this.id,
    required this.name,
    required this.bio,
    required this.profileImage,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    bio = json["bio"];
    profileImage = ProfileImage.fromJson(json["profile_image"]);
  }
}

class ProfileImage {
  late String small;
  late String medium;
  late String large;

  ProfileImage({
    required this.small,
    required this.medium,
    required this.large,
  });

  ProfileImage.fromJson(Map<String, dynamic> json) {
    small = json["small"];
    medium = json["medium"];
    large = json["large"];
  }
}
