import QtQuick 2.3
import QtQuick.Controls 1.2

ApplicationWindow {
    visible: true
    width: 480
    height: 320
    title: qsTr("Hello World")

    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("&Open")
                onTriggered: console.log("Open action triggered");
            }
            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }
    }

    HomeView{
        id:homeView
        anchors.centerIn: parent
        visible:false
    }
    LightControlView{
        id:lightControlView
    }

    StackView{
        anchors.horizontalCenter: parent.horizontalCenter
        id:mainView
        initialItem: lightControlView
    }
//    Rectangle{
//        height:50
//        width:100
//        color:"blue"
//        anchors.centerIn: parent
//    }
}
