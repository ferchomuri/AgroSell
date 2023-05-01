import 'package:agrosell/features/app/models/env_model.dart';
import 'package:agrosell/modules/dependency_injection/di.dart';
import 'package:agrosell/utils/helpers/logging_helper.dart';
import 'package:agrosell/utils/router.gr.dart';

final LoggingHelper logIt = getIt<LoggingHelper>();
final EnvModel env = getIt<EnvModel>();
final AppRouter appRouter = getIt<AppRouter>();
