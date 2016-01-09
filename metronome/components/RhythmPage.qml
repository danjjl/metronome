import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem

Page {

    function initializeRhythm(rhythmIndex) {
        rhythmSelector.selectedIndex = rhythmIndex
        metronomePage.updateRhythm(rhythmSelector.model.get(rhythmIndex).img, rhythmIndex)
    }

    title: i18n.tr("Choose rhythm")
    anchors { topMargin: units.gu(6); fill: parent; bottom: parent.bottom; horizontalCenter: parent.horizontalCenter }
    visible: false

    ListItem.ItemSelector {
        id: rhythmSelector

        anchors { fill: parent; bottom: parent.bottom }
        expanded: true
        model: Rhythm{}
        delegate: Component{
            OptionSelectorDelegate { text: name; iconSource: img }
        }
        onDelegateClicked: metronomePage.updateRhythm(model.get(index).img, index)
    }
}
