import QtQuick 2.0
import QtQuick.Controls 1.2

Rectangle{
    property int maxBarHeight: parent.height * .9
    HomeMenuButton{

    }

    Rectangle{
        id:barBackground
        anchors.right : parent.right
        anchors.rightMargin: 5
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        height: maxBarHeight
        width: parent.width * .15
        color:"red"
    }
    Rectangle{
        id:barMeter
        anchors.right : parent.right
        anchors.rightMargin: 5
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        width: parent.width * .15
        height: 10
        color:"green"
    }

    Slider{
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        maximumValue: 1
        minimumValue: 0
        value: .50
        updateValueWhileDragging: true

        onValueChanged: updateBar()

        function updateBar(){
            barMeter.height = maxBarHeight * value;
            console.log(value);
        }
    }
}
