if( NOT TARGET imnodes )
    # Define ${CINDER_PATH} as usual.
    get_filename_component( imnodes_SOURCE_PATH "${CMAKE_CURRENT_LIST_DIR}/../.." ABSOLUTE )
 
    get_filename_component(CINDER_PATH "${CMAKE_CURRENT_LIST_DIR}/../../../.." ABSOLUTE)
 
    include_directories("${imnodes_SOURCE_PATH}/include")
    add_library(imnodes "${imnodes_SOURCE_PATH}/src/imnodes.cpp")   

    target_include_directories(imnodes SYSTEM BEFORE PUBLIC "${CINDER_PATH}/include")
    if(NOT TARGET cinder)
        include("${CINDER_PATH}/proj/cmake/configure.cmake")
        find_package(cinder REQUIRED PATHS
                "${CINDER_PATH}/${CINDER_LIB_DIRECTORY}"
                "$ENV{CINDER_PATH}/${CINDER_LIB_DIRECTORY}")
    endif()
    target_link_libraries(imnodes PRIVATE cinder)
    
endif()
