library core;

import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracking_pregnant/Presentation/Auth/bloc/login_bloc.dart';
import 'package:tracking_pregnant/Presentation/Auth/data/Models/user_token.dart';
import 'package:tracking_pregnant/Presentation/Causeries/bloc/causerie_bloc.dart';
import 'package:tracking_pregnant/Presentation/Causeries/data/Models/causerie.dart';
import 'package:tracking_pregnant/Presentation/visite/bloc/visite_bloc.dart';
import 'package:tracking_pregnant/Presentation/visite/data/Models/visite.dart';
import 'package:tracking_pregnant/Presentation/visite/data/Models/visite_model.dart';
import 'package:tracking_pregnant/components/utils/load_user.dart';
import 'package:tracking_pregnant/externe-data/bloc/data_bloc.dart';
import 'package:tracking_pregnant/externe-data/repo/professions_repo.dart';
import 'package:tracking_pregnant/externe-data/repo/quartier_repo.dart';
import 'package:tracking_pregnant/externe-data/repo/theme_repo.dart';
import 'package:tracking_pregnant/externe-data/repo/village_repo.dart';
import 'package:tracking_pregnant/app/config/app_config.dart';
import 'package:tracking_pregnant/app/routes/routes_name.dart';
import 'package:tracking_pregnant/design_system/pallete.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:calendar_slider/calendar_slider.dart';
import 'package:awesome_dialog/awesome_dialog.dart';


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
part '../components/ui/dialog.dart';
part '../components/ui/card_visite.dart';
part '../components/utils/card_today.dart';
part '../components/utils/visite_causerie/show_page.dart';

/* ------------------------------- RECENSEMENT ------------------------------ */
part '../Presentation/recencement/add_recencement.dart';
part '../Presentation/recencement/page_recensement.dart';
part '../Presentation/recencement/add_member.dart';


/* --------------------------------- PROFILE -------------------------------- */
part '../Presentation/profiles/profile_page.dart';

part '../Presentation/Causeries/main.dart';
part '../Presentation/Causeries/add_causerie.dart';

part '../Presentation/visite/main.dart';
part '../Presentation/visite/add_visite.dart';

part '../components/utils/card_visi_causerie.dart';


// EXTERNE DATA
part '../components/utils/drop_menu_quartier.dart';
part '../components/utils/drop_menu_village.dart';
part '../components/utils/drop_menu_theme.dart';
part '../components/utils/drop_menu_profession.dart';