import QtQuick 2.4
import Ubuntu.Components 1.2
import Ubuntu.Components.Pickers 1.0

Page {
	title: i18n.tr("Metronome")
	anchors.fill: parent
	anchors.bottom: parent.bottom
	anchors.horizontalCenter: parent.horizontalCenter
	Item{
		anchors.fill: parent
		anchors.bottom: parent.bottom

		Metronome{
		id: metronome
		height: units.gu(40)
			anchors.bottom: actionBar.top
		}

		Item{
			id: actionBar
			width: units.gu(40); height: units.gu(6)
			anchors.horizontalCenter: parent.horizontalCenter
			anchors.bottom: parent.bottom
			anchors.margins: units.gu(2)

			Item{
				id: power
				width: units.gu(8); height: units.gu(6)
				Switch{
					anchors.leftMargin: units.gu(2)
					anchors.fill: parent
					onClicked: metronome.playStop()
				}
			}
			TempoPicker {
				id: tempoPicker
				anchors.left: power.right
				anchors.margins: units.gu(1)

			}
			Item{
				width: units.gu(6); height: units.gu(6)
				anchors.left: tempoPicker.right
				anchors.leftMargin: units.gu(1)
				Button {
                    color: "#d6d5d6"
                    iconSource: "quarter.svg"
        			anchors.fill: parent
        			onClicked: print("clicked icon-only Button")
    			}
			}
			
		}
	}
	


}
