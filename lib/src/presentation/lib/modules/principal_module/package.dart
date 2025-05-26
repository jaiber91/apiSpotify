import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:domain/search_items/search_items.dart';
import 'package:domain/liked_track/liked_track.dart';

import '../../../../configs/router_config/package.dart';
import '../../providers/auth_providers.dart';
import '../../providers/sesion_provider.dart';
import '../../providers/search_items_provider.dart';
import '../../providers/favorites_seed_provider.dart';
import '../../providers/derived_recomendation_provider.dart';
import '../../providers/save_track_providers.dart';
import '../../providers/liked_track_provider.dart';

part 'router.dart';
part 'pages/auth_page.dart';
part 'pages/home_page.dart';
part 'widgets/search_widget.dart';
part 'widgets/liked_track_section.dart';
