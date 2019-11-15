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
target_link_libraries(cyber_io cyber::cyber_core
					  ${GLOG_LIBRARIES})
add_library(cyber::io ALIAS cyber_io)

add_executable(poller_test poller_test.cc)
target_link_libraries(poller_test cyber::io
					  gtest
					  gtest_main)

add_executable(tcp_echo_client example/tcp_echo_client.cc)
target_link_libraries(tcp_echo_client cyber::cyber_core)

add_executable(tcp_echo_server example/tcp_echo_server.cc)
target_link_libraries(tcp_echo_server cyber::cyber_core)

add_executable(udp_echo_client example/udp_echo_client.cc)
target_link_libraries(udp_echo_client cyber::cyber_core)

add_executable(udp_echo_server example/udp_echo_server.cc)
target_link_libraries(udp_echo_server cyber::cyber_core)

install(TARGETS cyber_io
		poller_test
		tcp_echo_client
		tcp_echo_server
		udp_echo_client
		udp_echo_server
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        RUNTIME DESTINATION bin
        INCLUDES DESTINATION .
)
