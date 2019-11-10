cmake_minimum_required(VERSION 3.5.1)

add_subdirectory(proto)

add_library(cyber_common_component_example SHARED
			common_component_example/common_component_example.cc
			../state.cc)
target_link_libraries(cyber_common_component_example
					  cyber::class_loader
					  cyber::component
					  cyber::examples_proto
					  cyber::cyber)
add_library(cyber::common_component_example ALIAS cyber_common_component_example)

add_library(cyber_time_component_example SHARED
			timer_component_example/timer_component_example.cc
			../state.cc)
target_link_libraries(cyber_time_component_example
					  cyber::class_loader
					  cyber::component
					  cyber::examples_proto
					  cyber::cyber)
add_library(cyber::time_component_example ALIAS cyber_time_component_example)

add_executable(cyber_example_talker talker.cc)
target_link_libraries(cyber_example_talker
					  cyber_common_component_example
					  cyber_time_component_example)

add_executable(cyber_example_listenr listener.cc)
target_link_libraries(cyber_example_listenr
					  cyber_common_component_example
					  cyber_time_component_example)

add_executable(cyber_example_paramserver paramserver.cc)
target_link_libraries(cyber_example_paramserver
					  cyber_common_component_example
					  cyber_time_component_example)

add_executable(cyber_example_record record.cc)
target_link_libraries(cyber_example_record
					  cyber_common_component_example
					  cyber_time_component_example)

add_executable(cyber_example_service service.cc)
target_link_libraries(cyber_example_service
					  cyber_common_component_example
					  cyber_time_component_example)

install(TARGETS cyber_common_component_example
		cyber_time_component_example
		cyber_example_talker
		cyber_example_listenr
		cyber_example_paramserver
		cyber_example_record
		cyber_example_service
		LIBRARY DESTINATION lib
		ARCHIVE DESTINATION lib
		RUNTIME DESTINATION bin
		INCLUDES DESTINATION .
		)
