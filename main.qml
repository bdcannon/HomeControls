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
        onViewSelected: {
            if(cmdName == "sl")
                mainView.push(lightControlView);
        }
    }
    LightControlView{
        id:lightControlView
        onBackPressed :{
            console.log("Trying to pop");
            mainView.pop()
        }
    }

    StackView{
        id:mainView
        anchors.horizontalCenter: parent.horizontalCenter
        initialItem: homeView
    }
}
