cmake_minimum_required(VERSION 3.5.1)

add_library(cyber_blocker blocker.h
			blocker_manager.cc
			intra_writer.h
			intra_reader.h)
set_target_properties(cyber_blocker PROPERTIES LINKER_LANGUAGE CXX)
add_library(cyber::blocker ALIAS cyber_blocker)

add_executable(cyber_blocker_test blocker_test.cc)
target_link_libraries(cyber_blocker_test gtest gtest_main
					  cyber::proto
					  cyber::cyber)

add_executable(cyber_blocker_manager_test blocker_manager_test.cc)
target_link_libraries(cyber_blocker_manager_test gtest gtest_main
					  cyber::proto
					  cyber::cyber)

install(TARGETS cyber_blocker
		cyber_blocker_test
		cyber_blocker_manager_test
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        RUNTIME DESTINATION bin
        INCLUDES DESTINATION .
)
