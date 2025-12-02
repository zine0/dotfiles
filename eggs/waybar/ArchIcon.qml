import QtQuick
import QtQuick.Controls

Text {
  text: "󰣇"
  color: "#8aadf4"
  font.family: "FiraCode Nerd Font Mono, JetBrains Mono Nerd Font, Symbols Nerd Font"
  font.pixelSize: 18
  font.weight: Font.Bold
  padding: { left: 10; right: 10; top: 0; bottom: 0 }
  anchors.verticalCenter: parent.verticalCenter

  MouseArea {
    anchors.fill: parent
    cursorShape: Qt.PointingHandCursor
    onClicked: {
      // Launch fuzzel
      Qt.process.start("fuzzel")
    }
  }

  HoverHandler {
    onHoveredChanged: {
      if (hovered) {
        parent.color = "#c6a0f6" // Mauve color on hover
      } else {
        parent.color = "#8aadf4" // Blue color
      }
    }
  }
}