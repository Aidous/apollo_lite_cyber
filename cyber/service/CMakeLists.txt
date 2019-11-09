cmake_minimum_required(VERSION 3.5.1)

add_library(cyber_service client.h
			service.h
			client_base.h
			service_base.h)
set_target_properties(cyber_service PROPERTIES LINKER_LANGUAGE CXX)
add_library(cyber::service ALIAS cyber_service)

install(TARGETS cyber_service
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        RUNTIME DESTINATION bin
        INCLUDES DESTINATION .
        )
