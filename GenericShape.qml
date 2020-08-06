import QtQuick 2.14
import QtQuick.Shapes 1.14

Shape{
    id: shape
    property real beginX
    property real beginY
    property real endX
    property real endY

    ShapePath {
    strokeColor: "black"
    fillColor: "light gray"
    strokeWidth: 2

    startX: shape.beginX
    startY: shape.beginY
}
