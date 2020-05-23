#include "widgets/mainwindow.h"

#include <QApplication>

int main(int argc, char **argv)
{
    QApplication app(argc, argv);
    
    widgets::MainWindow w;
    w.show();
    return QApplication::exec();
}
