pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
  id: root

  property var workspaces: []
  property int activeWorkspace: 0

  Timer {
    interval: 1000
    running: true
    repeat: true
    onTriggered: updateWorkspaces()
  }

  function updateWorkspaces() {
    // Use niri workspace info
    var niriProc = Process {
      command: ["niri", "msg", "workspaces"]
      running: true

      stdout: StdioCollector {
        onStreamFinished: {
          try {
            var data = JSON.parse(this.text)
            if (Array.isArray(data)) {
              var ws = []
              var active = 0
              for (var i = 0; i < data.length; i++) {
                ws.push({
                  id: data[i].id || (i + 1),
                  active: data[i].active || false,
                  urgent: data[i].urgent || false
                })
                if (data[i].active) {
                  active = i
                }
              }
              root.workspaces = ws
              root.activeWorkspace = active
            }
          } catch (e) {
            console.log("Failed to parse workspace data:", e)
          }
        }
      }
    }
  }

  Component.onCompleted: updateWorkspaces()

  function toggleWorkspace(workspaceId) {
    Process {
      command: ["niri", "msg", "action", "focus-workspace", workspaceId.toString()]
      running: true
    }
  }
}