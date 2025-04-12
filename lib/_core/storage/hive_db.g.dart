// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_db.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class VideoDataAdapter extends TypeAdapter<VideoData> {
  @override
  final int typeId = 0;

  @override
  VideoData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read()};
    return VideoData(
      id: fields[0] as String,
      title: fields[1] as String,
      description: fields[2] as String,
      author: fields[3] as String,
      playlistId: fields[4] as String,
      thumbnailFile: fields[6] as String?,
      downloadedPath: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, VideoData obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.author)
      ..writeByte(4)
      ..write(obj.playlistId)
      ..writeByte(6)
      ..write(obj.thumbnailFile)
      ..writeByte(7)
      ..write(obj.downloadedPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is VideoDataAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}

class PlaylistDataAdapter extends TypeAdapter<PlaylistData> {
  @override
  final int typeId = 1;

  @override
  PlaylistData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read()};
    return PlaylistData(
      id: fields[0] as String,
      title: fields[1] as String,
      titleOriginal: fields[2] as String,
      author: fields[3] as String,
      videoCount: (fields[4] as num).toInt(),
      thumbnailUrl: fields[5] as String,
      thumbnailFile: fields[6] as String?,
      created: fields[7] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, PlaylistData obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.titleOriginal)
      ..writeByte(3)
      ..write(obj.author)
      ..writeByte(4)
      ..write(obj.videoCount)
      ..writeByte(5)
      ..write(obj.thumbnailUrl)
      ..writeByte(6)
      ..write(obj.thumbnailFile)
      ..writeByte(7)
      ..write(obj.created);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlaylistDataAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
