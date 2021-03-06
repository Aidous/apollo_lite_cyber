cmake_minimum_required(VERSION 3.5.1)

add_library(cyber_service_discovery topology_manager.cc
			communication/participant_listener.cc
			communication/subscriber_listener.cc
			container/graph.cc
			container/multi_value_warehouse.cc
			container/single_value_warehouse.cc
			container/warehouse_base.h
			role/role.cc
			specific_manager/channel_manager.cc
			specific_manager/manager.cc
			specific_manager/node_manager.cc
			specific_manager/service_manager.cc)
set_target_properties(cyber_service_discovery PROPERTIES LINKER_LANGUAGE CXX)
target_link_libraries(cyber_service_discovery cyber::binary
					  cyber::common
					  cyber::time
					  cyber::proto
					  cyber::message)
add_library(cyber::service_discovery ALIAS cyber_service_discovery)

# gtest
add_executable(topology_manager_test topology_manager_test.cc)
target_link_libraries(topology_manager_test gtest gtest_main
					  gmock
					  cyber::cyber)

add_executable(role_test role/role_test.cc)
target_link_libraries(role_test gtest gtest_main
					  gmock
					  cyber::cyber)

add_executable(warehouse_test container/warehouse_test.cc)
target_link_libraries(warehouse_test gtest gtest_main
					  gmock
					  cyber::cyber)

add_executable(graph_test container/graph_test.cc)
target_link_libraries(graph_test gtest gtest_main
					  gmock
					  cyber::cyber)

add_executable(channel_manager_test specific_manager/channel_manager_test.cc)
target_link_libraries(channel_manager_test gtest gtest_main
					  gmock
					  cyber::cyber)

add_executable(node_manager_test specific_manager/node_manager_test.cc)
target_link_libraries(node_manager_test gtest gtest_main
					  gmock
					  cyber::cyber)

add_executable(service_manager_test specific_manager/service_manager_test.cc)
target_link_libraries(service_manager_test gtest gtest_main
					  gmock
					  cyber::cyber)

install(TARGETS cyber_service_discovery
		topology_manager_test
		role_test
		warehouse_test
		graph_test
		channel_manager_test
		node_manager_test
		service_manager_test
		LIBRARY DESTINATION lib
		ARCHIVE DESTINATION lib
		RUNTIME DESTINATION bin
		INCLUDES DESTINATION .
		)
