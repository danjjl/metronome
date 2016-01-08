#include "metronomeplugin.h"
#include "metronome.h"
#include <qqml.h>

void MetronomePlugin::registerTypes(const char *uri)
{
    qmlRegisterType<Metronome>(uri, 1, 0, "Metronome");
}
