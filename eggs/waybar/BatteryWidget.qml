import QtQuick
import QtQuick.Controls

Rectangle {
  id: root
  height: parent.height
  width: batteryContent.width + 20
  color: getBatteryColor()
  radius: 8
  anchors.verticalCenter: parent.verticalCenter

  required property var batteryStatus

  Text {
    id: batteryContent
    anchors.centerIn: parent
    text: batteryStatus.displayText
    color: "#24273a" // Mantle
    font.family: "FiraCode Nerd Font Mono, JetBrains Mono Nerd Font, Symbols Nerd Font"
    font.pixelSize: 13
    font.weight: Font.Bold
  }

  function getBatteryColor() {
    if (batteryStatus.status === "charging") return "#a6da95" // Green
    if (batteryStatus.isCritical) return "#f38ba8" // Red
    if (batteryStatus.isWarning) return "#eed49f" // Yellow
    return "#f5a97f" // Peach
  }

  SequentialAnimation {
    id: criticalPulse
    running: batteryStatus.isCritical
    loops: Animation.Infinite
    ColorAnimation {
      target: root
      property: "color"
      from: "#f38ba8"
      to: "#ea999c"
      duration: 500
    }
    ColorAnimation {
      target: root
      property: "color"
      from: "#ea999c"
      to: "#f38ba8"
      duration: 500
    }
  }

  HoverHandler {
    onHoveredChanged: {
      if (hovered) {
        parent.color = "#cad3f5" // Text color on hover
        parent.scale = 1.05
        criticalPulse.pause()
      } else {
        parent.color = getBatteryColor()
        parent.scale = 1.0
        if (batteryStatus.isCritical) {
          criticalPulse.resume()
        }
      }
    }
  }

  Behavior on color { ColorAnimation { duration: 200 } }
  Behavior on scale { NumberAnimation { duration: 200 } }
}