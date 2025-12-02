pragma Singleton

import Quickshell
import QtQuick

Singleton {
  id: root

  // Time string formatted to match waybar format
  readonly property string timeString: {
    var now = clock.date
    // Format: "󰥔 HH:MM" matching waybar format
    return "󰥔 " + Qt.formatDateTime(now, "hh:mm")
  }

  readonly property string dateString: {
    var now = clock.date
    // Alt format: "󰸗 MMM dd, Day" matching waybar format
    return "󰸗 " + Qt.formatDateTime(now, "MMM dd, ddd")
  }

  property bool showAltFormat: false

  SystemClock {
    id: clock
    precision: SystemClock.Seconds
  }
}