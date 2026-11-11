import QtQuick
import qs.Commons as Commons
import qs.plugins.bar as Stock

// The stock Omarchy bar, unchanged, with an outlined pill drawn behind each
// widget (the Dreamwave look). Extending the stock bar rather than copying it
// keeps every Omarchy update to the bar; this file only adds the pills.
Stock.Bar {
  id: pillBar

  // Pill look. Colours follow the theme's [bar] text and background.
  readonly property real pillGap: 3          // half the space between pills
  readonly property real pillInset: 5        // space above and below a pill
  readonly property real pillRadius: 8
  readonly property real pillBorderWidth: 1.5
  readonly property real pillBorderAlpha: 0.9
  readonly property real pillFillAlpha: 0.35

  // Slot -> its pill. Slots come and go as widgets move, so this is kept in
  // step with the bar's own list of them.
  property var pillsBySlot: new Map()

  function syncPills() {
    var slots = moduleSlots || []
    var next = new Map()
    for (var i = 0; i < slots.length; i++) {
      var slot = slots[i]
      if (!slot || !slot.widgetRoom) continue
      var pill = pillsBySlot.get(slot)
      if (!pill) pill = pillComponent.createObject(slot.widgetRoom, { slot: slot })
      if (pill) next.set(slot, pill)
    }
    // A slot's pill is its child and goes with it; drop the rest by hand.
    pillsBySlot.forEach(function(pill, slot) {
      if (!next.has(slot) && pill) pill.destroy()
    })
    pillsBySlot = next
  }

  onModuleSlotsChanged: Qt.callLater(syncPills)
  Component.onCompleted: Qt.callLater(syncPills)

  Component {
    id: pillComponent

    Rectangle {
      property var slot: null
      readonly property bool alongX: !pillBar.vertical

      visible: !!slot
        && slot.region !== "tray"
        && slot.moduleName !== "omarchy.spacer"
        && slot.widgetWidth > 0 && slot.widgetHeight > 0
        && !slot.dragSource && !slot.removalPending
      z: -1
      anchors.fill: parent
      anchors.leftMargin: alongX ? pillBar.pillGap : pillBar.pillInset
      anchors.rightMargin: alongX ? pillBar.pillGap : pillBar.pillInset
      anchors.topMargin: alongX ? pillBar.pillInset : pillBar.pillGap
      anchors.bottomMargin: alongX ? pillBar.pillInset : pillBar.pillGap
      radius: pillBar.pillRadius
      color: Qt.alpha(Commons.Color.bar.background, pillBar.pillFillAlpha)
      border.width: pillBar.pillBorderWidth
      border.color: Qt.alpha(Commons.Color.bar.text, pillBar.pillBorderAlpha)
      antialiasing: true
    }
  }
}
