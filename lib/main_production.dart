// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:rjc_codelab_6/app/app.dart';
import 'package:rjc_codelab_6/bootstrap.dart';
import 'package:rjc_codelab_6/firebase_options.dart';

void main() async {
  await dotenv.load();
  // Change package name
  // in android\app\google-services.json
  // remove .dev
  await Firebase.initializeApp(name: 'rjc-codelab-6',
    options: DefaultFirebaseOptions.currentPlatform,);
  await bootstrap(() => const App());
}
