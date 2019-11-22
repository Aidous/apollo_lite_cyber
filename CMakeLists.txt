cmake_minimum_required(VERSION 3.5.1)
project(apollo)

find_program(CCACHE_PROGRAM ccache)
if(CCACHE_PROGRAM)
    set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE "${CCACHE_PROGRAM}")
endif()

set(CMAKE_CXX_STANDARD 11)

#set(CMAKE_BUILD_TYPE "Release")

set(CMAKE_CXX_FLAGS "-w -fPIC -std=c++11 ${CMAKE_CXX_FLAGS}")

set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -rdynamic -pthread")

# set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -rdynamic -pthread")

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

add_subdirectory(deps/googletest EXCLUDE_FROM_ALL)

option(ENABLE_CUDA "enable cuda for planning" OFF)

find_package(PROTOBUF REQUIRED)
find_package(gflags REQUIRED)
find_package(qpOASES REQUIRED)
find_package(osqp REQUIRED)
find_package(GLOG REQUIRED)
find_package(curlpp REQUIRED)
find_package(TINYXML2 REQUIRED)
find_package(PROJ4 REQUIRED)
find_package(IPOPT REQUIRED)
find_package(ADOLC REQUIRED)
find_package(Eigen3 QUIET)
find_package(OpenMP)
find_package(PythonLibs 2.7 REQUIRED)

find_package(FastRTPS REQUIRED)

if(ENABLE_CUDA)
  find_package(CUDA REQUIRED)
  add_definitions(-DUSE_GPU)
  include_directories(${CUDA_INCLUDE_DIRS})
else()
  set(CUDA_LIBRARIES "")
  set(CUDA_INCLUDE_DIRS "")
endif(ENABLE_CUDA)


set(CMAKE_INSTALL_PREFIX ${CMAKE_CURRENT_SOURCE_DIR}/apollo)

if (OPENMP_FOUND)
    set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${OpenMP_C_FLAGS}")
    set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${OpenMP_CXX_FLAGS}")
    set (CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${OpenMP_EXE_LINKER_FLAGS}")
endif()

if(NOT EIGEN3_FOUND)
  find_package(PkgConfig REQUIRED)
  pkg_check_modules(EIGEN3 REQUIRED eigen3)
  set(EIGEN3_INCLUDE_DIR ${EIGEN3_INCLUDE_DIRS})
endif()
include_directories(include
                    ${gtest_SOURCE_DIR}/include/
                    ${gmock_SOURCE_DIR}/include/
                    ${gtest_SOURCE_DIR}
                    ${CMAKE_CURRENT_SOURCE_DIR}
                    ${qpOASES_INCLUDE_DIRS}
                    ${osqp_INCLUDE_DIRS}
                    ${TINYXML2_INCLUDE_DIRS}
                    ${IPOPT_INCLUDE_DIRS}
                    ${PROJ4_INCLUDE_DIRS}
                    ${ADOLC_INCLUDE_DIRS}
                    ${CUDA_INCLUDE_DIRS}
                    ${EIGEN3_INCLUDE_DIR}
                    ${FastRTPS_INCLUDE_DIR}
                    )

add_subdirectory(cyber)
add_subdirectory(modules/examples)
#add_subdirectory(third_party/json)
add_subdirectory(third_party/tf2)
#add_subdirectory(third_party/ad-rss-lib)


install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/modules
        DESTINATION .
        FILES_MATCHING PATTERN "*.pb.txt"
        PATTERN ".svn" EXCLUDE
)

install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/modules
        DESTINATION .
        FILES_MATCHING PATTERN "*.txt"
        PATTERN ".svn" EXCLUDE
)

install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/modules
        DESTINATION .
        FILES_MATCHING PATTERN "*.bin"
        PATTERN ".svn" EXCLUDE
)

install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/modules
        DESTINATION .
        FILES_MATCHING PATTERN "*.conf"
        PATTERN ".svn" EXCLUDE
)

install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/cyber
        DESTINATION .
        FILES_MATCHING PATTERN "*.*.pb.txt"
        PATTERN ".svn" EXCLUDE
)

install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/cyber
        DESTINATION .
        FILES_MATCHING PATTERN "*.conf"
        PATTERN ".svn" EXCLUDE
)

install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/modules
        DESTINATION include
        FILES_MATCHING PATTERN "*.h" PATTERN "*.hxx"
        PATTERN ".svn" EXCLUDE
)

install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/cyber
        DESTINATION include
        FILES_MATCHING PATTERN "*.h" PATTERN "*.hxx"
        PATTERN ".svn" EXCLUDE
)
