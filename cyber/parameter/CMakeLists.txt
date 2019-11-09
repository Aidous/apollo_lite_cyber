cmake_minimum_required(VERSION 3.5.1)

add_library(cyber_parameter parameter.cc
			parameter_client.cc
			parameter_server.cc
			parameter_service_names.h)
set_target_properties(cyber_parameter PROPERTIES LINKER_LANGUAGE CXX)
target_link_libraries(cyber_parameter cyber::message
					  cyber::proto)
add_library(cyber::parameter ALIAS cyber_parameter)

#add_executable(parameter_test parameter_test.cc)
#target_link_libraries(parameter_test cyber::cyber
#        gtest
#        gtest_main)
#
#add_executable(parameter_client_test parameter_client_test.cc)
#target_link_libraries(parameter_client_test cyber::cyber
#        gtest
#        gtest_main)
#
#add_executable(parameter_server_test parameter_server_test.cc)
#target_link_libraries(parameter_server_test cyber::cyber
#        gtest
#        gtest_main)


install(TARGETS cyber_parameter
		LIBRARY DESTINATION lib
		ARCHIVE DESTINATION lib
		RUNTIME DESTINATION bin
		INCLUDES DESTINATION .
		)
