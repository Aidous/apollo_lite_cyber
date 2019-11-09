cmake_minimum_required(VERSION 3.5.1)

add_library(cyber_record header_builder.cc
			record_base.h
			record_message.h
			record_reader.cc
			record_viewer.cc
			record_writer.cc
			file/section.h
			file/record_file_base.cc
			file/record_file_reader.cc
			file/record_file_writer.cc)
set_target_properties(cyber_record PROPERTIES LINKER_LANGUAGE CXX)
add_library(cyber::record ALIAS cyber_record)

#add_executable(record_file_test file/record_file_test.cc)
#target_link_libraries(record_file_test cyber::cyber
#        cyber::proto
#        gtest
#        gtest_main)
#
#add_executable(record_reader_test record_reader_test.cc)
#target_link_libraries(record_reader_test cyber::cyber
#        cyber::proto
#        gtest
#        gtest_main)
#
#add_executable(record_viewer_test record_viewer_test.cc)
#target_link_libraries(record_viewer_test cyber::cyber
#        cyber::proto
#        gtest
#        gtest_main)


install(TARGETS cyber_record
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        RUNTIME DESTINATION bin
        INCLUDES DESTINATION .
)
