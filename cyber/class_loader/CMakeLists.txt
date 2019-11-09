cmake_minimum_required(VERSION 3.5.1)

add_library(cyber_class_loader class_loader.cc
			class_loader_manager.cc
			class_loader_register_macro.h
			utility/class_factory.cc
			utility/class_loader_utility.cc)
set_target_properties(cyber_class_loader PROPERTIES LINKER_LANGUAGE CXX)
add_library(cyber::class_loader ALIAS cyber_class_loader)
target_link_libraries(cyber_class_loader PocoFoundation #todo: find_package
                                         cyber::common
                                         cyber::init
                                         )

install(TARGETS cyber_class_loader
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        RUNTIME DESTINATION bin
        INCLUDES DESTINATION .
        )
