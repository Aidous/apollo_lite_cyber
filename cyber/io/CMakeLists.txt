cmake_minimum_required(VERSION 3.5.1)

add_library(cyber_io poll_data.h
			poll_handler.cc
			poller.cc
			session.cc
			example/tcp_echo_server.cc
			example/tcp_echo_client.cc
			example/udp_echo_server.cc
			example/udp_echo_client.cc
			)
set_target_properties(cyber_io PROPERTIES LINKER_LANGUAGE CXX)
target_link_libraries(cyber_io cyber::data)
add_library(cyber::io ALIAS cyber_io)

install(TARGETS cyber_io
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        RUNTIME DESTINATION bin
        INCLUDES DESTINATION .
)
