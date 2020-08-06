#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QQuickWidget>
#include <QQmlContext>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    bool_cursor = true;
    bool_createBoundary = false;
    bool_editBoundary = false;
    ui->setupUi(this);
    ui->quickWidget->setSource(QUrl("qrc:/qml/DrawingArea.qml"));
    ui->quickWidget->rootContext()->setContextProperty("mainWindow", this);
}

bool MainWindow::getBoolCursor()
{
    return this->bool_cursor;
}

bool MainWindow::getBoolCreateBoundary()
{
    return this->bool_createBoundary;
}

bool MainWindow::getBoolEditBoundary()
{
    return this->bool_editBoundary;
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_boolButton_cursor_clicked()
{
    if (ui->boolButton_cursor->isChecked()){
        UnclickFrameButtons(ui->boolButton_cursor);
    }
    bool_cursor = ui->boolButton_cursor->isChecked();
}

void MainWindow::on_boolButton_createBoundary_clicked()
{
    if (ui->boolButton_createBoundary->isChecked()){
        UnclickFrameButtons(ui->boolButton_createBoundary);
    }
    bool_createBoundary = ui->boolButton_createBoundary->isChecked();
}

void MainWindow::on_boolButton_editBoundary_clicked()
{
    if (ui->boolButton_editBoundary->isChecked()){
        UnclickFrameButtons(ui->boolButton_editBoundary);
    }
    bool_editBoundary = ui->boolButton_editBoundary->isChecked();
}

void MainWindow::UnclickFrameButtons(QPushButton* button)
{
    foreach (QObject* b, ui->frame->children()){
        QPushButton* btn = qobject_cast<QPushButton*>(b);
        if (btn != NULL){
            if (btn != button)
            {
                if (btn->isChecked() == true){
                    btn->click();
                }
            }
        }
    }
}


