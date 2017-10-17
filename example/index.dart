import 'package:firestore_interop/firestore_interop.dart';
import 'package:js/js.dart';
import 'package:js/js_util.dart';

void main() {
  var firestore = initFirestore(
    projectId: '<PROJECT_ID>',
    keyFilename: '<PATH_TO_SERVICE_ACCOUNT.JSON>',
  );
  var doc = firestore.doc('/posts/intro-to-firestore');
  doc.set(jsify({'body': 'Hello World'})).then(allowInterop((_) {
    print('Doc saved.');
  }), allowInterop((error) {}));
}
