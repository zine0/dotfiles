pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
  id: root

  property string connectionType: "disconnected" // "wifi", "ethernet", "disconnected", "linked"
  property string essid: ""
  property string interface: ""
  property string ipAddress: ""

  Timer {
    interval: 2000
    running: true
    repeat: true
    onTriggered: updateNetworkStatus()
  }

  function updateNetworkStatus() {
    // Check WiFi connection
    var wifiProc = Process {
      command: ["nmcli", "-t", "-f", "NAME,TYPE", "connection", "show", "--active"]
      running: true

      stdout: StdioCollector {
        onStreamFinished: {
          var lines = this.text.trim().split('\n')
          for (var i = 0; i < lines.length; i++) {
            var parts = lines[i].split(':')
            if (parts.length >= 2) {
              if (parts[1] === "802-11-wireless") {
                root.connectionType = "wifi"
                root.essid = parts[0]
                return
              } else if (parts[1] === "802-3-ethernet") {
                root.connectionType = "ethernet"
                root.interface = parts[0]
                return
              }
            }
          }
          root.connectionType = "disconnected"
        }
      }
    }

    // Get IP address
    var ipProc = Process {
      command: ["ip", "route", "get", "1.1.1.1"]
      running: true

      stdout: StdioCollector {
        onStreamFinished: {
          var match = this.text.match(/src ([\d.]+)/)
          if (match) {
            root.ipAddress = match[1]
            if (root.connectionType === "disconnected") {
              root.connectionType = "linked"
            }
          }
        }
      }
    }
  }

  Component.onCompleted: updateNetworkStatus()

  readonly property string displayText: {
    switch (connectionType) {
      case "wifi": return "󰖩 " + essid
      case "ethernet": return "󰈀 Wired"
      case "linked": return "󰊗 " + (interface || "Unknown") + " (No IP)"
      case "disconnected": return "󰖪 Disconnected"
      default: return "󰖪 Unknown"
    }
  }
}