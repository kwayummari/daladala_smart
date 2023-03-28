import 'package:daladala_smart/utils/providers/date_provider.dart';
import 'package:daladala_smart/utils/providers/shareddate_provider.dart';
import 'package:provider/provider.dart';

final appProviders = [
  ChangeNotifierProvider<SharedDate>(create: (_) => sharedDate),
  ChangeNotifierProvider<SharedData>(create: (_)=> sharedData)
];