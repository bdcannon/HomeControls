import QtQuick 2.0

HomeMenuButton{
    id:relayButton
    property string relayAddress: "localhost"
    property int relayNumber : -1
    property bool isOn : false

    property string statusEndpoint : "/relaystatus"
    property string onEndpoint : "/relayon"
    property string offEndpoint : "/relayoff"
    property string relayParam : "?relaynum=" + relayNumber

    buttonLabel: "LightRelay"
    commandName: "lightRelay"
    color:"grey"
    state:"preInit"

    onButtonPressed: {
        if(isOn){
            console.log("Turning relay off");
            turnRelayOff();
        }
        else{
            console.log("Turning relay on");
            turnRelayOn();
        }
    }

    onIsOnChanged: {
        console.log("Changing state")
        if(isOn) state = 'relayOn';
        else state = 'relayOff';
    }

    states:[
        State{
            name:"relayOn"
            PropertyChanges{target:relayButton; color:"green"}
        },
        State{
            name:"relayOff"
            PropertyChanges{target:relayButton; color:"darkRed"}
        },
        State{
            name:"preInit"
            PropertyChanges{target:relayButton; color:"grey"}
        },
        State{
            name:"changing"
            PropertyChanges {target: relayButton; color:"orange"}
        }
    ]

    Component.onCompleted: {
        getRelayState();
    }

    function parseRelayState(stateResponseText){
        console.log(stateResponseText);
        var responseArr = stateResponseText.split(":");
        var relayIsOn = parseInt(responseArr[1]);

        if (relayIsOn == 1) relayIsOn = true;
        else if (relayIsOn == 0) relayIsOn = false;

        if(relayIsOn){
            console.log('Relay Reported on');
            isOn = true;
            state = 'relayOn';
        }
        else{
            console.log('Relay Reported off');
            isOn = false;
            state = 'relayOff';
        }
    }

    function getRelayState(){
        var http = new XMLHttpRequest()
        var url = "http://" + relayAddress + statusEndpoint + relayParam
        console.log(url);
        http.open("GET", url, true);

        // Send the proper header information along with the request
        http.setRequestHeader("Connection", "close");

        http.onreadystatechange = function() { // Call a function when the state changes.
            if (http.readyState == 4) {
                if (http.status == 200) {
                    console.log("ok");
                    parseRelayState(http.responseText);
                } else {
                    console.log("error: " + http.status)
                }
            }
        }
        http.send();
    }

    function turnRelayOn(){
        var http = new XMLHttpRequest()
        var url = "http://" + relayAddress + onEndpoint + relayParam
        console.log(url);
        http.open("GET", url, true);

        // Send the proper header information along with the request
        http.setRequestHeader("Connection", "close");

        http.onreadystatechange = function() { // Call a function when the state changes.
            if (http.readyState == 4) {
                if (http.status == 200) {
                    console.log("ok");
                    parseRelayState(http.responseText);
                } else {
                    console.log("error: " + http.status)
                }
            }
        }
        http.send();
    }

    function turnRelayOff(){
        var http = new XMLHttpRequest()
        var url = "http://" + relayAddress + offEndpoint + relayParam
        console.log(url);
        http.open("GET", url, true);

        // Send the proper header information along with the request
        http.setRequestHeader("Connection", "close");

        http.onreadystatechange = function() { // Call a function when the state changes.
            if (http.readyState == 4) {
                if (http.status == 200) {
                    console.log("ok");
                    parseRelayState(http.responseText);
                } else {
                    console.log("error: " + http.status)
                }
            }
        }
        http.send();
    }

    function setRelay(state){

    }
}
