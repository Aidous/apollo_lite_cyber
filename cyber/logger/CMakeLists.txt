cmake_minimum_required(VERSION 3.5.1)

add_library(cyber_logger logger_util.cc
			async_logger.cc
			log_file_object.cc
			logger.cc)
target_link_libraries(cyber_logger cyber::proto
					  cyber::data)
add_library(cyber::logger ALIAS cyber_logger)

## gtest
add_executable(log_file_object_test log_file_object_test.cc)
target_link_libraries(log_file_object_test gtest gtest_main
					  gmock
					  cyber::cyber)

add_executable(logger_test logger_test.cc)
target_link_libraries(logger_test gtest gtest_main
					  gmock
					  cyber::cyber)

install(TARGETS cyber_logger
		logger_test
		log_file_object_test
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        RUNTIME DESTINATION bin
        INCLUDES DESTINATION .
        )
