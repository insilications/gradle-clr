message(STATUS "cmake version ${CMAKE_VERSION}")
project (gradle)
cmake_minimum_required (VERSION 3.20.0)

set(LIB_INSTALL_DIR lib CACHE STRING "Install location of libraries")
set(BIN_INSTALL_DIR bin CACHE STRING "Install location of executables")

install(CODE "execute_process(COMMAND sh ${PROJECT_SOURCE_DIR}/download.bash)")

file(GLOB LIB_DIR_FILES
     LIST_DIRECTORIES true
    ${PROJECT_BINARY_DIR}/gradle-*/lib
)
file(GLOB BIN_DIR_FILES
     LIST_DIRECTORIES true
    ${PROJECT_BINARY_DIR}/gradle-*/bin
)
#install(CODE "MESSAGE(\"LIB_DIR_FILES ${LIB_DIR_FILES}\")")
#install(CODE "MESSAGE(\"BIN_DIR_FILES ${BIN_DIR_FILES}\")")
install(DIRECTORY ${LIB_DIR_FILES} DESTINATION ${LIB_INSTALL_DIR} USE_SOURCE_PERMISSIONS)
install(DIRECTORY ${BIN_DIR_FILES} DESTINATION ${BIN_INSTALL_DIR} USE_SOURCE_PERMISSIONS)
