#cmake_minimum_required(VERSION 3.5.1)
#
#add_library(cyber_py_wrapper cyber_init_wrap.cc
#			cyber_node_wrap.cc
#			cyber_parameter_wrap.cc
#			cyber_record_wrap.cc
#			cyber_time_wrap.cc
#			cyber_timer_wrap.cc
#			cyber_topology_manager_wrap.cc
#			py_init.h
#			py_node.h
#			py_parameter.h
#			py_record.h
#			py_time.h
#			py_timer.h
#			py_topology_manager.h)
#set_target_properties(cyber_py_wrapper PROPERTIES LINKER_LANGUAGE CXX)
#target_link_libraries(cyber_py_wrapper cyber::record
#        ${PYTHON_LIBRARIES})
#add_library(cyber::py_wrapper ALIAS cyber_py_wrapper)
#
#
#install(TARGETS cyber_py_wrapper
#        LIBRARY DESTINATION lib
#        ARCHIVE DESTINATION lib
#        RUNTIME DESTINATION bin
#        INCLUDES DESTINATION .
#        )

cmake_minimum_required(VERSION 3.5.1)

add_library(cyber_py_wrapper cyber_init_wrap.cc
			cyber_node_wrap.cc
			cyber_parameter_wrap.cc
			cyber_record_wrap.cc
			cyber_time_wrap.cc
			cyber_timer_wrap.cc
			cyber_topology_manager_wrap.cc
			py_init.h
			py_node.h
			py_parameter.h
			py_record.h
			py_time.h
			py_timer.h
			py_topology_manager.h)
set_target_properties(cyber_py_wrapper PROPERTIES LINKER_LANGUAGE CXX)
target_link_libraries(cyber_py_wrapper cyber::record
        ${PYTHON_LIBRARIES})
add_library(cyber::py_wrapper ALIAS cyber_py_wrapper)

add_library(py_init cyber_init_wrap.cc)
target_link_libraries(py_init cyber::cyber_core
					  ${PYTHON_LIBRARIES})
add_library(cyber::py_init ALIAS py_init)

add_library(_cyber_init SHARED cyber_init_wrap.cc
			../state.cc)
target_link_libraries(_cyber_init cyber::py_init
					  ${PYTHON_LIBRARIES})
#add_library(cyber::_cyber_init ALIAS _cyber_init)

add_library(py_node cyber_node_wrap.cc)
target_link_libraries(py_node cyber::cyber_core
					  ${PYTHON_LIBRARIES})
add_library(cyber::py_node ALIAS py_node)

add_library(_cyber_node SHARED cyber_node_wrap.cc
			../state.cc)
target_link_libraries(_cyber_node cyber::cyber_core
					  ${PYTHON_LIBRARIES})
#add_library(cyber::_cyber_node ALIAS _cyber_node)

add_library(py_record cyber_record_wrap.cc)
target_link_libraries(py_record cyber::message
					  cyber::common
					  cyber::record
					  ${PYTHON_LIBRARIES})
add_library(cyber::py_record ALIAS py_record)

add_library(_cyber_record SHARED cyber_record_wrap.cc
			../state.cc
			../common/file.cc)
target_link_libraries(_cyber_record cyber::py_record
					  cyber::common
					  ${PYTHON_LIBRARIES})
#add_library(cyber::_cyber_record ALIAS _cyber_record)

add_library(py_time cyber_time_wrap.cc)
target_link_libraries(py_time cyber::cyber_core
					  ${FASTRTPS_LIBRARIES}
					  ${FastCDR_LIBRARIES}
					  ${PYTHON_LIBRARIES})
add_library(cyber::py_time ALIAS py_time)

add_library(_cyber_time SHARED cyber_time_wrap.cc
			../state.cc)
target_link_libraries(_cyber_time cyber::py_time
					  ${FASTRTPS_LIBRARIES}
					  ${FastCDR_LIBRARIES}
					  ${PYTHON_LIBRARIES})
#add_library(cyber::_cyber_time ALIAS _cyber_time)

add_library(py_timer cyber_timer_wrap.cc)
target_link_libraries(py_timer cyber::cyber_core
					  ${PYTHON_LIBRARIES})
add_library(cyber::py_timer ALIAS py_timer)

add_library(_cyber_timer SHARED cyber_timer_wrap.cc
			../state.cc)
target_link_libraries(_cyber_timer cyber::cyber_core
					  cyber::init
					  cyber::timer
					  ${PYTHON_LIBRARIES})

add_library(py_parameter cyber_parameter_wrap.cc)
target_link_libraries(py_parameter cyber::cyber_core
					  ${PYTHON_LIBRAIRES})
add_library(cyber::py_parameter ALIAS py_parameter)

add_library(_cyber_parameter SHARED cyber_parameter_wrap.cc
			../state.cc)
target_link_libraries(_cyber_parameter cyber::py_parameter
					  ${PYTHON_LIBRAIRES})


install(TARGETS cyber_py_wrapper
		_cyber_init
		py_init
		_cyber_node
		py_node
		_cyber_record
		py_record
		_cyber_time
		py_time
		_cyber_timer
		py_timer
		_cyber_parameter
		py_parameter
		LIBRARY DESTINATION lib
		ARCHIVE DESTINATION lib
		RUNTIME DESTINATION bin
		INCLUDES DESTINATION .
		)
