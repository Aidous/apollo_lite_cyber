cmake_minimum_required(VERSION 3.5.1)

add_subdirectory(proto)

add_executable(example_talker talker.cc)
target_link_libraries(example_talker cyber::cyber
					  example_proto)

add_executable(example_listener listener.cc)
target_link_libraries(example_listener cyber::cyber
					  example_proto)


add_executable(performance_talker performance_talker.cc)
target_link_libraries(performance_talker cyber::cyber
					  example_proto)

add_executable(performance_listener performance_listener.cc)
target_link_libraries(performance_listener cyber::cyber
					  example_proto)

add_executable(example_service service.cc)
target_link_libraries(example_service cyber::cyber
					  example_proto)

add_executable(example_paramserver paramserver.cc)
target_link_libraries(example_paramserver cyber::cyber)

install(TARGETS example_talker
		example_listener
		performance_talker
		performance_listener
		example_paramserver
		example_service
		LIBRARY DESTINATION lib
		ARCHIVE DESTINATION lib
		RUNTIME DESTINATION bin
		INCLUDES DESTINATION .
		)