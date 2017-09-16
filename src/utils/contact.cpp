#include "contact.h"

Contact::Contact(QObject *parent) : QObject(parent)
{

}

Contact::~Contact()
{

}

QString Contact::number() const
{
    return this->_number;
}
void Contact::setNumber(const QString n)
{
    this->_number = n;
}

QString Contact::name() const
{
    return this->_name;
}
void Contact::setName(const QString name)
{
    this->_name = name;
}

