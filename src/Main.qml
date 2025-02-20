import QtQuick
import QtQuick.Layouts
import QtQuick.Controls as Controls
import org.kde.kirigami as Kirigami
import QtSensors

Kirigami.ApplicationWindow {
    id: root
    // property alias isActive: compass.active
    property real azimuth: 0
    width: 400
    height: 300
    title: i18nc("@title:window", "Compass")

    // testing rotation
    Timer {
        id: compassTimer
        interval: 30
        running: true
        repeat: true
        onTriggered: {
            root.azimuth = (root.azimuth + 1) % 360
        }
    }

    pageStack.initialPage: Kirigami.Page {
        ColumnLayout {
            anchors.centerIn: parent
            spacing: 20

            // circle and needle
            Item {
                id: compassContainer
                width: 200
                height: 200
                Layout.alignment: Qt.AlignHCenter

                // Outer circle
                Rectangle {
                    anchors.fill: parent
                    radius: width / 2
                    color: "transparent"
                    border.color: "black"
                    border.width: 2
                }

                // Compass needle
                Rectangle {
                    id: needle
                    width: 4
                    height: parent.height - 20
                    color: "red"
                    anchors.centerIn: parent

                    // Arrow head
                    Rectangle {
                        width: 12
                        height: 12
                        color: "red"
                        rotation: 45
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottom: parent.top
                        anchors.bottomMargin: -8;
                        // anchors.centerIn: parent.Top
                        // anchors.verticalCenterOffset: -parent.height
                    }

                    transform: Rotation {
                        origin.x: needle.width/2
                        origin.y: needle.height/2
                        angle: root.azimuth
                    }
                }

                // Center dot
                Rectangle {
                    width: 8
                    height: 8
                    radius: 4
                    color: "black"
                    anchors.centerIn: parent
                }
            }

            Controls.Label {
                Layout.alignment: Qt.AlignHCenter
                text: i18n("Azimuth: " + Math.round(root.azimuth) + "°")
            }
        }

        // ACTUAL COMPASS READING
        /*Compass {
         *           id: compass
         *           active: true
         *           dataRate: 7
         *           onReadingChanged: root.azimuth = -(reading as CompassReading).azimuth
    }*/
    }
}
