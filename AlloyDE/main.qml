import QtQuick
import QtQuick.Controls

Window {
    id: root
    visible: true
    visibility: Window.FullScreen
    color: "#000000"

    Desktop {
        id: desktop
        anchors.fill: parent
    }

    Panel {
        id: panel
        width: parent.width
        height: 48
        anchors.bottom: parent.bottom
    }

    AppLauncher {
        id: launcher
        anchors.fill: parent
        visible: false
    }

    Shortcut {
        sequence: "Escape"
        onActivated: launcher.visible = false
    }

    Shortcut {
        sequence: "Meta"
        onActivated: launcher.visible = !launcher.visible
    }
}
