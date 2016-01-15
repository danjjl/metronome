import QtQuick 2.4
import Qt.labs.settings 1.0
import Ubuntu.Components 1.3

MainView {
    id: mainView

    applicationName: "metronome.danjjl"
    width: units.gu(42); height: units.gu(70)

    Component.onDestruction: {
        settings.rhythmIndex = metronomePage.getRhythm()
        settings.tempo = metronomePage.getTempo()
    }

    Settings{
        id: settings

        property int rhythmIndex: 0
        property int tempo: 60
    }

    PageStack {
        id: pageStack

        Component.onCompleted: {
            rhythmPage.initializeRhythm(settings.rhythmIndex)
            metronomePage.initializeMetronome(settings.tempo, settings.rhythmIndex)
            push(metronomePage)
        }

        MainPage {
            id: metronomePage

            rhythmPagePointer: rhythmPage
        }

        RhythmPage {
            id: rhythmPage
        }
    }
}
