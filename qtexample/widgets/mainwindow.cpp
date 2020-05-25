#include "mainwindow.h"
#include "ui_mainwindow.h"

// Core
#include "core/core.h"
#include "core/rocksdb.h"


namespace widgets {


MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    // Prepare UI layout
    ui->setupUi(this);
    QTextEdit *textEdit = new QTextEdit(this);
    ui->centralWidget->layout()->addWidget(textEdit);

    // Create Rust object
    Database database;
    database.setPath("rocksdb");
    database.addValue("version", "0.15");

    // Qt with Rust interact
    textEdit->setText(database.getValue("version"));
}

MainWindow::~MainWindow()
{
    delete ui;
}




} // namespace widgets
