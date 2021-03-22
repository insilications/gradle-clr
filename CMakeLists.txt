message(STATUS "cmake version ${CMAKE_VERSION}")
project (gradle)
cmake_minimum_required (VERSION 3.20.0)

set(LIB_INSTALL_DIR /usr/lib/ CACHE STRING "Install location of libraries")
set(BIN_INSTALL_DIR bin CACHE STRING "Install location of executables")
set(CMAKE_INSTALL_LIBDIR lib)
set(LIBDIR lib)

install(CODE "execute_process(COMMAND sh ${PROJECT_SOURCE_DIR}/download.bash)")

install(DIRECTORY ${PROJECT_SOURCE_DIR}/lib/ DESTINATION ${LIB_INSTALL_DIR} USE_SOURCE_PERMISSIONS)
install(DIRECTORY ${PROJECT_SOURCE_DIR}/bin/ DESTINATION ${BIN_INSTALL_DIR} USE_SOURCE_PERMISSIONS)
