import QtQuick 2.14
import QtQuick.Shapes 1.14

Rectangle {
    id: flickArea

    property int lastX: 0
    property int lastY: 0
    property var sceneNodes: []
    property var sceneLines: []
    property var tempLines: []
    property bool lineStarted: false
    property real viewWidth: width
    property real viewHeight: height
    property real viewScale: 1

    MouseArea {
        id: mouseArea
        anchors.fill: flickArea
        property int nodeCount: 1
        onPressed: {
        }

        onClicked: {
            if (mainWindow.getBoolCursor()){
            } else if (mainWindow.getBoolCreateBoundary()){
                if (sceneNodes.length !== 0 && mouseX <= sceneNodes[0].xPos + sceneNodes[0].size && mouseX > sceneNodes[0].xPos && mouseY <= sceneNodes[0].yPos + sceneNodes[0].size && mouseY > sceneNodes[0].yPos){
                    createLine(sceneNodes[0].xPos + sceneNodes[0].size / 2, sceneNodes[0].yPos + sceneNodes[0].size / 2)
                } else {
                    createNode(mouseX, mouseY, 10)
                    if (nodeCount !== 1){
                        createLine(mouseX, mouseY)
                        addPermanentLine(tempLines.pop())

                        lastX = mouseX
                        lastY = mouseY
                    } else {
                        lastX = mouseX
                        lastY = mouseY
                    }
                    nodeCount++
                }
            }
        }

        onWheel: {
            if (wheel.angleDelta.y > 0){
                root.scale += 0.1
            } else {
                root.scale -= 0.1
                if (root.scale < 0){
                    root.scale = 0
                }
            }
        }

        onPositionChanged: {
        }
    }

    Rectangle {
        id: root
        anchors.fill: flickArea
        scale: 1
        color: "light gray"
    }

    function zoomDrawing(item){
        var xRatio = item.xPos / root.width
        var yRatio = item.yPos / root.height
        var scaledWidth = viewScale * root.width
        var scaledHeight = viewScale * root.height

        item.xPos = (root.width - scaledWidth) * 0.5 + xRatio * scaledWidth
        item.yPos = (root.height - scaledHeight) * 0.5 + yRatio * scaledHeight
    }


    function createNode(x, y, size){
        var component = Qt.createComponent("qrc:/qml/Node.qml");
        if (component.status === Component.Ready) {
            var node = component.createObject(root)
            console.log(x)
            console.log(y)
            node.xPos = (x - 5)
            node.yPos = (y - 5)

            node.size = size
            sceneNodes.push(node)
        }
    }

    function createLine(x, y){
        var component = Qt.createComponent("qrc:/qml/Line.qml");
        if (component.status === Component.Ready) {
            var line = component.createObject(root)
            line.beginX = lastX
            line.beginY = lastY
            line.endX = x
            line.endY = y
            tempLines.push(line)
        } else {
            console.log(component.errorString())
        }
    }

    function deleteLastLine(){
        if (tempLines !== 0){
            tempLines.pop().destroy()
        }
    }

    function addPermanentLine(line){
        sceneLines.push(line)
    }
}
