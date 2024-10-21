library core;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tracking_pregnant/Presentation/Auth/bloc/login_bloc.dart';
import 'package:tracking_pregnant/Presentation/Auth/data/Repositories/user_login_repo.dart';
import 'package:tracking_pregnant/app/config/app_config.dart';
import 'package:tracking_pregnant/app/routes/routes_name.dart';
import 'package:tracking_pregnant/app/storage/local_storage.dart';
import 'package:tracking_pregnant/design_system/pallete.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';


part '../components/ui/auth/text_form_input.dart';
part '../components/ui/custom_button.dart';
part '../components/ui/dots.dart';
part '../components/ui/primary_button.dart';



part '../Presentation/Auth/login/page.dart';
part '../Presentation/splash/splash.dart';

part '../Presentation/dashboard/main.dart';

part '../Presentation/dashboard/views/items.dart';
part '../Presentation/dashboard/views/recent_tracking.dart';

/* ----------------------------------- UI ----------------------------------- */
part '../components/ui/card.dart';
part '../components/ui/recent_tracking_card.dart';
part '../components/ui/form_recencement.dart';

/* ------------------------------- RECENSEMENT ------------------------------ */
part '../Presentation/recencement/add_recencement.dart';
part '../Presentation/recencement/page_recensement.dart';


/* --------------------------------- PROFILE -------------------------------- */
part '../Presentation/profiles/profile_page.dart';