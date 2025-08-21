# CS106B CMake Configuration
# Comprehensive build system for Stanford CS106B assignments and exercises
cmake_minimum_required(VERSION 3.10)
project(cs106b VERSION 1.0.0 LANGUAGES CXX)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Add compiler flags for debugging and warnings
set(CMAKE_CXX_FLAGS_DEBUG "-g -O0 -Wall -Wextra -Wpedantic")
set(CMAKE_CXX_FLAGS_RELEASE "-O3 -DNDEBUG")

# Set default build type to Debug for development
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Debug CACHE STRING "Choose build type" FORCE)
    set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release")
endif()

# Include directories
include_directories(include)

# Set output directories
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)

# Create output directories
file(MAKE_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})

# Color output for modern CMake versions
if(CMAKE_VERSION VERSION_GREATER_EQUAL 3.24)
    set(CMAKE_COLOR_DIAGNOSTICS ON)
endif()

# Function to add an assignment executable with all its source files
function(add_assignment assignment_name)
    set(assignment_dir "src/assignments/${assignment_name}")
    if(EXISTS "${CMAKE_SOURCE_DIR}/${assignment_dir}")
        file(GLOB_RECURSE ASSIGNMENT_SOURCES "${assignment_dir}/*.cpp")
        file(GLOB_RECURSE ASSIGNMENT_HEADERS "${assignment_dir}/*.h")
        
        if(ASSIGNMENT_SOURCES)
            add_executable(${assignment_name} ${ASSIGNMENT_SOURCES})
            target_include_directories(${assignment_name} PRIVATE ${assignment_dir})
            
            # Add custom properties for IDE integration
            set_target_properties(${assignment_name} PROPERTIES
                FOLDER "Assignments"
                VS_DEBUGGER_WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
            )
            
            message(STATUS "Added assignment: ${assignment_name}")
        endif()
    endif()
endfunction()

# Function to add lecture examples
function(add_lecture_examples)
    file(GLOB LECTURE_SOURCES "src/lectures/*.cpp")
    foreach(lecture_file ${LECTURE_SOURCES})
        get_filename_component(lecture_name ${lecture_file} NAME_WE)
        add_executable(lecture_${lecture_name} ${lecture_file})
        
        set_target_properties(lecture_${lecture_name} PROPERTIES
            FOLDER "Lectures"
            OUTPUT_NAME ${lecture_name}
            VS_DEBUGGER_WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
        )
        
        message(STATUS "Added lecture: ${lecture_name}")
    endforeach()
endfunction()

# Function to add exercises
function(add_exercises)
    file(GLOB EXERCISE_SOURCES "src/exercises/*.cpp")
    foreach(exercise_file ${EXERCISE_SOURCES})
        get_filename_component(exercise_name ${exercise_file} NAME_WE)
        add_executable(exercise_${exercise_name} ${exercise_file})
        
        set_target_properties(exercise_${exercise_name} PROPERTIES
            FOLDER "Exercises"
            OUTPUT_NAME ${exercise_name}
            VS_DEBUGGER_WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
        )
        
        message(STATUS "Added exercise: ${exercise_name}")
    endforeach()
endfunction()

# Function to add experiments
function(add_experiments)
    file(GLOB EXPERIMENT_SOURCES "src/experiments/*.cpp")
    foreach(experiment_file ${EXPERIMENT_SOURCES})
        get_filename_component(experiment_name ${experiment_file} NAME_WE)
        add_executable(experiment_${experiment_name} ${experiment_file})
        
        set_target_properties(experiment_${experiment_name} PROPERTIES
            FOLDER "Experiments"
            OUTPUT_NAME ${experiment_name}
            VS_DEBUGGER_WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
        )
        
        message(STATUS "Added experiment: ${experiment_name}")
    endforeach()
endfunction()

# Add all current source files
message(STATUS "Configuring CS106B project...")

# Add assignments (uncomment as you create them)
add_assignment(assign1)
# add_assignment(assign2)
# add_assignment(assign3)
# add_assignment(assign4)
# add_assignment(assign5)
# add_assignment(assign6)
# add_assignment(assign7)

# Add lecture examples
add_lecture_examples()

# Add exercises  
add_exercises()

# Add experiments
add_experiments()

# Custom targets for convenience
add_custom_target(assignments
    COMMENT "Building all assignments"
)

add_custom_target(lectures
    COMMENT "Building all lecture examples"
)

add_custom_target(exercises
    COMMENT "Building all exercises"
)

add_custom_target(experiments
    COMMENT "Building all experiments"
)

# Add dependencies to custom targets
get_property(all_targets DIRECTORY PROPERTY BUILDSYSTEM_TARGETS)
foreach(target ${all_targets})
    get_target_property(folder ${target} FOLDER)
    if(folder STREQUAL "Assignments")
        add_dependencies(assignments ${target})
    elseif(folder STREQUAL "Lectures")
        add_dependencies(lectures ${target})
    elseif(folder STREQUAL "Exercises")
        add_dependencies(exercises ${target})
    elseif(folder STREQUAL "Experiments")
        add_dependencies(experiments ${target})
    endif()
endforeach()

# Print summary
message(STATUS "CMake configuration complete!")
message(STATUS "Build type: ${CMAKE_BUILD_TYPE}")
message(STATUS "Output directory: ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}")
message(STATUS "")
message(STATUS "Available build targets:")
message(STATUS "  make assignments  - Build all assignments")
message(STATUS "  make lectures     - Build all lecture examples")  
message(STATUS "  make exercises    - Build all exercises")
message(STATUS "  make experiments  - Build all experiments")
message(STATUS "  make all          - Build everything")
message(STATUS "")
message(STATUS "To build and run:")
message(STATUS "  mkdir build && cd build")
message(STATUS "  cmake ..")
message(STATUS "  make")
message(STATUS "  ./bin/<executable_name>")
