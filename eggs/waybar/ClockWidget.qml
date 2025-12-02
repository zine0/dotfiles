import QtQuick
import QtQuick.Controls

Rectangle {
  id: root
  height: parent.height
  width: clockContent.width + 20
  color: "#8aadf4" // Blue
  radius: 8
  anchors.verticalCenter: parent.verticalCenter

  required property var timeSource

  Text {
    id: clockContent
    anchors.centerIn: parent
    text: timeSource.showAltFormat ? timeSource.dateString : timeSource.timeString
    color: "#24273a" // Mantle
    font.family: "FiraCode Nerd Font Mono, JetBrains Mono Nerd Font, Symbols Nerd Font"
    font.pixelSize: 13
    font.weight: Font.Bold
  }

  MouseArea {
    anchors.fill: parent
    cursorShape: Qt.PointingHandCursor
    onClicked: {
      // Toggle between time and date format
      timeSource.showAltFormat = !timeSource.showAltFormat
    }
  }

  HoverHandler {
    onHoveredChanged: {
      if (hovered) {
        parent.color = "#cad3f5" // Text color on hover
        parent.scale = 1.05
      } else {
        parent.color = "#8aadf4" // Blue
        parent.scale = 1.0
      }
    }
  }

  Behavior on color { ColorAnimation { duration: 200 } }
  Behavior on scale { NumberAnimation { duration: 200 } }
}