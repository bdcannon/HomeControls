import QtQuick 2.0

Rectangle{
    property string buttonLabel : "Button"
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


        function buttonPresed(){
            console.log("Pressed");
        }
    }
}