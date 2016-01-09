import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Pickers 1.0

Page {
    id: mainPage

    function updateRhythm(img, rhythmIndex) {
        noteIcon.updateNoteIcon(img)
        metronome.updateRhythm(rhythmIndex)
    }

    title: i18n.tr("Metronome")
    anchors { fill: parent; bottom: parent.bottom; horizontalCenter: parent.horizontalCenter }
    visible: false

    Item {
        id: metronomeContainer
        anchors { fill: parent; bottom: parent.bottom }

        Metronome{
            id: metronome

            height: units.gu(40)
            anchors.bottom: actionBar.top
        }

        Item {
            id: actionBar

            width: units.gu(40); height: units.gu(6)
            anchors { margins: units.gu(2); bottom: parent.bottom; horizontalCenter: parent.horizontalCenter }

            Item {
                id: power

                width: units.gu(8); height: units.gu(6)

                Switch {
                    anchors { fill: parent; leftMargin: units.gu(2) }
                    onClicked: metronome.playStop()
                }
            }

            TempoPicker {
                id: tempoPicker

                anchors { left: power.right; margins: units.gu(1) }
            }

            Item {
                id: noteIcon

                function updateNoteIcon(img){
                    icon.iconSource = img;
                }

                width: units.gu(6); height: units.gu(6)
                anchors { left: tempoPicker.right; margins: units.gu(1) }

                Button {
                    id: icon

                    anchors.fill: parent
                    color: "#d6d5d6"
                    iconSource: "quarter.svg"
                    onClicked: pageStack.push(Qt.resolvedUrl("RhythmPage.qml"))
                }
            }
        }
    }
}
