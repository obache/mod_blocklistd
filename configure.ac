#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.71])
AC_INIT([mod_blocklistd], [1.0], [obache@wiadas.com])
AC_CONFIG_SRCDIR([mod_blocklistd.c.in])

# Checks for programs.
AC_PROG_CC
AC_PATH_PROG([APXS], [apxs], [no])
if test "$APXS" = no; then
    AC_MSG_ERROR([apxs not found.])
fi

# Checks for header files.
AC_CHECK_HEADERS_ONCE([blocklist.h blacklist.h])

BLOCKLIST_IMPL=no;
if test "$ac_cv_header_blocklist_h" = yes; then
    AC_SEARCH_LIBS([blocklist_open], [blocklist], [ BLOCKLIST_IMPL="blocklist" ], AC_MSG_ERROR([blocklist library not found.]) )
fi
if test "$ac_cv_header_blacklist_h" = yes; then
    AC_SEARCH_LIBS([blacklist_open], [blacklist], [ BLOCKLIST_IMPL="blacklist" ], AC_MSG_ERROR([blacklist library not found.]) )
fi

if test "$BLOCKLIST_IMPL" = no; then
    AC_MSG_ERROR([blacklistd not found.])
fi
AC_SUBST([BLOCKLIST_IMPL]) 

HTTPD_INSTALLBUILDDIR="`${APXS} -q installbuilddir`"
AC_SUBST([HTTPD_INSTALLBUILDDIR]) 

AC_CONFIG_FILES([Makefile
                 mod_blocklistd.c])
AC_CONFIG_LINKS([modules.mk:modules.mk])
AC_CONFIG_COMMANDS([.deps], [echo > .deps])
AC_OUTPUT
