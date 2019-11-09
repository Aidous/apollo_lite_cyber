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


install(TARGETS cyber_py_wrapper
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        RUNTIME DESTINATION bin
        INCLUDES DESTINATION .
        )
