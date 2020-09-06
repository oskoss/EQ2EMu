cmake_minimum_required(VERSION 2.8)
project (LoginServer)

file(GLOB LOGIN_SRCS "*.cpp" "*.h")
file(GLOB COMMON_SRCS "../common/*.cpp" "../common/*.h")
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/")  
find_package(MySQL)
find_package(Threads)
find_package(ZLIB)

add_definitions(-DEQ2 -DLOGIN)
add_executable(login ${LOGIN_SRCS} ${COMMON_SRCS})

target_include_directories(login PUBLIC ${MySQL_INCLUDE_DIRS} ../common/)
target_link_libraries(login PUBLIC ${MySQL_LIBRARIES} ${ZLIB_LIBRARIES} ${CMAKE_THREAD_LIBS_INIT})

