# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake

# The command to remove a file.
RM = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "/Users/umayr/Documents/Rincon 3360/Assignment_2"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "/Users/umayr/Documents/Rincon 3360/Assignment_2/cmake-build-debug"

# Include any dependencies generated for this target.
include CMakeFiles/Assignment_2.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/Assignment_2.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Assignment_2.dir/flags.make

CMakeFiles/Assignment_2.dir/client.cpp.o: CMakeFiles/Assignment_2.dir/flags.make
CMakeFiles/Assignment_2.dir/client.cpp.o: ../client.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/umayr/Documents/Rincon 3360/Assignment_2/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/Assignment_2.dir/client.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Assignment_2.dir/client.cpp.o -c "/Users/umayr/Documents/Rincon 3360/Assignment_2/client.cpp"

CMakeFiles/Assignment_2.dir/client.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Assignment_2.dir/client.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/umayr/Documents/Rincon 3360/Assignment_2/client.cpp" > CMakeFiles/Assignment_2.dir/client.cpp.i

CMakeFiles/Assignment_2.dir/client.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Assignment_2.dir/client.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/umayr/Documents/Rincon 3360/Assignment_2/client.cpp" -o CMakeFiles/Assignment_2.dir/client.cpp.s

CMakeFiles/Assignment_2.dir/server.cpp.o: CMakeFiles/Assignment_2.dir/flags.make
CMakeFiles/Assignment_2.dir/server.cpp.o: ../server.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/umayr/Documents/Rincon 3360/Assignment_2/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/Assignment_2.dir/server.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Assignment_2.dir/server.cpp.o -c "/Users/umayr/Documents/Rincon 3360/Assignment_2/server.cpp"

CMakeFiles/Assignment_2.dir/server.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Assignment_2.dir/server.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/umayr/Documents/Rincon 3360/Assignment_2/server.cpp" > CMakeFiles/Assignment_2.dir/server.cpp.i

CMakeFiles/Assignment_2.dir/server.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Assignment_2.dir/server.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/umayr/Documents/Rincon 3360/Assignment_2/server.cpp" -o CMakeFiles/Assignment_2.dir/server.cpp.s

# Object files for target Assignment_2
Assignment_2_OBJECTS = \
"CMakeFiles/Assignment_2.dir/client.cpp.o" \
"CMakeFiles/Assignment_2.dir/server.cpp.o"

# External object files for target Assignment_2
Assignment_2_EXTERNAL_OBJECTS =

Assignment_2: CMakeFiles/Assignment_2.dir/client.cpp.o
Assignment_2: CMakeFiles/Assignment_2.dir/server.cpp.o
Assignment_2: CMakeFiles/Assignment_2.dir/build.make
Assignment_2: CMakeFiles/Assignment_2.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/Users/umayr/Documents/Rincon 3360/Assignment_2/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable Assignment_2"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Assignment_2.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Assignment_2.dir/build: Assignment_2

.PHONY : CMakeFiles/Assignment_2.dir/build

CMakeFiles/Assignment_2.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Assignment_2.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Assignment_2.dir/clean

CMakeFiles/Assignment_2.dir/depend:
	cd "/Users/umayr/Documents/Rincon 3360/Assignment_2/cmake-build-debug" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/Users/umayr/Documents/Rincon 3360/Assignment_2" "/Users/umayr/Documents/Rincon 3360/Assignment_2" "/Users/umayr/Documents/Rincon 3360/Assignment_2/cmake-build-debug" "/Users/umayr/Documents/Rincon 3360/Assignment_2/cmake-build-debug" "/Users/umayr/Documents/Rincon 3360/Assignment_2/cmake-build-debug/CMakeFiles/Assignment_2.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : CMakeFiles/Assignment_2.dir/depend

