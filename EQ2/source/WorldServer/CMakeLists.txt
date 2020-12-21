cmake_minimum_required(VERSION 2.8)
project (WorldServer)

file(GLOB WORLD_SRCS "*.cpp" "*.h" "*/*.cpp" "*/*.h")
file(GLOB COMMON_SRCS "../common/*.cpp" "../common/*.h")
file(GLOB LUA_SRCS "../LUA/*.c" "../LUA/*.h")
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/")  
find_package(MySQL)
find_package(Threads)
find_package(ZLIB)

add_definitions(-DEQ2 -DWORLD)
add_executable(eq2world ${WORLD_SRCS} ${COMMON_SRCS} ${LUA_SRCS})

set(RECAST_LIBRARIES -L${CMAKE_SOURCE_DIR}/EQ2/source/depends/recastnavigation/RecastDemo/Build/gmake/lib/Debug -lDebugUtils -lDetour -lDetourCrowd -lDetourTileCache -lRecast -lboost_system -lboost_filesystem -lboost_iostreams -lboost_regex)

target_include_directories(eq2world PUBLIC ${MySQL_INCLUDE_DIRS} ../common/ ../depends/recastnavigation/Detour/Include ../depends/)
target_link_libraries(eq2world PUBLIC ${MySQL_LIBRARIES} ${ZLIB_LIBRARIES} ${CMAKE_THREAD_LIBS_INIT} ${RECAST_LIBRARIES})

