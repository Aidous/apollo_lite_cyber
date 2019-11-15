cmake_minimum_required(VERSION 3.5.1)

add_library(cyber_message protobuf_factory.cc
			intra_message.cc
			message_header.h
			message_traits.h
			protobuf_traits.h
			py_message.h
			raw_message.h
			raw_message_traits.h)
set_target_properties(cyber_message PROPERTIES LINKER_LANGUAGE CXX)
target_link_libraries(cyber_message cyber::common
					  cyber::proto)
add_library(cyber::message ALIAS cyber_message)


# gtest
add_executable(message_header_test message_header_test.cc)
target_link_libraries(message_header_test gtest gtest_main
					  gmock
					  cyber::cyber)

 add_executable(raw_message_test raw_message_test.cc)
 target_link_libraries(raw_message_test gtest gtest_main
					   gmock
					   cyber::cyber)

 add_executable(protobuf_factory_test raw_message_test.cc)
 target_link_libraries(protobuf_factory_test gtest gtest_main
					   gmock
					   cyber::proto
					   cyber::cyber)

add_executable(message_traits_test message_traits_test.cc)
target_link_libraries(message_traits_test gtest gtest_main
					  gmock
					  cyber::proto
					  cyber::cyber)


install(TARGETS cyber_message
		message_header_test
		raw_message_test
		protobuf_factory_test
		message_traits_test
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        RUNTIME DESTINATION bin
        INCLUDES DESTINATION .
        )
