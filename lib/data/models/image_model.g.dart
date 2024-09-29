// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImageItemsAdapter extends TypeAdapter<ImageItems> {
  @override
  final int typeId = 0;

  @override
  ImageItems read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImageItems(
      id: fields[0] as String,
      width: fields[1] as int,
      height: fields[2] as int,
      blurHash: fields[3] as String,
      urls: fields[4] as Urls,
      links: fields[5] as Links,
      user: fields[6] as User,
    );
  }

  @override
  void write(BinaryWriter writer, ImageItems obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.width)
      ..writeByte(2)
      ..write(obj.height)
      ..writeByte(3)
      ..write(obj.blurHash)
      ..writeByte(4)
      ..write(obj.urls)
      ..writeByte(5)
      ..write(obj.links)
      ..writeByte(6)
      ..write(obj.user);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageItemsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UrlsAdapter extends TypeAdapter<Urls> {
  @override
  final int typeId = 1;

  @override
  Urls read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Urls(
      raw: fields[0] as String,
      full: fields[1] as String,
      regular: fields[2] as String,
      small: fields[3] as String,
      thumb: fields[4] as String,
      smallS3: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Urls obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.raw)
      ..writeByte(1)
      ..write(obj.full)
      ..writeByte(2)
      ..write(obj.regular)
      ..writeByte(3)
      ..write(obj.small)
      ..writeByte(4)
      ..write(obj.thumb)
      ..writeByte(5)
      ..write(obj.smallS3);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UrlsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LinksAdapter extends TypeAdapter<Links> {
  @override
  final int typeId = 2;

  @override
  Links read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Links(
      download: fields[0] as String,
      downloadLocation: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Links obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.download)
      ..writeByte(1)
      ..write(obj.downloadLocation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LinksAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 3;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      id: fields[0] as String,
      name: fields[1] as String,
      bio: fields[2] as String?,
      profileImage: fields[3] as ProfileImage,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.bio)
      ..writeByte(3)
      ..write(obj.profileImage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProfileImageAdapter extends TypeAdapter<ProfileImage> {
  @override
  final int typeId = 4;

  @override
  ProfileImage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProfileImage(
      small: fields[0] as String,
      medium: fields[1] as String,
      large: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProfileImage obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.small)
      ..writeByte(1)
      ..write(obj.medium)
      ..writeByte(2)
      ..write(obj.large);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileImageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
