pragma Singleton

import Quickshell
import QtQuick

Singleton {
  id: root

  // Time singleton for clock updates
  Time { id: timeSource }

  // System status singletons
  AudioStatus { id: audioStatus }
  NetworkStatus { id: networkStatus }
  BatteryStatus { id: batteryStatus }
  WorkspaceStatus { id: workspaceStatus }

  Variants {
    model: Quickshell.screens

    PanelWindow {
      required property var modelData
      screen: modelData

      anchors {
        top: true
        left: true
        right: true
      }

      implicitHeight: 32

      // Main background with Catppuccin Macchiato base color
      Rectangle {
        anchors.fill: parent
        color: "#1e1e2e" // Base color from waybar config
      }

      Row {
        anchors.fill: parent
        spacing: 2
        padding: 0

        // Left section with background
        Rectangle {
          id: leftSection
          height: parent.height
          width: leftContent.width + 8
          color: "#24273a" // Mantle color
          radius: 12
          anchors.verticalCenter: parent.verticalCenter
          anchors.margins: 3

          Row {
            id: leftContent
            anchors.centerIn: parent
            spacing: 4
            padding: 4

            // Arch icon
            ArchIcon {}

            // Workspaces
            WorkspacesWidget {
              workspaceStatus: workspaceStatus
            }
          }
        }

        // Center section for window title
        Rectangle {
          id: centerSection
          height: parent.height
          Layout.fillWidth: true
          color: "transparent"

          Text {
            id: windowTitle
            anchors.centerIn: parent
            text: "" // Will be updated by window status
            color: "#cad3f5" // Text color
            font.family: "FiraCode Nerd Font Mono, JetBrains Mono Nerd Font, Symbols Nerd Font"
            font.pixelSize: 14
            font.weight: 600
            font.italic: true
            maximumLineCount: 1
            elide: Text.ElideRight
            width: parent.width - 16
          }
        }

        // Right section with system widgets
        Rectangle {
          id: rightSection
          height: parent.height
          anchors.right: parent.right
          anchors.margins: 3
          color: "transparent"

          Row {
            id: rightContent
            anchors.centerIn: parent
            spacing: 2

            // System widgets
            AudioWidget {
              audioStatus: audioStatus
            }

            NetworkWidget {
              networkStatus: networkStatus
            }

            BatteryWidget {
              batteryStatus: batteryStatus
            }

            ClockWidget {
              timeSource: timeSource
            }

            SystemTrayWidget {}
          }
        }
      }
    }
  }
}