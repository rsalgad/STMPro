#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QPushButton>

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    Q_INVOKABLE bool getBoolCursor();
    Q_INVOKABLE bool getBoolCreateBoundary();
    Q_INVOKABLE bool getBoolEditBoundary();
    ~MainWindow();

private slots:
    void on_pushButton_clicked();
    void on_boolButton_createBoundary_clicked();
    void on_boolButton_editBoundary_clicked();

    void on_boolButton_cursor_clicked();

private:
    Ui::MainWindow *ui;
    void UnclickFrameButtons(QPushButton* button);
    bool bool_cursor;
    bool bool_createBoundary;
    bool bool_editBoundary;
};
#endif // MAINWINDOW_H
