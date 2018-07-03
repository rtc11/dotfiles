#!/bin/sh

if [ -f aktoerid_error.log.* ] ; then
 rm aktoerid_error.log.*
fi

if [ -f aktoerid_distmelding.log.* ] ; then
 rm aktoerid_distmelding.log.*
fi

if [ -f aktoerid_drift.log.* ] ; then
 rm aktoerid_drift.log.*
fi

if [ -f aktoerid_debug.log.* ] ; then
 rm aktoerid_debug.log.*
fi

if [ -f aktoerid_exception_warning.log.* ] ; then
 rm aktoerid_exception_warning.log.*
fi

if [ -f aktoerid_info.log.* ] ; then
 rm aktoerid_info.log.*
fi

truncate -s 0 aktoerid_debug.log
truncate -s 0 aktoerid_distmelding.log
truncate -s 0 aktoerid_drift.log
truncate -s 0 aktoerid_error.log
truncate -s 0 aktoerid_exception_warning.log
truncate -s 0 aktoerid_info.log