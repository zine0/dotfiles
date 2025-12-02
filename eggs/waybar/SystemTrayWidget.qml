import QtQuick
import QtQuick.Controls

Rectangle {
  id: root
  height: parent.height
  implicitWidth: trayContent.width + 20
  color: "#b7bdf8" // Lavender
  radius: 8
  anchors.verticalCenter: parent.verticalCenter

  Row {
    id: trayContent
    anchors.centerIn: parent
    spacing: 6

    // Basic system tray icons
    Repeater {
      model: ["󰙯", "󰂚", "󰕧"] // Example tray icons
      Text {
        text: modelData
        color: "#24273a" // Mantle
        font.family: "FiraCode Nerd Font Mono, JetBrains Mono Nerd Font, Symbols Nerd Font"
        font.pixelSize: 16
        anchors.verticalCenter: parent.verticalCenter
      }
    }
  }

  HoverHandler {
    onHoveredChanged: {
      if (hovered) {
        parent.color = "#cad3f5" // Text color on hover
        parent.scale = 1.05
      } else {
        parent.color = "#b7bdf8" // Lavender
        parent.scale = 1.0
      }
    }
  }

  Behavior on color { ColorAnimation { duration: 200 } }
  Behavior on scale { NumberAnimation { duration: 200 } }
}