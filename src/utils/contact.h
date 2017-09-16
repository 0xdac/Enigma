#ifndef CONTACT_H
#define CONTACT_H

#include <QObject>
#include <QString>

class Contact : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString number READ number WRITE setNumber NOTIFY numberChanged)
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)

public:
    explicit Contact(QObject *parent = 0);
    ~Contact();

    QString number() const;
    void setNumber(const QString n);

    QString name() const;
    void setName(const QString name);

signals:
    void numberChanged(const QString &n);
    void nameChanged(const QString &name);

private:
    QString _number;
    QString _name;
};

#endif // CONTACT_H
