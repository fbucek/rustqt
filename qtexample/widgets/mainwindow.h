#pragma once

// Qt
#include <QtWidgets>
// c++
#include <memory>

namespace Ui {
    class MainWindow;
}

/**
@namespace widgets
@brief Only for widget classes
*/
namespace widgets {

class FileViewController;
class FileViewActions;
class Controller;
class TimeMachineView;
class ProjectView;

/** @brief Main window of application */
class MainWindow : public QMainWindow // , public inv::StyledWidget
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = nullptr);
    ~MainWindow() override;

private:

private:
    Ui::MainWindow *ui;
};

} // namespace widgets
