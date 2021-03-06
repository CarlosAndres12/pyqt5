// This is the SIP interface definition for the QList based mapped types
// specific to the QtPrintSupport module.
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


%MappedType QList<QPagedPaintDevice::PageSize>
        /DocType="list-of-QPagedPaintDevice.PageSize"/
{
%TypeHeaderCode
#include <qprinterinfo.h>
%End

%ConvertFromTypeCode
    PyObject *l = PyList_New(sipCpp->size());

    if (!l)
        return 0;

    for (int i = 0; i < sipCpp->size(); ++i)
    {
        PyObject *eobj = sipConvertFromEnum(sipCpp->at(i),
                sipType_QPagedPaintDevice_PageSize);

        if (!eobj)
        {
            Py_DECREF(l);

            return 0;
        }

        PyList_SET_ITEM(l, i, eobj);
    }

    return l;
%End

%ConvertToTypeCode
    PyObject *iter = PyObject_GetIter(sipPy);

    if (!sipIsErr)
    {
        Py_XDECREF(iter);

        return (iter
#if PY_MAJOR_VERSION < 3
                && !PyString_Check(sipPy)
#endif
                && !PyUnicode_Check(sipPy));
    }

    if (!iter)
    {
        *sipIsErr = 1;

        return 0;
    }

    QList<QPagedPaintDevice::PageSize> *ql = new QList<QPagedPaintDevice::PageSize>;

    for (SIP_SSIZE_T i = 0; ; ++i)
    {
        PyErr_Clear();
        PyObject *itm = PyIter_Next(iter);

        if (!itm)
        {
            if (PyErr_Occurred())
            {
                delete ql;
                Py_DECREF(iter);
                *sipIsErr = 1;

                return 0;
            }

            break;
        }

        if (!sipCanConvertToEnum(itm, sipType_QPagedPaintDevice_PageSize))
        {
            PyErr_Format(PyExc_TypeError,
                    "index " SIP_SSIZE_T_FORMAT " has type '%s' but 'QPagedPaintDevice.PageSize' is expected",
                    i, Py_TYPE(itm)->tp_name);

            Py_DECREF(itm);
            delete ql;
            Py_DECREF(iter);
            *sipIsErr = 1;

            return 0;
        }

        ql->append(
                static_cast<QPagedPaintDevice::PageSize>(SIPLong_AsLong(itm)));

        Py_DECREF(itm);
    }

    Py_DECREF(iter);

    *sipCppPtr = ql;

    return sipGetState(sipTransferObj);
%End
};


%If (Qt_5_4_0 -)

%MappedType QList<QPrinter::DuplexMode> /DocType="list-of-QPrinter.DuplexMode"/
{
%TypeHeaderCode
#include <qprinterinfo.h>
%End

%ConvertFromTypeCode
    PyObject *l = PyList_New(sipCpp->size());

    if (!l)
        return 0;

    for (int i = 0; i < sipCpp->size(); ++i)
    {
        PyObject *eobj = sipConvertFromEnum(sipCpp->at(i),
                sipType_QPrinter_DuplexMode);

        if (!eobj)
        {
            Py_DECREF(l);

            return 0;
        }

        PyList_SET_ITEM(l, i, eobj);
    }

    return l;
%End

%ConvertToTypeCode
    PyObject *iter = PyObject_GetIter(sipPy);

    if (!sipIsErr)
    {
        Py_XDECREF(iter);

        return (iter
#if PY_MAJOR_VERSION < 3
                && !PyString_Check(sipPy)
#endif
                && !PyUnicode_Check(sipPy));
    }

    if (!iter)
    {
        *sipIsErr = 1;

        return 0;
    }

    QList<QPrinter::DuplexMode> *ql = new QList<QPrinter::DuplexMode>;

    for (SIP_SSIZE_T i = 0; ; ++i)
    {
        PyErr_Clear();
        PyObject *itm = PyIter_Next(iter);

        if (!itm)
        {
            if (PyErr_Occurred())
            {
                delete ql;
                Py_DECREF(iter);
                *sipIsErr = 1;

                return 0;
            }

            break;
        }

        if (!sipCanConvertToEnum(itm, sipType_QPrinter_DuplexMode))
        {
            PyErr_Format(PyExc_TypeError,
                    "index " SIP_SSIZE_T_FORMAT " has type '%s' but 'QPrinter.DuplexMode' is expected",
                    i, Py_TYPE(itm)->tp_name);

            Py_DECREF(itm);
            delete ql;
            Py_DECREF(iter);
            *sipIsErr = 1;

            return 0;
        }

        ql->append(
                static_cast<QPrinter::DuplexMode>(SIPLong_AsLong(itm)));

        Py_DECREF(itm);
    }

    Py_DECREF(iter);

    *sipCppPtr = ql;

    return sipGetState(sipTransferObj);
%End
};

%End
