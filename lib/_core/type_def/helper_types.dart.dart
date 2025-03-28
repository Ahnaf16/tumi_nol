import 'dart:async';

import 'package:tumi_nol/main.export.dart';

typedef FromMapT<T> = T Function(QMap map);
typedef ToMapT<T> = Map Function(T data);

//?? dio
// typedef ResponseCallBack = Future<Response> Function();

typedef QMap = Map<String, dynamic>;
typedef SMap = Map<String, String>;

typedef FVoid = Future<void>;
typedef FutureCallback<T> = Future<T> Function();
typedef FutureVCallback<T> = Future<T> Function(T value);
typedef FutureVoidCallback = Future<void> Function();
typedef StSub<T> = StreamSubscription<T>;

typedef LuIcons = LucideIcons;
