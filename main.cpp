#include <QApplication>
#include <QQmlApplicationEngine>
#include <QLoggingCategory>
#include <QDebug>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QLoggingCategory::setFilterRules("*.debug=true");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    qDebug() << "Test";

    return app.exec();
}
