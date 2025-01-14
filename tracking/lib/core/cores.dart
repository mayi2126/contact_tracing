library core;

import 'dart:async';
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracking/Presentation/Auth/bloc/login_bloc.dart';
import 'package:tracking/Presentation/Auth/data/Models/user_token.dart';
import 'package:tracking/Presentation/Causeries/bloc/causerie_bloc.dart';
import 'package:tracking/Presentation/Causeries/data/Models/causerie.dart';
import 'package:tracking/Presentation/ContreRef/bloc/contre_ref_bloc.dart';
import 'package:tracking/Presentation/ContreRef/bloc/list_bloc.dart';
import 'package:tracking/Presentation/Referencement/bloc/ref_bloc.dart';
import 'package:tracking/Presentation/Referencement/bloc/referencement_bloc.dart';
import 'package:tracking/Presentation/Suivi/bloc/manage_bloc.dart';
import 'package:tracking/Presentation/Suivi/bloc/suivi_bloc.dart';
import 'package:tracking/Presentation/Suivi/data/Models/patient_suivi.dart';
import 'package:tracking/Presentation/Suivi/data/Models/suivi.dart';
import 'package:tracking/Presentation/recencement/bloc/recensement_bloc.dart';
import 'package:tracking/Presentation/recencement/data/Models/member.dart';
import 'package:tracking/Presentation/visite/bloc/visite_bloc.dart';
import 'package:tracking/Presentation/visite/data/Models/visite.dart';
import 'package:tracking/Presentation/visite/data/Models/visite_model.dart';
import 'package:tracking/db/inserts/motifs.dart';
import 'package:tracking/db/inserts/professions.dart';
import 'package:tracking/db/inserts/village_insert.dart';
import 'package:tracking/components/ui/string_date.dart';
import 'package:tracking/components/utils/load_user.dart';
import 'package:tracking/db/selects/selects.dart';
import 'package:tracking/db/sync_api.dart';
import 'package:tracking/externe-data/bloc/data_bloc.dart';
import 'package:tracking/externe-data/repo/motif_repo.dart';
import 'package:tracking/externe-data/repo/professions_repo.dart';
import 'package:tracking/externe-data/repo/theme_repo.dart';

import 'package:tracking/Presentation/recencement/data/Models/info_genrec.dart';
import 'package:tracking/Presentation/recencement/data/Models/menage.dart';
import 'package:tracking/Presentation/recencement/data/Models/recensement.dart';
import 'package:tracking/Presentation/Referencement/data/Models/referencement.dart';


import 'package:tracking/externe-data/repo/village_repo.dart';
import 'package:tracking/app/config/app_config.dart';
import 'package:tracking/app/routes/routes_name.dart';
import 'package:tracking/design_system/pallete.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:calendar_slider/calendar_slider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:location/location.dart' as l;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:panara_dialogs/panara_dialogs.dart';


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
part '../components/ui/card_causerie.dart';
part '../components/utils/card_today.dart';
part '../components/utils/visite_causerie/show_page.dart';
part '../components/utils/visite_causerie/show_page_causerie.dart';
part '../components/ui/card_referencement.dart';

/* ------------------------------- RECENSEMENT ------------------------------ */
part '../Presentation/recencement/add_recencement.dart';
part '../Presentation/recencement/page_recensement.dart';
part '../Presentation/recencement/add_member.dart';
part '../Presentation/recencement/recencement_details.dart';


/* --------------------------------- PROFILE -------------------------------- */
part '../Presentation/profiles/profile_page.dart';

part '../Presentation/Causeries/main.dart';
part '../Presentation/Causeries/add_causerie.dart';

part '../Presentation/visite/main.dart';
part '../Presentation/visite/add_visite.dart';

part '../components/utils/card_visi_causerie.dart';
part '../components/utils/card_causerie.dart';

// EXTERNE DATA
part '../components/utils/drop_menu_quartier.dart';
part '../components/utils/drop_menu_village.dart';
part '../components/utils/drop_menu_theme.dart';
part '../components/utils/drop_menu_profession.dart';
part '../components/utils/drop_menu_motif.dart';


/* ------------------------------ REFERENCEMENT ----------------------------- */
part '../Presentation/Referencement/main.dart';
part '../Presentation/ContreRef/main.dart';


/* ---------------------------------- Suivi --------------------------------- */
part '../Presentation/Suivi/main.dart';
part '../Presentation/Suivi/details_suivi.dart';