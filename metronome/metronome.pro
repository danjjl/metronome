TEMPLATE = aux
TARGET = metronome

RESOURCES +=

QML_FILES += $$files(*.qml,true) \
             $$files(*.js,true)

CONF_FILES +=  metronome.apparmor \
               metronome.desktop \
               metronome.png

AP_TEST_FILES += tests/autopilot/run \
                 $$files(tests/*.py,true)

OTHER_FILES += $${CONF_FILES} \
               $${QML_FILES} \
               $${AP_TEST_FILES}

EXTRA_FILES = $$files(*.wav,true) \
              $$files(*.svg,true)

extra_files.path = /metronome
extra_files.files += $${EXTRA_FILES}


#specify where the qml/js files are installed to
qml_files.path = /metronome
qml_files.files += $${QML_FILES}

#specify where the config files are installed to
config_files.path = /metronome
config_files.files += $${CONF_FILES}

INSTALLS+=config_files qml_files extra_files

DISTFILES += \
    components/RhythmPage.qml \
    components/Rhythm.qml

