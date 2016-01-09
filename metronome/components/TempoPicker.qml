import QtQuick 2.4
import Ubuntu.Components 1.3

Rectangle {

    width: units.gu(22); height: units.gu(6)

    Component {
        id: contactDelegate

        Item {
            width: units.gu(4); height: units.gu(4)
            anchors.verticalCenter: parent.verticalCenter
            
            Label {
                anchors.centerIn: parent
                text: tempo
            }
        }
    }

    ListView {
        id: roulette

        width: units.gu(14); height: parent.height
        anchors.horizontalCenter: parent.horizontalCenter
        model: ListModel {
            Component.onCompleted: {
                for (var i = 30; i <= 240; i++) {
                        append({"tempo": i})
                    }
                roulette.positionViewAtIndex(30, ListView.Center)
                roulette.highlightMoveDuration = 0
                roulette.currentIndex = 30
                roulette.highlightMoveDuration = -1

            }
        }
        delegate: contactDelegate
        highlight: Rectangle { 
            color: "lightsteelblue"
            radius: 5
            anchors.verticalCenter: parent.verticalCenter
        }
        focus: true
        orientation: ListView.Horizontal
        preferredHighlightBegin: units.gu(7) - units.gu(2)
        preferredHighlightEnd: units.gu(7) + units.gu(2)
        highlightRangeMode: ListView.StrictlyEnforceRange
        onMovementEnded: metronome.updateTempo(currentIndex + 30)
        StateSaver.properties: "currentIndex"
    }
}
