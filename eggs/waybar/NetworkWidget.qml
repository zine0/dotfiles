import QtQuick
import QtQuick.Controls

Rectangle {
  id: root
  height: parent.height
  width: networkContent.width + 20
  color: networkStatus.connectionType === "disconnected" ? "#f38ba8" : "#eed49f"
  radius: 8
  anchors.verticalCenter: parent.verticalCenter

  required property var networkStatus

  Text {
    id: networkContent
    anchors.centerIn: parent
    text: networkStatus.displayText
    color: "#24273a" // Mantle
    font.family: "FiraCode Nerd Font Mono, JetBrains Mono Nerd Font, Symbols Nerd Font"
    font.pixelSize: 13
    font.weight: Font.Bold
  }

  HoverHandler {
    onHoveredChanged: {
      if (hovered) {
        parent.color = "#cad3f5" // Text color on hover
        parent.scale = 1.05
      } else {
        parent.color = networkStatus.connectionType === "disconnected" ? "#f38ba8" : "#eed49f"
        parent.scale = 1.0
      }
    }
  }

  Behavior on color { ColorAnimation { duration: 200 } }
  Behavior on scale { NumberAnimation { duration: 200 } }
}