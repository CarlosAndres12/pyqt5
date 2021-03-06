// qqmlcomponent.sip generated by MetaSIP on Thu Dec 25 10:18:21 2014
//
// This file is part of the QtQml Python extension module.
//
// Copyright (c) 2014 Riverbank Computing Limited <info@riverbankcomputing.com>
// 
// This file is part of PyQt5.
// 
// This file may be used under the terms of the GNU General Public License
// version 3.0 as published by the Free Software Foundation and appearing in
// the file LICENSE included in the packaging of this file.  Please review the
// following information to ensure the GNU General Public License version 3.0
// requirements will be met: http://www.gnu.org/copyleft/gpl.html.
// 
// If you do not wish to use this file under the terms of the GPL version 3.0
// then you may purchase a commercial license.  For more information contact
// info@riverbankcomputing.com.
// 
// This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING THE
// WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.


class QQmlComponent : QObject
{
%TypeHeaderCode
#include <qqmlcomponent.h>
%End

public:
    enum CompilationMode
    {
        PreferSynchronous,
        Asynchronous,
    };

    QQmlComponent(QQmlEngine *, QObject *parent /TransferThis/ = 0);
    QQmlComponent(QQmlEngine *, const QString &fileName, QObject *parent /TransferThis/ = 0);
    QQmlComponent(QQmlEngine *, const QString &fileName, QQmlComponent::CompilationMode mode, QObject *parent /TransferThis/ = 0);
    QQmlComponent(QQmlEngine *, const QUrl &url, QObject *parent /TransferThis/ = 0);
    QQmlComponent(QQmlEngine *, const QUrl &url, QQmlComponent::CompilationMode mode, QObject *parent /TransferThis/ = 0);
    QQmlComponent(QObject *parent /TransferThis/ = 0);
    virtual ~QQmlComponent();

    enum Status
    {
        Null,
        Ready,
        Loading,
        Error,
    };

    QQmlComponent::Status status() const;
    bool isNull() const;
    bool isReady() const;
    bool isError() const;
    bool isLoading() const;
    QList<QQmlError> errors() const;
    qreal progress() const;
    QUrl url() const;
    virtual QObject *create(QQmlContext *context = 0);
    virtual QObject *beginCreate(QQmlContext *);
    virtual void completeCreate();
    void create(QQmlIncubator &, QQmlContext *context = 0, QQmlContext *forContext = 0);
    QQmlContext *creationContext() const;

public slots:
    void loadUrl(const QUrl &url);
    void loadUrl(const QUrl &url, QQmlComponent::CompilationMode mode);
    void setData(const QByteArray &, const QUrl &baseUrl);

signals:
    void statusChanged(QQmlComponent::Status);
    void progressChanged(qreal);

private:
    QQmlComponent(const QQmlComponent &);
};
