#!/bin/sh
if [ "$1" == "debug" ]; then
  FLAG=-g
else
  FLAG="-O2 -Xlinker --strip-all"
fi

gcc $FLAG -m64 -fPIC -DGTK -Wno-write-strings \
  `pkg-config --cflags --libs gtk+-2.0` \
  -shared -o screen_capture_64.so log.cc np_entry.cc npn_entry.cc npp_entry.cc \
  plugin_base.cc plugin_factory.cc screen_capture_plugin.cc \
  capture_linux.cc key_binder.cc \
  screen_capture_script_object.cc script_object_base.cc script_object_factory.cc
