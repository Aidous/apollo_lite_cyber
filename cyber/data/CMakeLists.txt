cmake_minimum_required(VERSION 3.5.1)

add_library(cyber_data cache_buffer.h
			channel_buffer.h
			data_dispatcher.h
			data_notifier.h
			data_visitor.h
			data_visitor_base.h
			fusion/all_latest.h
			fusion/data_fusion.h)
set_target_properties(cyber_data PROPERTIES LINKER_LANGUAGE CXX)
add_library(cyber::data ALIAS cyber_data)

install(TARGETS cyber_data
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        RUNTIME DESTINATION bin
        INCLUDES DESTINATION .
        )
