// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $VideoDatasTable extends VideoDatas
    with TableInfo<$VideoDatasTable, VideoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VideoDatasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
    'author',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _playlistIdMeta = const VerificationMeta(
    'playlistId',
  );
  @override
  late final GeneratedColumn<String> playlistId = GeneratedColumn<String>(
    'playlist_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _thumbnailMeta = const VerificationMeta(
    'thumbnail',
  );
  @override
  late final GeneratedColumn<String> thumbnail = GeneratedColumn<String>(
    'thumbnail',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _downloadedPathMeta = const VerificationMeta(
    'downloadedPath',
  );
  @override
  late final GeneratedColumn<String> downloadedPath = GeneratedColumn<String>(
    'downloaded_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    description,
    author,
    playlistId,
    thumbnail,
    downloadedPath,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'video_datas';
  @override
  VerificationContext validateIntegrity(
    Insertable<VideoData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('author')) {
      context.handle(
        _authorMeta,
        author.isAcceptableOrUnknown(data['author']!, _authorMeta),
      );
    } else if (isInserting) {
      context.missing(_authorMeta);
    }
    if (data.containsKey('playlist_id')) {
      context.handle(
        _playlistIdMeta,
        playlistId.isAcceptableOrUnknown(data['playlist_id']!, _playlistIdMeta),
      );
    } else if (isInserting) {
      context.missing(_playlistIdMeta);
    }
    if (data.containsKey('thumbnail')) {
      context.handle(
        _thumbnailMeta,
        thumbnail.isAcceptableOrUnknown(data['thumbnail']!, _thumbnailMeta),
      );
    }
    if (data.containsKey('downloaded_path')) {
      context.handle(
        _downloadedPathMeta,
        downloadedPath.isAcceptableOrUnknown(
          data['downloaded_path']!,
          _downloadedPathMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VideoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VideoData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      author: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}author'],
      )!,
      playlistId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}playlist_id'],
      )!,
      thumbnail: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}thumbnail'],
      ),
      downloadedPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}downloaded_path'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $VideoDatasTable createAlias(String alias) {
    return $VideoDatasTable(attachedDatabase, alias);
  }
}

class VideoData extends DataClass implements Insertable<VideoData> {
  final String id;
  final String title;
  final String description;
  final String author;
  final String playlistId;
  final String? thumbnail;
  final String? downloadedPath;
  final DateTime createdAt;
  const VideoData({
    required this.id,
    required this.title,
    required this.description,
    required this.author,
    required this.playlistId,
    this.thumbnail,
    this.downloadedPath,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['author'] = Variable<String>(author);
    map['playlist_id'] = Variable<String>(playlistId);
    if (!nullToAbsent || thumbnail != null) {
      map['thumbnail'] = Variable<String>(thumbnail);
    }
    if (!nullToAbsent || downloadedPath != null) {
      map['downloaded_path'] = Variable<String>(downloadedPath);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  VideoDatasCompanion toCompanion(bool nullToAbsent) {
    return VideoDatasCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      author: Value(author),
      playlistId: Value(playlistId),
      thumbnail: thumbnail == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbnail),
      downloadedPath: downloadedPath == null && nullToAbsent
          ? const Value.absent()
          : Value(downloadedPath),
      createdAt: Value(createdAt),
    );
  }

  factory VideoData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VideoData(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      author: serializer.fromJson<String>(json['author']),
      playlistId: serializer.fromJson<String>(json['playlistId']),
      thumbnail: serializer.fromJson<String?>(json['thumbnail']),
      downloadedPath: serializer.fromJson<String?>(json['downloadedPath']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'author': serializer.toJson<String>(author),
      'playlistId': serializer.toJson<String>(playlistId),
      'thumbnail': serializer.toJson<String?>(thumbnail),
      'downloadedPath': serializer.toJson<String?>(downloadedPath),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  VideoData copyWith({
    String? id,
    String? title,
    String? description,
    String? author,
    String? playlistId,
    Value<String?> thumbnail = const Value.absent(),
    Value<String?> downloadedPath = const Value.absent(),
    DateTime? createdAt,
  }) => VideoData(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description ?? this.description,
    author: author ?? this.author,
    playlistId: playlistId ?? this.playlistId,
    thumbnail: thumbnail.present ? thumbnail.value : this.thumbnail,
    downloadedPath: downloadedPath.present
        ? downloadedPath.value
        : this.downloadedPath,
    createdAt: createdAt ?? this.createdAt,
  );
  VideoData copyWithCompanion(VideoDatasCompanion data) {
    return VideoData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      author: data.author.present ? data.author.value : this.author,
      playlistId: data.playlistId.present
          ? data.playlistId.value
          : this.playlistId,
      thumbnail: data.thumbnail.present ? data.thumbnail.value : this.thumbnail,
      downloadedPath: data.downloadedPath.present
          ? data.downloadedPath.value
          : this.downloadedPath,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VideoData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('author: $author, ')
          ..write('playlistId: $playlistId, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('downloadedPath: $downloadedPath, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    description,
    author,
    playlistId,
    thumbnail,
    downloadedPath,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VideoData &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.author == this.author &&
          other.playlistId == this.playlistId &&
          other.thumbnail == this.thumbnail &&
          other.downloadedPath == this.downloadedPath &&
          other.createdAt == this.createdAt);
}

class VideoDatasCompanion extends UpdateCompanion<VideoData> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> description;
  final Value<String> author;
  final Value<String> playlistId;
  final Value<String?> thumbnail;
  final Value<String?> downloadedPath;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const VideoDatasCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.author = const Value.absent(),
    this.playlistId = const Value.absent(),
    this.thumbnail = const Value.absent(),
    this.downloadedPath = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  VideoDatasCompanion.insert({
    required String id,
    required String title,
    required String description,
    required String author,
    required String playlistId,
    this.thumbnail = const Value.absent(),
    this.downloadedPath = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       description = Value(description),
       author = Value(author),
       playlistId = Value(playlistId);
  static Insertable<VideoData> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? author,
    Expression<String>? playlistId,
    Expression<String>? thumbnail,
    Expression<String>? downloadedPath,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (author != null) 'author': author,
      if (playlistId != null) 'playlist_id': playlistId,
      if (thumbnail != null) 'thumbnail': thumbnail,
      if (downloadedPath != null) 'downloaded_path': downloadedPath,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  VideoDatasCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String>? description,
    Value<String>? author,
    Value<String>? playlistId,
    Value<String?>? thumbnail,
    Value<String?>? downloadedPath,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return VideoDatasCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      author: author ?? this.author,
      playlistId: playlistId ?? this.playlistId,
      thumbnail: thumbnail ?? this.thumbnail,
      downloadedPath: downloadedPath ?? this.downloadedPath,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (playlistId.present) {
      map['playlist_id'] = Variable<String>(playlistId.value);
    }
    if (thumbnail.present) {
      map['thumbnail'] = Variable<String>(thumbnail.value);
    }
    if (downloadedPath.present) {
      map['downloaded_path'] = Variable<String>(downloadedPath.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VideoDatasCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('author: $author, ')
          ..write('playlistId: $playlistId, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('downloadedPath: $downloadedPath, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PlaylistDatasTable extends PlaylistDatas
    with TableInfo<$PlaylistDatasTable, PlaylistData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlaylistDatasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleOriginalMeta = const VerificationMeta(
    'titleOriginal',
  );
  @override
  late final GeneratedColumn<String> titleOriginal = GeneratedColumn<String>(
    'title_original',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
    'author',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _videoCountMeta = const VerificationMeta(
    'videoCount',
  );
  @override
  late final GeneratedColumn<int> videoCount = GeneratedColumn<int>(
    'video_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _thumbnailUrlMeta = const VerificationMeta(
    'thumbnailUrl',
  );
  @override
  late final GeneratedColumn<String> thumbnailUrl = GeneratedColumn<String>(
    'thumbnail_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _thumbnailFileMeta = const VerificationMeta(
    'thumbnailFile',
  );
  @override
  late final GeneratedColumn<String> thumbnailFile = GeneratedColumn<String>(
    'thumbnail_file',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    titleOriginal,
    author,
    videoCount,
    thumbnailUrl,
    thumbnailFile,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'playlist_datas';
  @override
  VerificationContext validateIntegrity(
    Insertable<PlaylistData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('title_original')) {
      context.handle(
        _titleOriginalMeta,
        titleOriginal.isAcceptableOrUnknown(
          data['title_original']!,
          _titleOriginalMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_titleOriginalMeta);
    }
    if (data.containsKey('author')) {
      context.handle(
        _authorMeta,
        author.isAcceptableOrUnknown(data['author']!, _authorMeta),
      );
    } else if (isInserting) {
      context.missing(_authorMeta);
    }
    if (data.containsKey('video_count')) {
      context.handle(
        _videoCountMeta,
        videoCount.isAcceptableOrUnknown(data['video_count']!, _videoCountMeta),
      );
    } else if (isInserting) {
      context.missing(_videoCountMeta);
    }
    if (data.containsKey('thumbnail_url')) {
      context.handle(
        _thumbnailUrlMeta,
        thumbnailUrl.isAcceptableOrUnknown(
          data['thumbnail_url']!,
          _thumbnailUrlMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_thumbnailUrlMeta);
    }
    if (data.containsKey('thumbnail_file')) {
      context.handle(
        _thumbnailFileMeta,
        thumbnailFile.isAcceptableOrUnknown(
          data['thumbnail_file']!,
          _thumbnailFileMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlaylistData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlaylistData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      titleOriginal: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title_original'],
      )!,
      author: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}author'],
      )!,
      videoCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}video_count'],
      )!,
      thumbnailUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}thumbnail_url'],
      )!,
      thumbnailFile: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}thumbnail_file'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $PlaylistDatasTable createAlias(String alias) {
    return $PlaylistDatasTable(attachedDatabase, alias);
  }
}

class PlaylistData extends DataClass implements Insertable<PlaylistData> {
  final String id;
  final String title;
  final String titleOriginal;
  final String author;
  final int videoCount;
  final String thumbnailUrl;
  final String? thumbnailFile;
  final DateTime createdAt;
  const PlaylistData({
    required this.id,
    required this.title,
    required this.titleOriginal,
    required this.author,
    required this.videoCount,
    required this.thumbnailUrl,
    this.thumbnailFile,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['title_original'] = Variable<String>(titleOriginal);
    map['author'] = Variable<String>(author);
    map['video_count'] = Variable<int>(videoCount);
    map['thumbnail_url'] = Variable<String>(thumbnailUrl);
    if (!nullToAbsent || thumbnailFile != null) {
      map['thumbnail_file'] = Variable<String>(thumbnailFile);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PlaylistDatasCompanion toCompanion(bool nullToAbsent) {
    return PlaylistDatasCompanion(
      id: Value(id),
      title: Value(title),
      titleOriginal: Value(titleOriginal),
      author: Value(author),
      videoCount: Value(videoCount),
      thumbnailUrl: Value(thumbnailUrl),
      thumbnailFile: thumbnailFile == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbnailFile),
      createdAt: Value(createdAt),
    );
  }

  factory PlaylistData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlaylistData(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      titleOriginal: serializer.fromJson<String>(json['titleOriginal']),
      author: serializer.fromJson<String>(json['author']),
      videoCount: serializer.fromJson<int>(json['videoCount']),
      thumbnailUrl: serializer.fromJson<String>(json['thumbnailUrl']),
      thumbnailFile: serializer.fromJson<String?>(json['thumbnailFile']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'titleOriginal': serializer.toJson<String>(titleOriginal),
      'author': serializer.toJson<String>(author),
      'videoCount': serializer.toJson<int>(videoCount),
      'thumbnailUrl': serializer.toJson<String>(thumbnailUrl),
      'thumbnailFile': serializer.toJson<String?>(thumbnailFile),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  PlaylistData copyWith({
    String? id,
    String? title,
    String? titleOriginal,
    String? author,
    int? videoCount,
    String? thumbnailUrl,
    Value<String?> thumbnailFile = const Value.absent(),
    DateTime? createdAt,
  }) => PlaylistData(
    id: id ?? this.id,
    title: title ?? this.title,
    titleOriginal: titleOriginal ?? this.titleOriginal,
    author: author ?? this.author,
    videoCount: videoCount ?? this.videoCount,
    thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
    thumbnailFile: thumbnailFile.present
        ? thumbnailFile.value
        : this.thumbnailFile,
    createdAt: createdAt ?? this.createdAt,
  );
  PlaylistData copyWithCompanion(PlaylistDatasCompanion data) {
    return PlaylistData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      titleOriginal: data.titleOriginal.present
          ? data.titleOriginal.value
          : this.titleOriginal,
      author: data.author.present ? data.author.value : this.author,
      videoCount: data.videoCount.present
          ? data.videoCount.value
          : this.videoCount,
      thumbnailUrl: data.thumbnailUrl.present
          ? data.thumbnailUrl.value
          : this.thumbnailUrl,
      thumbnailFile: data.thumbnailFile.present
          ? data.thumbnailFile.value
          : this.thumbnailFile,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlaylistData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('titleOriginal: $titleOriginal, ')
          ..write('author: $author, ')
          ..write('videoCount: $videoCount, ')
          ..write('thumbnailUrl: $thumbnailUrl, ')
          ..write('thumbnailFile: $thumbnailFile, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    titleOriginal,
    author,
    videoCount,
    thumbnailUrl,
    thumbnailFile,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlaylistData &&
          other.id == this.id &&
          other.title == this.title &&
          other.titleOriginal == this.titleOriginal &&
          other.author == this.author &&
          other.videoCount == this.videoCount &&
          other.thumbnailUrl == this.thumbnailUrl &&
          other.thumbnailFile == this.thumbnailFile &&
          other.createdAt == this.createdAt);
}

class PlaylistDatasCompanion extends UpdateCompanion<PlaylistData> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> titleOriginal;
  final Value<String> author;
  final Value<int> videoCount;
  final Value<String> thumbnailUrl;
  final Value<String?> thumbnailFile;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const PlaylistDatasCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.titleOriginal = const Value.absent(),
    this.author = const Value.absent(),
    this.videoCount = const Value.absent(),
    this.thumbnailUrl = const Value.absent(),
    this.thumbnailFile = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlaylistDatasCompanion.insert({
    required String id,
    required String title,
    required String titleOriginal,
    required String author,
    required int videoCount,
    required String thumbnailUrl,
    this.thumbnailFile = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       titleOriginal = Value(titleOriginal),
       author = Value(author),
       videoCount = Value(videoCount),
       thumbnailUrl = Value(thumbnailUrl);
  static Insertable<PlaylistData> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? titleOriginal,
    Expression<String>? author,
    Expression<int>? videoCount,
    Expression<String>? thumbnailUrl,
    Expression<String>? thumbnailFile,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (titleOriginal != null) 'title_original': titleOriginal,
      if (author != null) 'author': author,
      if (videoCount != null) 'video_count': videoCount,
      if (thumbnailUrl != null) 'thumbnail_url': thumbnailUrl,
      if (thumbnailFile != null) 'thumbnail_file': thumbnailFile,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PlaylistDatasCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String>? titleOriginal,
    Value<String>? author,
    Value<int>? videoCount,
    Value<String>? thumbnailUrl,
    Value<String?>? thumbnailFile,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return PlaylistDatasCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      titleOriginal: titleOriginal ?? this.titleOriginal,
      author: author ?? this.author,
      videoCount: videoCount ?? this.videoCount,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      thumbnailFile: thumbnailFile ?? this.thumbnailFile,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (titleOriginal.present) {
      map['title_original'] = Variable<String>(titleOriginal.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (videoCount.present) {
      map['video_count'] = Variable<int>(videoCount.value);
    }
    if (thumbnailUrl.present) {
      map['thumbnail_url'] = Variable<String>(thumbnailUrl.value);
    }
    if (thumbnailFile.present) {
      map['thumbnail_file'] = Variable<String>(thumbnailFile.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlaylistDatasCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('titleOriginal: $titleOriginal, ')
          ..write('author: $author, ')
          ..write('videoCount: $videoCount, ')
          ..write('thumbnailUrl: $thumbnailUrl, ')
          ..write('thumbnailFile: $thumbnailFile, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final $VideoDatasTable videoDatas = $VideoDatasTable(this);
  late final $PlaylistDatasTable playlistDatas = $PlaylistDatasTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    videoDatas,
    playlistDatas,
  ];
}

typedef $$VideoDatasTableCreateCompanionBuilder =
    VideoDatasCompanion Function({
      required String id,
      required String title,
      required String description,
      required String author,
      required String playlistId,
      Value<String?> thumbnail,
      Value<String?> downloadedPath,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$VideoDatasTableUpdateCompanionBuilder =
    VideoDatasCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<String> description,
      Value<String> author,
      Value<String> playlistId,
      Value<String?> thumbnail,
      Value<String?> downloadedPath,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$VideoDatasTableFilterComposer
    extends Composer<_$Database, $VideoDatasTable> {
  $$VideoDatasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get author => $composableBuilder(
    column: $table.author,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get playlistId => $composableBuilder(
    column: $table.playlistId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get thumbnail => $composableBuilder(
    column: $table.thumbnail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get downloadedPath => $composableBuilder(
    column: $table.downloadedPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$VideoDatasTableOrderingComposer
    extends Composer<_$Database, $VideoDatasTable> {
  $$VideoDatasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get author => $composableBuilder(
    column: $table.author,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get playlistId => $composableBuilder(
    column: $table.playlistId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get thumbnail => $composableBuilder(
    column: $table.thumbnail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get downloadedPath => $composableBuilder(
    column: $table.downloadedPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$VideoDatasTableAnnotationComposer
    extends Composer<_$Database, $VideoDatasTable> {
  $$VideoDatasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get author =>
      $composableBuilder(column: $table.author, builder: (column) => column);

  GeneratedColumn<String> get playlistId => $composableBuilder(
    column: $table.playlistId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get thumbnail =>
      $composableBuilder(column: $table.thumbnail, builder: (column) => column);

  GeneratedColumn<String> get downloadedPath => $composableBuilder(
    column: $table.downloadedPath,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$VideoDatasTableTableManager
    extends
        RootTableManager<
          _$Database,
          $VideoDatasTable,
          VideoData,
          $$VideoDatasTableFilterComposer,
          $$VideoDatasTableOrderingComposer,
          $$VideoDatasTableAnnotationComposer,
          $$VideoDatasTableCreateCompanionBuilder,
          $$VideoDatasTableUpdateCompanionBuilder,
          (VideoData, BaseReferences<_$Database, $VideoDatasTable, VideoData>),
          VideoData,
          PrefetchHooks Function()
        > {
  $$VideoDatasTableTableManager(_$Database db, $VideoDatasTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VideoDatasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VideoDatasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VideoDatasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> author = const Value.absent(),
                Value<String> playlistId = const Value.absent(),
                Value<String?> thumbnail = const Value.absent(),
                Value<String?> downloadedPath = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => VideoDatasCompanion(
                id: id,
                title: title,
                description: description,
                author: author,
                playlistId: playlistId,
                thumbnail: thumbnail,
                downloadedPath: downloadedPath,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                required String description,
                required String author,
                required String playlistId,
                Value<String?> thumbnail = const Value.absent(),
                Value<String?> downloadedPath = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => VideoDatasCompanion.insert(
                id: id,
                title: title,
                description: description,
                author: author,
                playlistId: playlistId,
                thumbnail: thumbnail,
                downloadedPath: downloadedPath,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$VideoDatasTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $VideoDatasTable,
      VideoData,
      $$VideoDatasTableFilterComposer,
      $$VideoDatasTableOrderingComposer,
      $$VideoDatasTableAnnotationComposer,
      $$VideoDatasTableCreateCompanionBuilder,
      $$VideoDatasTableUpdateCompanionBuilder,
      (VideoData, BaseReferences<_$Database, $VideoDatasTable, VideoData>),
      VideoData,
      PrefetchHooks Function()
    >;
typedef $$PlaylistDatasTableCreateCompanionBuilder =
    PlaylistDatasCompanion Function({
      required String id,
      required String title,
      required String titleOriginal,
      required String author,
      required int videoCount,
      required String thumbnailUrl,
      Value<String?> thumbnailFile,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$PlaylistDatasTableUpdateCompanionBuilder =
    PlaylistDatasCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<String> titleOriginal,
      Value<String> author,
      Value<int> videoCount,
      Value<String> thumbnailUrl,
      Value<String?> thumbnailFile,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$PlaylistDatasTableFilterComposer
    extends Composer<_$Database, $PlaylistDatasTable> {
  $$PlaylistDatasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get titleOriginal => $composableBuilder(
    column: $table.titleOriginal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get author => $composableBuilder(
    column: $table.author,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get videoCount => $composableBuilder(
    column: $table.videoCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get thumbnailUrl => $composableBuilder(
    column: $table.thumbnailUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get thumbnailFile => $composableBuilder(
    column: $table.thumbnailFile,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PlaylistDatasTableOrderingComposer
    extends Composer<_$Database, $PlaylistDatasTable> {
  $$PlaylistDatasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get titleOriginal => $composableBuilder(
    column: $table.titleOriginal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get author => $composableBuilder(
    column: $table.author,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get videoCount => $composableBuilder(
    column: $table.videoCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get thumbnailUrl => $composableBuilder(
    column: $table.thumbnailUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get thumbnailFile => $composableBuilder(
    column: $table.thumbnailFile,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PlaylistDatasTableAnnotationComposer
    extends Composer<_$Database, $PlaylistDatasTable> {
  $$PlaylistDatasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get titleOriginal => $composableBuilder(
    column: $table.titleOriginal,
    builder: (column) => column,
  );

  GeneratedColumn<String> get author =>
      $composableBuilder(column: $table.author, builder: (column) => column);

  GeneratedColumn<int> get videoCount => $composableBuilder(
    column: $table.videoCount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get thumbnailUrl => $composableBuilder(
    column: $table.thumbnailUrl,
    builder: (column) => column,
  );

  GeneratedColumn<String> get thumbnailFile => $composableBuilder(
    column: $table.thumbnailFile,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$PlaylistDatasTableTableManager
    extends
        RootTableManager<
          _$Database,
          $PlaylistDatasTable,
          PlaylistData,
          $$PlaylistDatasTableFilterComposer,
          $$PlaylistDatasTableOrderingComposer,
          $$PlaylistDatasTableAnnotationComposer,
          $$PlaylistDatasTableCreateCompanionBuilder,
          $$PlaylistDatasTableUpdateCompanionBuilder,
          (
            PlaylistData,
            BaseReferences<_$Database, $PlaylistDatasTable, PlaylistData>,
          ),
          PlaylistData,
          PrefetchHooks Function()
        > {
  $$PlaylistDatasTableTableManager(_$Database db, $PlaylistDatasTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlaylistDatasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlaylistDatasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlaylistDatasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> titleOriginal = const Value.absent(),
                Value<String> author = const Value.absent(),
                Value<int> videoCount = const Value.absent(),
                Value<String> thumbnailUrl = const Value.absent(),
                Value<String?> thumbnailFile = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PlaylistDatasCompanion(
                id: id,
                title: title,
                titleOriginal: titleOriginal,
                author: author,
                videoCount: videoCount,
                thumbnailUrl: thumbnailUrl,
                thumbnailFile: thumbnailFile,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                required String titleOriginal,
                required String author,
                required int videoCount,
                required String thumbnailUrl,
                Value<String?> thumbnailFile = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PlaylistDatasCompanion.insert(
                id: id,
                title: title,
                titleOriginal: titleOriginal,
                author: author,
                videoCount: videoCount,
                thumbnailUrl: thumbnailUrl,
                thumbnailFile: thumbnailFile,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PlaylistDatasTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $PlaylistDatasTable,
      PlaylistData,
      $$PlaylistDatasTableFilterComposer,
      $$PlaylistDatasTableOrderingComposer,
      $$PlaylistDatasTableAnnotationComposer,
      $$PlaylistDatasTableCreateCompanionBuilder,
      $$PlaylistDatasTableUpdateCompanionBuilder,
      (
        PlaylistData,
        BaseReferences<_$Database, $PlaylistDatasTable, PlaylistData>,
      ),
      PlaylistData,
      PrefetchHooks Function()
    >;

class $DatabaseManager {
  final _$Database _db;
  $DatabaseManager(this._db);
  $$VideoDatasTableTableManager get videoDatas =>
      $$VideoDatasTableTableManager(_db, _db.videoDatas);
  $$PlaylistDatasTableTableManager get playlistDatas =>
      $$PlaylistDatasTableTableManager(_db, _db.playlistDatas);
}
