cmake_minimum_required(VERSION 3.5.1)

add_library(cyber_task task.h
			task_manager.cc)
set_target_properties(cyber_task PROPERTIES LINKER_LANGUAGE CXX)
target_link_libraries(cyber_task cyber::scheduler)
add_library(cyber::task ALIAS cyber_task)


# gtest
add_executable(task_test task_test.cc)
target_link_libraries(task_test gtest gtest_main
					  gmock
					  cyber::cyber_core)


install(TARGETS cyber_task
		task_test
		LIBRARY DESTINATION lib
		ARCHIVE DESTINATION lib
		RUNTIME DESTINATION bin
		INCLUDES DESTINATION .
		)
