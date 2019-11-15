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

add_executable(cache_buffer_test cache_buffer_test.cc)
target_link_libraries(cache_buffer_test gtest gtest_main
					  gmock
					  cyber::data)

add_executable(data_visitor_test data_visitor_test.cc)
target_link_libraries(data_visitor_test gtest gtest_main
					  gmock
					  cyber::cyber)

add_executable(data_dispatcher_test data_dispatcher_test.cc)
target_link_libraries(data_dispatcher_test gtest gtest_main
					  gmock
					  cyber::cyber)

add_executable(channel_buffer_test channel_buffer_test.cc)
target_link_libraries(channel_buffer_test gtest gtest_main
					  gmock
					  cyber::cyber)

add_executable(all_latest_test fusion/all_latest_test.cc)
target_link_libraries(all_latest_test gtest gtest_main
					  gmock
					  cyber::cyber)

install(TARGETS cyber_data
		cache_buffer_test
		data_visitor_test
		data_dispatcher_test
		channel_buffer_test
		all_latest_test
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        RUNTIME DESTINATION bin
        INCLUDES DESTINATION .
        )
