import QtQuick
import QtQuick.Controls

Row {
  id: root
  spacing: 2
  padding: { left: 4; right: 4; top: 0; bottom: 0 }

  required property var workspaceStatus

  Repeater {
    model: workspaceStatus.workspaces

    Button {
      id: workspaceButton
      text: modelData.id.toString()

      background: Rectangle {
        color: {
          if (modelData.urgent) return "#f38ba8" // Red
          if (modelData.active) return "#c6a0f6" // Mauve
          return "transparent"
        }
        radius: 8
      }

      contentItem: Text {
        text: workspaceButton.text
        color: {
          if (modelData.active || modelData.urgent) return "#24273a" // Mantle
          return "#6e738d" // Subtext0
        }
        font.family: "FiraCode Nerd Font Mono, JetBrains Mono Nerd Font, Symbols Nerd Font"
        font.pixelSize: 13
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
      }

      padding: { left: 8; right: 8; top: 0; bottom: 0 }
      implicitHeight: 32
      implicitWidth: 32
      anchors.verticalCenter: parent.verticalCenter

      onClicked: {
        root.workspaceStatus.toggleWorkspace(modelData.id)
      }

      Behavior on color {
        ColorAnimation { duration: 200; easing.type: Easing.InOut }
      }
    }
  }
}