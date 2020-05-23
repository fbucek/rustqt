#include "mainwindow.h"
#include "ui_mainwindow.h"

// Core
#include "core/core.h"
#include "core/bindings.h"

namespace widgets {


MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);


    // Try to use Rust code
    Database database; // This is the Rust object
    database.setPath("rocksdb");
    QMessageBox msgBox;
    msgBox.setText(database.message());
    msgBox.setModal(true);
    msgBox.connect(&msgBox, &QMessageBox::finished, &msgBox, []() {
        QCoreApplication::quit();
    });
    msgBox.exec();    
}

MainWindow::~MainWindow()
{
    delete ui;
}




} // namespace widgets
