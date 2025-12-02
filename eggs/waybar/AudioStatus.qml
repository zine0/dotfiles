pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
  id: root

  property int volume: 0
  property bool muted: false
  property bool bluetooth: false
  property string deviceType: "default"

  // Update audio status periodically
  Timer {
    interval: 1000
    running: true
    repeat: true
    onTriggered: updateAudioStatus()
  }

  function updateAudioStatus() {
    // Get volume using wpctl
    var volumeProc = Process {
      command: ["wpctl", "get-volume", "@DEFAULT_AUDIO_SINK@"]
      running: true

      stdout: StdioCollector {
        onStreamFinished: {
          var text = this.text.trim()
          // Parse volume from "Volume: 0.50" format
          var match = text.match(/Volume: ([\d.]+)/)
          if (match) {
            root.volume = Math.round(parseFloat(match[1]) * 100)
          }

          // Check if muted
          root.muted = text.includes("MUTED")
        }
      }
    }

    // Check for Bluetooth devices
    var btProc = Process {
      command: ["bluetoothctl", "devices", "Connected"]
      running: true

      stdout: StdioCollector {
        onStreamFinished: {
          root.bluetooth = this.text.trim().length > 0
        }
      }
    }
  }

  // Initial update
  Component.onCompleted: updateAudioStatus()

  readonly property string displayText: {
    if (muted) return "󰖁 " + volume + "%"

    var icon = getDefaultVolumeIcon()
    if (bluetooth) return icon + " " + volume + "% 󰂯"
    return icon + " " + volume + "%"
  }

  function getDefaultVolumeIcon() {
    if (volume > 66) return "󰕾"
    if (volume > 33) return "󰖀"
    return "󰕿"
  }
}