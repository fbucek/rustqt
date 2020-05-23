#pragma once

#include <QObject>

namespace core {

/**
 * @brief Containter for models, managers etc.
 */
class Core : public QObject
{
    Q_OBJECT
public:
    Core();
    ~Core() override = default;


private:


};

} // namespace core
