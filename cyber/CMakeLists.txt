cmake_minimum_required(VERSION 3.5.1)

project(cyber)

ENABLE_LANGUAGE(ASM)

find_package(UUID REQUIRED)
#find_package(FastRTPS REQUIRED)  # can not effective, so move it to above layout.
include_directories(${GLOG_INCLUDE_DIRS}
					${gflags_INCLUDE_DIRS}
					${PROTOBUF_INCLUDE_DIRS}
					${UUID_INCLUDE_DIR}
					${PYTHON_INCLUDE_DIRS})

add_subdirectory(base)
add_subdirectory(blocker)
add_subdirectory(class_loader)
add_subdirectory(common)
add_subdirectory(component)
add_subdirectory(croutine)
add_subdirectory(data)
add_subdirectory(event)
add_subdirectory(examples)
add_subdirectory(logger)
add_subdirectory(proto)
add_subdirectory(message)
add_subdirectory(node)
add_subdirectory(scheduler)
add_subdirectory(service)
add_subdirectory(service_discovery)
add_subdirectory(time)
add_subdirectory(timer)
add_subdirectory(task)
add_subdirectory(transport)
add_subdirectory(record)
add_subdirectory(io)
add_subdirectory(parameter)
add_subdirectory(py_wrapper)
add_subdirectory(tools/cyber_monitor)
add_subdirectory(tools/cyber_recorder)
#
add_library(cyber_binary binary.h)
set_target_properties(cyber_binary PROPERTIES LINKER_LANGUAGE CXX)
add_library(cyber::binary ALIAS cyber_binary)

add_library(cyber_state state.cc)
target_link_libraries(cyber_state cyber::common)
add_library(cyber::state ALIAS cyber_state)

add_library(cyber_init init.cc)
target_link_libraries(cyber_init cyber::state
					  cyber::logger
					  cyber::node
					  cyber::timer)
add_library(cyber::init ALIAS cyber_init)

add_library(cyber_core cyber.cc)
target_link_libraries(cyber_core cyber::binary
					  cyber::init
					  cyber::state
					  cyber::base
					  cyber::blocker
					  cyber::class_loader
					  cyber::common
					  cyber::component
					  cyber::croutine
					  cyber::data
					  cyber::event
					  cyber::io
					  cyber::logger
					  cyber::message
					  cyber::node
					  cyber::parameter
					  cyber::proto
					  cyber::record
					  cyber::scheduler
					  cyber::service
					  cyber::service_discovery
					  cyber::task
					  cyber::time
					  cyber::timer
					  cyber::transport
					  3rdparty::tf2
					  ${GLOG_LIBRARIES}
					  ${gflags_LIBRARIES}
					  ${PROTOBUF_LIBRARIES}
					  ${UUID_LIBRARY}
					  ${FastRTPS_LIBRARIES})
add_library(cyber::cyber_core ALIAS cyber_core)

add_library(cyber cyber.cc)
target_link_libraries(cyber cyber::cyber_core)
add_library(cyber::cyber ALIAS cyber)

add_executable(mainboard mainboard/mainboard.cc
			   mainboard/module_argument.cc
			   mainboard/module_controller.cc)
target_link_libraries(mainboard pthread cyber::proto
					  cyber::time_component_example
					  cyber::cyber_core)

install(TARGETS cyber_binary
		cyber_state
		cyber_init
		cyber_core
		cyber
		mainboard
		LIBRARY DESTINATION lib
		ARCHIVE DESTINATION lib
		RUNTIME DESTINATION bin
		INCLUDES DESTINATION .
		)

