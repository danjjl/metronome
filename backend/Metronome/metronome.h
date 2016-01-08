#ifndef METRONOME_H
#define METRONOME_H

#include <QTimer>
#include <QObject>

class Metronome : public QTimer{
    Q_OBJECT
    Q_PROPERTY( int interval READ interval WRITE setInterval NOTIFY intervalChanged )   // add notify
    Q_PROPERTY( bool active READ isActive NOTIFY activeChanged )   // add notify

public:
    explicit Metronome(QObject *parent = 0);

Q_SIGNALS:
    void intervalChanged();
    void activeChanged();
};

#endif
