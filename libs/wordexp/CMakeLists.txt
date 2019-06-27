# mingw32 doesn't have a native wordexp, so this one is
# ported in from glibc
find_package(Intl REQUIRED)

add_library(wordexp wordexp.c fnmatch.c)
include_directories(. ${Intl_INCLUDE_DIRS})


