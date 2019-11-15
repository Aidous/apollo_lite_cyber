cmake_minimum_required(VERSION 3.5.1)

add_library(cyber_node node.cc
			node_channel_impl.h
			node_service_impl.h
			reader.h
			reader_base.h
			writer.h
			writer_base.h)
set_target_properties(cyber_node PROPERTIES LINKER_LANGUAGE CXX)
target_link_libraries(cyber_node cyber::proto
					  cyber::common
					  cyber::time
					  cyber::service_discovery)
add_library(cyber::node ALIAS cyber_node)

add_executable(writer_reader_test writer_reader_test.cc)
target_link_libraries(writer_reader_test gtest gtest_main
					  cyber::cyber
					  cyber::proto)

add_executable(node_test node_test.cc)
target_link_libraries(node_test gtest gtest_main
					  gmock
					  cyber::cyber
					  cyber::proto)

install(TARGETS cyber_node
		writer_reader_test
		node_test
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        RUNTIME DESTINATION bin
        INCLUDES DESTINATION .
        )
