// Copyright (c) 2017, Anatoly Pulyaevskiy. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

/// Dart facade for Cloud Firestore NodeJS client library.
///
/// _Type definitions are auto-generated using `dart_js_facade_gen` tool._
///
/// Usage:
///
///     import 'package:firestore_interop/firestore_interop.dart';
///     import 'package:js/js.dart';
///     import 'package:js/js_util.dart';
///
///     void main() {
///       var firestore = initFirestore(
///         projectId: '<PROJECT_ID>',
///         keyFilename: '<PATH_TO_SERVICE_ACCOUNT.JSON>',
///       );
///       var doc = firestore.doc('/posts/intro-to-firestore');
///       doc.set(jsify({'body': 'Hello World'})).then(allowInterop((_) {
///         print('Doc saved.');
///       }), allowInterop((error) {
///         print(error);
///       }));
///     }
library firestore_interop;

import 'dart:js';
import 'dart:js_util';

import 'src/firestore.dart';

export 'src/firestore.dart';

/// Initializes [Firestore] client.
///
/// Uses [projectId] and [keyFilename] as credentials if provided, otherwise
/// attempts to use [Application Default Credentials (ADC)](https://cloud.google.com/docs/authentication/production#providing_credentials_to_your_application).
Firestore initFirestore({String projectId, String keyFilename}) {
  context['FirebaseFirestore'] =
      context.callMethod('require', ['@google-cloud/firestore']);

  if (projectId != null && keyFilename != null) {
    var options = newObject();
    setProperty(options, 'projectId', projectId);
    setProperty(options, 'keyFilename', keyFilename);
    return new Firestore(options);
  }
  return new Firestore();
}

