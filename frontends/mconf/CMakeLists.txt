if (NOT WIN32)
    find_package(Curses REQUIRED)
else(NOT WIN32)
    set(CURSES_INCLUDE_DIRS ${pdcurses_INCLUDE_DIRS})
    set(CURSES_NCURSES_LIBRARIES ${pdcurses_LIBRARIES})
endif(NOT WIN32)

find_package(Intl REQUIRED)
add_definitions(${lxdialog_DEFINES})

include_directories(
    ${kparser_INCLUDE_DIRS}
    ${lxdialog_INCLUDE_DIRS}
)

include_directories(
	${CURSES_INCLUDE_DIRS}
	${Intl_INCLUDE_DIRS}
)

set(TARGET_NAME mconf-idf)

add_executable(${TARGET_NAME}
  mconf.c
)

add_definitions(-DREL_NAME="${REL_NAME}" -DPROG_NAME="${TARGET_NAME}")

target_link_libraries(${TARGET_NAME}
  ${kparser_LIBRARIES}
  ${lxdialog_LIBRARIES}
  ${Intl_LIBRARIES}
  ${CURSES_NCURSES_LIBRARIES}
)

set(EXECUTABLE "${EXECUTABLE_OUTPUT_PATH}/${TARGET_NAME}${CMAKE_EXECUTABLE_SUFFIX}")

if (WIN32)
    get_filename_component(MINGW_PATH "${CMAKE_C_COMPILER}" PATH)
endif ()

# install(TARGETS mconf-idf DESTINATION ${BIN_INSTALL_DIR})
install(CODE "
   include(BundleUtilities)
   fixup_bundle(\"${EXECUTABLE}\"   \"\"   \"\")
   " COMPONENT Runtime)

install(TARGETS ${TARGET_NAME} DESTINATION ${BIN_INSTALL_DIR})
