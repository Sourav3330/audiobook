
import 'package:audio_book/data/models/book_model.dart';
import 'package:audio_book/data/models/chapter_model.dart';
import 'package:audio_book/data/service/hiveServices/hive_boxes.dart';
import 'package:hive_ce_flutter/adapters.dart';

import '../../../hive_registrar.g.dart';
class HiveInitializer {
static Future<void>initializeHive()async{
  await Hive.initFlutter();
  Hive.registerAdapters();
  await Hive.openBox<BookModel>(HiveBoxes.downloads);
  await Hive.openBox<ChapterModel>(HiveBoxes.playback);
}
}