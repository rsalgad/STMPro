import QtQuick 2.14

Rectangle {
    id: node
    property int xPos
    property int yPos
    property int size


    x: xPos
    y: yPos
    width: size
    height: size
    color: "black"
}
