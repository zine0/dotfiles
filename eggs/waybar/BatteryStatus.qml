pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
  id: root

  property int capacity: 0
  property string status: "discharging" // "charging", "discharging", "full", "unknown"
  property bool isWarning: false
  property bool isCritical: false

  Timer {
    interval: 5000
    running: true
    repeat: true
    onTriggered: updateBatteryStatus()
  }

  function updateBatteryStatus() {
    var batProc = Process {
      command: ["cat", "/sys/class/power_supply/BAT0/capacity"]
      running: true

      stdout: StdioCollector {
        onStreamFinished: {
          var cap = parseInt(this.text.trim())
          if (!isNaN(cap)) {
            root.capacity = cap
            root.isWarning = cap <= 30
            root.isCritical = cap <= 15
          }
        }
      }
    }

    var statusProc = Process {
      command: ["cat", "/sys/class/power_supply/BAT0/status"]
      running: true

      stdout: StdioCollector {
        onStreamFinished: {
          var stat = this.text.trim().toLowerCase()
          if (["charging", "discharging", "full", "unknown"].includes(stat)) {
            root.status = stat
          }
        }
      }
    }
  }

  Component.onCompleted: updateBatteryStatus()

  readonly property string displayText: {
    var icon = getBatteryIcon()
    var statusIcon = getStatusIcon()
    return statusIcon + " " + capacity + "%"
  }

  function getStatusIcon() {
    switch (status) {
      case "charging": return "󰂄"
      case "full": return "󰁹"
      default: return getBatteryIcon()
    }
  }

  function getBatteryIcon() {
    var icons = ["󰂎", "󰁺", "󰁻", "󰁼", "󰁽", "󰁾", "󰁿", "󰂀", "󰂁", "󰂂"]
    var index = Math.min(Math.floor(capacity / 11.11), icons.length - 1)
    return icons[index]
  }
}