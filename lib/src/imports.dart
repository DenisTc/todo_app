export 'dart:async';
export 'package:flutter/material.dart';
export 'package:intl/intl.dart' hide TextDirection;
export 'package:todo_app/src/l10n/l10n.dart';
export 'package:flutter_localizations/flutter_localizations.dart';
export 'package:flutter_gen/gen_l10n/app_localizations.dart';
export 'package:flutter_svg/flutter_svg.dart';
export 'package:provider/provider.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:hive_flutter/hive_flutter.dart';
export 'package:platform_device_id/platform_device_id.dart';
export 'package:uuid/uuid.dart';
export 'package:freezed_annotation/freezed_annotation.dart';
export 'package:todo_app/src/data/storage/hive_db.dart';
export 'package:dio/dio.dart';
export 'package:flutter_dotenv/flutter_dotenv.dart';
export 'package:shake/shake.dart';

export 'package:todo_app/src/presentation/screens/screens.dart';
export 'package:todo_app/src/core/theme/app_theme.dart';
export 'package:todo_app/src/core/constants/app_icons.dart';
export 'package:todo_app/src/core/extensions/custom_colors.dart';
export 'package:todo_app/src/data/datasource/local/models/task_model.dart';
export 'package:todo_app/src/core/enums/importance_type_enum.dart';
export 'package:todo_app/src/core/environments/environment.dart';

// Data
export 'package:todo_app/src/data/repositories/app_repository_impl.dart';
export 'package:todo_app/src/data/datasource/local/local_datasource_impl.dart';

// Firebase
export 'package:firebase_core/firebase_core.dart';
export 'package:firebase_remote_config/firebase_remote_config.dart';
export 'package:firebase_crashlytics/firebase_crashlytics.dart';
