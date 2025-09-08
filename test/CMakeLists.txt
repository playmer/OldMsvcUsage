file(GLOB tests RELATIVE ${CMAKE_CURRENT_LIST_DIR} 
CONFIGURE_DEPENDS 
    ${CMAKE_CURRENT_LIST_DIR}/*.c
    ${CMAKE_CURRENT_LIST_DIR}/*.cpp
)

foreach(test ${tests})
    string(REPLACE . _ test_name ${test})
    message(STATUS "test: ${test_name}")
    
    add_executable(test_${test_name} ${test})
endforeach()