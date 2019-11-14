cmake_minimum_required(VERSION 3.5.1)

add_library(cyber_class_loader SHARED class_loader.cc  # must be shared.
			class_loader_manager.cc
			class_loader_register_macro.h
			utility/class_factory.cc
			utility/class_loader_utility.cc)
set_target_properties(cyber_class_loader PROPERTIES LINKER_LANGUAGE CXX)
target_link_libraries(cyber_class_loader PocoFoundation
					  cyber::init
					  cyber::common
					  )
add_library(cyber::class_loader ALIAS cyber_class_loader)


add_library(cyber_class_loader_manager SHARED class_loader_manager.cc)
target_link_libraries(cyber_class_loader_manager cyber::class_loader)
add_library(cyber::class_loader_manager ALIAS cyber_class_loader_manager)

install(TARGETS cyber_class_loader
		cyber_class_loader_manager
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        RUNTIME DESTINATION bin
        INCLUDES DESTINATION .
        )
