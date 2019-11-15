cmake_minimum_required(VERSION 3.5.1)

add_library(cyber_common environment.h
			file.cc
			global_data.cc
			log.h
			macros.h
			time_conversion.h
			types.h
			util.h)
set_target_properties(cyber_common PROPERTIES LINKER_LANGUAGE CXX)
target_link_libraries(cyber_common cyber::proto
				   ${GLOG_LIBRARIES})
add_library(cyber::common ALIAS cyber_common)

## gtest
add_executable(file_test file_test.cc)
target_link_libraries(file_test gtest
					  gtest_main
					  gmock
					  cyber::proto
					  cyber::common)

add_executable(log_test log_test.cc)
target_link_libraries(log_test
					  gtest
					  gtest_main
					  cyber::common)

add_executable(macros_test macros_test.cc)
target_link_libraries(macros_test gtest
					  gtest_main
					  cyber::base
					  cyber::common
					  cyber::proto)

install(TARGETS cyber_common
		file_test
		log_test
		macros_test
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        RUNTIME DESTINATION bin
        INCLUDES DESTINATION .
        )
