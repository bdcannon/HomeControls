import QtQuick 2.0

Rectangle{
    anchors.fill : parent
    border.width: 2
    border.color: "orange"

    Column{
        spacing: 3
        anchors.centerIn: parent

        HomeMenuButton{
            buttonLabel: "String Light Control"
        }

        HomeMenuButton{
            buttonLabel: "Backyard View"
        }
    }
}
