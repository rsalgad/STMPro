import QtQuick 2.14
import QtQuick.Shapes 1.14

Shape{
    id: line
    property real beginX
    property real beginY
    property real endX
    property real endY
    ShapePath {
    strokeColor: "red"
    strokeWidth: 2
    strokeStyle: ShapePath.DashLine
    dashPattern: [ 1, 2 ]

    startX: line.beginX
    startY: line.beginY
    PathLine { x: line.endX; y: line.endY }
    }
}

