cmake_minimum_required(VERSION 3.5.1)

add_library(cyber_monitor cyber_topology_message.cc
			general_channel_message.cc
			general_message.cc
			general_message_base.cc
			renderable_message.cc
			screen.cc)
target_link_libraries(cyber_monitor pthread
					  ncurses
					  cyber::cyber)
add_library(cyber::monitor ALIAS cyber_monitor)

add_executable(cyber_monitor_app main.cc)
target_link_libraries(cyber_monitor_app cyber_monitor)

install(TARGETS cyber_monitor
		cyber_monitor_app
		LIBRARY DESTINATION lib
		ARCHIVE DESTINATION lib
		RUNTIME DESTINATION bin
		INCLUDES DESTINATION .
		)