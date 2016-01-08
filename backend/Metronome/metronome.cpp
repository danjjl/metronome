#include "metronome.h"


Metronome::Metronome(QObject *parent) :
    QTimer(parent)
{
    this->setTimerType(Qt::PreciseTimer);
}
