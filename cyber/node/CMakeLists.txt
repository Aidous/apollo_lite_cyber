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


install(TARGETS cyber_node
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        RUNTIME DESTINATION bin
        INCLUDES DESTINATION .
        )
