cmake_minimum_required(VERSION 3.5.1)

add_library(cyber_recorder main.cc
			info.cc
			recorder.cc
			recoverer.cc
			spliter.cc
			player/play_param.h
			player/play_task.cc
			player/play_task_buffer.cc
			player/play_task_consumer.cc
			player/play_task_producer.cc
			player/player.cc)
set_target_properties(cyber_recorder PROPERTIES LINKER_LANGUAGE CXX)
target_link_libraries(cyber_recorder cyber::py_wrapper
        cyber::cyber
        pthread
        )
add_library(cyber::recorder ALIAS cyber_recorder)

add_executable(cyber_recorder_app main.cc)
target_link_libraries(cyber_recorder_app cyber_recorder)

install(TARGETS cyber_recorder
		cyber_recorder_app
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        RUNTIME DESTINATION bin
        INCLUDES DESTINATION .
        )
