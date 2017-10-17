#!/usr/bin/env bash
# Copyright (c) 2017, Anatoly Pulyaevskiy. All rights reserved. Use of this source code
# is governed by a BSD-style license that can be found in the LICENSE file.

# Usage: ./tool/build_facade.sh
#
# Note:
# - You must download firestore.d.ts from https://github.com/googleapis/nodejs-firestore
#   in the root of this repository before running this script.
# - This script was only tested on macOS and may not work on other platforms.

dart_js_facade_gen --destination=lib/src --basePath=. firestore.d.ts

awk '/func.dart/ { print; print "import \"package:node_interop/node_interop.dart\";"; next }1' lib/src/firestore.dart > lib/src/firestore.tmp.dart
rm lib/src/firestore.dart
mv lib/src/firestore.tmp.dart lib/src/firestore.dart
echo "Added dependency on node_interop (type definition for Promise)"

sed -i '' 's/NodeJS\.ReadStream/Readable/g' lib/src/firestore.dart
echo "Replaced 'NodeJS.ReadStream' with 'Readable' defined in node_interop"

sed -i '' 's/JS$set(/set(/g' lib/src/firestore.dart
sed -i '' 's/JS$get(/get(/g' lib/src/firestore.dart
echo "Removed JS$ prefix from set() and get() methods"
