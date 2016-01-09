import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem

Page {

    function initializeRythm(rythmIndex) {
        rythmSelector.selectedIndex = rythmIndex
        console.log(rythmIndex)
        metronomePage.updateRythm(rythmSelector.model.get(rythmIndex).img, rythmIndex)
    }

    title: i18n.tr("Choose rythm")
    anchors { topMargin: units.gu(6); fill: parent; bottom: parent.bottom; horizontalCenter: parent.horizontalCenter }
    visible: false

    ListItem.ItemSelector {
        id: rythmSelector

        anchors { fill: parent; bottom: parent.bottom }
        expanded: true
        model: Rythm{}
        delegate: Component{
            OptionSelectorDelegate { text: name; iconSource: img }
        }
        onDelegateClicked: metronomePage.updateRythm(model.get(index).img, index)
    }
}
