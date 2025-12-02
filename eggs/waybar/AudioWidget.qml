import QtQuick
import QtQuick.Controls

Rectangle {
  id: root
  height: parent.height
  width: audioContent.width + 20
  color: "#a6da95" // Green
  radius: 8
  anchors.verticalCenter: parent.verticalCenter

  required property var audioStatus

  Text {
    id: audioContent
    anchors.centerIn: parent
    text: audioStatus.displayText
    color: "#24273a" // Mantle
    font.family: "FiraCode Nerd Font Mono, JetBrains Mono Nerd Font, Symbols Nerd Font"
    font.pixelSize: 13
    font.weight: Font.Bold
  }

  MouseArea {
    anchors.fill: parent
    cursorShape: Qt.PointingHandCursor
    onClicked: {
      // Left click: open pavucontrol
      Qt.process.start("pavucontrol")
    }
    onDoubleClicked: {
      // Middle click: toggle mute
      Qt.process.start("wpctl", ["set-mute", "@DEFAULT_AUDIO_SINK@", "toggle"])
    }
  }

  HoverHandler {
    onHoveredChanged: {
      if (hovered) {
        parent.color = "#cad3f5" // Text color on hover
        parent.scale = 1.05
      } else {
        parent.color = audioStatus.muted ? "#f38ba8" : "#a6da95"
        parent.scale = 1.0
      }
    }
  }

  Behavior on color { ColorAnimation { duration: 200 } }
  Behavior on scale { NumberAnimation { duration: 200 } }
}