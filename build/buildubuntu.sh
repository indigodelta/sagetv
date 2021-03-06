#!/bin/sh
#
# Copyright 2015 The SageTV Authors. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Get the version number info
MAJOR_VERSION=`grep MAJOR_VERSION ../java/sage/Version.java | grep -o [0-9]*`
MINOR_VERSION=`grep MINOR_VERSION ../java/sage/Version.java | grep -o [0-9]*`
MICRO_VERSION=`grep MICRO_VERSION ../java/sage/Version.java | grep -o [0-9]*`

echo Building server package
rm -rf ubuntuserver
mkdir ubuntuserver
# Copies control files
cp -R ubuntufiles/server/* ubuntuserver/
mkdir ubuntuserver/opt
mkdir ubuntuserver/opt/sagetv
mkdir ubuntuserver/opt/sagetv/server
cp -R serverrelease/* ubuntuserver/opt/sagetv/server/
chmod -R 755 ubuntuserver
dpkg -b ubuntuserver sagetv-server_"$MAJOR_VERSION"."$MINOR_VERSION"."$MICRO_VERSION"_i386.deb

echo Building client package
rm -rf ubuntuclient
mkdir ubuntuclient
cp -R ubuntufiles/client/* ubuntuclient/
mkdir ubuntuclient/opt
mkdir ubuntuclient/opt/sagetv
mkdir ubuntuclient/opt/sagetv/client
cp -R clientrelease/* ubuntuclient/opt/sagetv/client/
chmod -R 755 ubuntuclient
dpkg -b ubuntuclient sagetv-client_"$MAJOR_VERSION"."$MINOR_VERSION"."$MICRO_VERSION"_i386.deb

