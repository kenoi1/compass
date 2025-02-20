// Includes relevant modules used by the QML
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls as Controls
import org.kde.kirigami as Kirigami
import QtSensors



// Provides basic features needed for all kirigami applications
Kirigami.ApplicationWindow {
    // Unique identifier to reference this object
    id: root

    property alias isActive: compass.active
    property real azimuth: 30

    width: 400
    height: 300

    // Window title
    // i18nc() makes a string translatable
    // and provides additional context for the translators
    title: i18nc("@title:window", "Compass")

    // Set the first page that will be loaded when the app opens
    // This can also be set to an id of a Kirigami.Page
    pageStack.initialPage: Kirigami.Page {
        ColumnLayout {
            anchors.centerIn: parent
            spacing: 20

            Image {
                id: compassNeedle
                source: "https://raw.githubusercontent.com/KDE/kirigami/master/examples/assets/konqi.jpg"
                width: 100
                height: 100
                Layout.alignment: Qt.AlignHCenter

                transform: Rotation {
                    origin.x: compassNeedle.width/2
                    origin.y: compassNeedle.height/2
                    angle: root.azimuth
                }
            }

            Controls.Label {
                Layout.alignment: Qt.AlignHCenter
                text: i18n("Azimuth: " + Math.round(root.azimuth) + "°")
            }
        }

        Compass {
            id: compass
            active: true
            dataRate: 7
            onReadingChanged: root.azimuth = -(reading as CompassReading).azimuth
        }

    }
}
