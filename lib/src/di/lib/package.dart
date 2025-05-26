import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:adapters/recomendation_adapter/adapter/recomendation_adapter.dart';
import 'package:adapters/recomendation_adapter/datasource/recommendation_datasource.dart';
import 'package:adapters/search_items/datasource/search_items_datasource.dart';
import 'package:adapters/shared/http/http_interface.dart';
import 'package:adapters/shared/http/http_service.dart';
import 'package:adapters/shared/storage/secure_storage_service.dart';
import 'package:adapters/auth_adapter/adapter/auth_adapter.dart';
import 'package:adapters/auth_adapter/datasource/auth_user_datasource.dart';
import 'package:adapters/auth_adapter/adapter/sesion_storage_adapter.dart';
import 'package:adapters/search_items/adapter/search_items_adapter.dart';
import 'package:adapters/save_track_adapter/datasource/datasource_save_track.dart';
import 'package:adapters/save_track_adapter/adapter/save_track_adapter.dart';
import 'package:adapters/liked_track_adapter/datasource/liked_track_datasource.dart';
import 'package:adapters/liked_track_adapter/adapter/liked_track_adapter.dart';

import 'package:out_ports/auth_user_out_port/auth_user_out_port.dart';
import 'package:out_ports/auth_user_out_port/get_token_out_port.dart';
import 'package:out_ports/recomendation_out_port/recomendation_out_port.dart';
import 'package:out_ports/search_items_out_port/search_items_out_port.dart';
import 'package:out_ports/save_track_out_port/save_track_out_port.dart';
import 'package:out_ports/liked_track_out_port/liked_track_out_port.dart';

import 'package:in_ports/aut_user_in_port/auth_user_in_port.dart';
import 'package:in_ports/aut_user_in_port/get_token_in_port.dart';
import 'package:in_ports/recomendation_in_port/recomendation_in_port.dart';
import 'package:in_ports/search_items_in_port/search_items_in_port.dart';
import 'package:in_ports/save_track_in_port/save_track_in_port.dart';
import 'package:in_ports/liked_track_in_port/liked_track_in_port.dart';

import 'package:use_cases/auth_user_use_case/auth_user_use_case.dart';
import 'package:use_cases/auth_user_use_case/get_sesion_toke_use_case.dart';
import 'package:use_cases/recomendation_use_cases/recomendation_use_case.dart';
import 'package:use_cases/search_items_use_cases/search_items_use_case.dart';
import 'package:use_cases/save_track_use_case/save_track_use_case.dart';
import 'package:use_cases/liked_track_use_case/liked_track_use_case.dart';

part 'adapters_di.dart';
part 'business_di.dart';
part 'setup_di.dart';
