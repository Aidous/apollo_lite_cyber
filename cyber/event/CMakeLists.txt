cmake_minimum_required(VERSION 3.5.1)

add_library(cyber_event perf_event.h
			perf_event_cache.cc)
set_target_properties(cyber_event PROPERTIES LINKER_LANGUAGE CXX)
target_link_libraries(cyber_event cyber::data
					  cyber::state)
add_library(cyber::event ALIAS cyber_event)

install(TARGETS cyber_event
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        RUNTIME DESTINATION bin
        INCLUDES DESTINATION .
        )
