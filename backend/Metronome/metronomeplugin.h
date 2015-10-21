#ifndef  METRONOMEPLUGIN_H
#define METRONOMEPLUGIN_H

#include <QQmlExtensionPlugin>

class MetronomePlugin : public QQmlExtensionPlugin{
	Q_OBJECT
	Q_PLUGIN_METADATA(IID "danjjl.Metronome")

public:
	void registerTypes(const char *uri);
};

#endif