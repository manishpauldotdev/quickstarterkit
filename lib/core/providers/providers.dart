import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../infrastructure/api.dart';
import '../infrastructure/hive_database.dart';

final hiveProvider = Provider((ref) => HiveDatabase());

final dioProvider = Provider((ref) => Dio());

final networkService = Provider((ref) => Api(ref.watch(dioProvider), ref.watch(hiveProvider)));
