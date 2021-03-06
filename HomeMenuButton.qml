import QtQuick 2.0

Rectangle{
    property string buttonLabel : "Button"
    property string commandName: "cmd"
    signal buttonPressed(string cmdName)
    signal buttonRelease()

    border.width : 2
    height:50
    width : 150
    radius:10

    Text{
        anchors.centerIn: parent
        text:buttonLabel
    }
    MultiPointTouchArea{
        anchors.fill : parent
        onPressed: buttonPresed()
        onReleased: buttonRelease()

        function buttonPresed(){
            console.log("Button: " + commandName);
            buttonPressed(commandName);
        }
    }
}
