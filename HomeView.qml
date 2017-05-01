import QtQuick 2.0

Rectangle{
    anchors.fill : parent
    border.width: 2
    border.color: "orange"
    signal viewSelected(string cmdName)

    Column{
        id:mainMenu
        spacing: 3
        anchors.centerIn: parent

        HomeMenuButton{
            id:slViewButton
            buttonLabel: "String Light Control"
            commandName: "sl"
        }

        HomeMenuButton{
            id:byViewButton
            buttonLabel: "Backyard View"
            commandName: "by"
        }

        RelayControlButton{
            id:lightRelayControl
            buttonLabel: "Living Room Light"
            commandName: "lvRmLght"
            relayAddress: "relaycontrol.local"
            relayNumber:0
        }

        Component.onCompleted: {
            byViewButton.buttonPressed.connect(menuHandler);
            slViewButton.buttonPressed.connect(menuHandler)
        }

        function menuHandler(cmdName){
            viewSelected(cmdName);
        }
    }
}
