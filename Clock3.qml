import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 300
    height: 300
    // Set the window to be maximized
    //maximized: true
    title: "Clock Example"

    // Center the clock in the window
    Rectangle {
        id: clockFace
        anchors.fill: parent

        // Background.
        Image {
            sourceSize.width: parent.width
            sourceSize.height: parent.height
            anchors.fill: parent
            fillMode: Image.PreserveAspectCrop
            source: "./Images/background.png"
        }

        // Clock face.
        Image {
            id: clockface
            sourceSize.width: parent.width
            sourceSize.height: parent.height
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: "./Images/clockface2.png"
        }

        // Hour hand.
        Image {
            id: hourHand
            height: clockFace.height * 0.30
            fillMode: Image.PreserveAspectFit
            source: "./Images/hour2.png"
            anchors.bottom: clockFace.verticalCenter
            anchors.horizontalCenter: clockFace.horizontalCenter
            transform: Rotation {
                id: hourRotation
                origin.x: hourHand.width / 2
                origin.y: hourHand.height
                angle: 0
            }
        }

        // Minute hand
        Image {
            id: minuteHand
            height: clockFace.height * 0.42
            fillMode: Image.PreserveAspectFit
            source: "./Images/minute2.png"
            anchors.bottom: clockFace.verticalCenter
            anchors.horizontalCenter: clockFace.horizontalCenter
            transform: Rotation {
                id: minuteRotation
                origin.x: minuteHand.width / 2
                origin.y: minuteHand.height
                angle: 0
            }
        }

        // Second hand
        Image {
            id: secondHand
            height: clockFace.height * 0.44
            fillMode: Image.PreserveAspectFit
            source: "./Images/second3.png"
            anchors.bottom: clockFace.verticalCenter
            anchors.horizontalCenter: clockFace.horizontalCenter
            transform: Rotation {
                id: secondRotation
                origin.x: secondHand.width / 2
                origin.y: secondHand.height
                angle: 0
            }
        }

        // Cap
        // Create a circle
        Rectangle {
            id: gradientCircle
            height: clockFace.height * 0.095
            width: clockFace.height * 0.095
            anchors.centerIn: parent // Center the circle in the window
            color: "white"

            // Make the rectangle a circle by setting radius to half of width/height
            radius: width * 0.5

            // Define the gradient fill
            gradient: Gradient {
//                // Define gradient stops (colors at specific positions)
//                GradientStop { position: 0.0; color: "red" }
//                GradientStop { position: 0.5; color: "yellow" }
//                GradientStop { position: 1.0; color: "green" }

//                // Define gradient stops with different shades of gold/yellow
//                GradientStop { position: 0.0; color: "#FFD700" } // Gold
//                GradientStop { position: 0.5; color: "#FFCC00" } // Slightly lighter gold
//                GradientStop { position: 1.0; color: "#FFD700" } // Gold

                // Define gradient stops with gray and black
                GradientStop { position: 0.0; color: "black" } // Start with black
                GradientStop { position: 1.0; color: "gray" } //  End with gray

            }

        }


    }

    // Timer to update the clock hands every second
    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            var date = new Date();
            var seconds = date.getSeconds();
            var minutes = date.getMinutes() + seconds / 60;
            var hours = date.getHours() + minutes / 60;

            secondRotation.angle = seconds * 6;
            minuteRotation.angle = minutes * 6;
            hourRotation.angle = (hours % 12) * 30;
        }
    }
}
