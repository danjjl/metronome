import QtQuick 2.4
import Ubuntu.Components 1.3

MainView {
    id: mainView

    property int rhythmIndex: 0

    applicationName: "metronome.danjjl"
    width: units.gu(42); height: units.gu(70)
    StateSaver.properties: "rhythmIndex"

    PageStack {
        id: pageStack

        Component.onCompleted: {
            push(metronomePage)
            rhythmPage.initializeRhythm(mainView.rhythmIndex)
        }

        MainPage {
            id: metronomePage
        }

        RhythmPage {
            id: rhythmPage
        }
    }
}
