# Try to find the libregex library. Explicit searching is currently
# only required for Win32, though it might be useful for some UNIX
# variants, too. Therefore code for searching common UNIX include
# directories is included, too.
#
# Once done this will define
#
#  LIBREGEX_FOUND - system has libregex
#  LIBREGEX_LIBRARIES - the library needed for linking

IF (LibRegex_LIBRARY)
   SET(LibRegex_FIND_QUIETLY TRUE)
ENDIF ()

FIND_PATH(LibRegex_INCLUDE_DIR
    NAMES "regex.h"
)

FIND_LIBRARY(LibRegex_LIBRARY
    NAMES regex
)

IF (LibRegex_INCLUDE_DIR)
    SET(LIBREGEX_FOUND TRUE)
    SET(LIBREGEX_INCLUDE_DIRS ${LibRegex_INCLUDE_DIR})
    IF (LibRegex_LIBRARY)
        SET(LIBREGEX_LIBRARIES ${LibRegex_LIBRARY})
    ENDIF ()
ELSE ()
    SET(LIBREGEX_FOUND FALSE)
ENDIF ()

IF (LIBREGEX_FOUND)
    IF (NOT LibRegex_FIND_QUIETLY)
        MESSAGE(STATUS "Found libregex: ${LibRegex_INCLUDE_DIR}")
    ENDIF ()
ELSE ()
    IF (LibRegex_FIND_REQUIRED)
        MESSAGE(FATAL_ERROR "Could NOT find libregex")
    ENDIF ()
ENDIF ()

MARK_AS_ADVANCED(LibRegex_INCLUDE_DIR)
MARK_AS_ADVANCED(LibRegex_LIBRARY)
