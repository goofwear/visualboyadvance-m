# -*- cmake -*-

if (APPLE)
  include(FindPackageHandleStandardArgs)

  find_library(SPARKLE_FRAMEWORK
    NAMES Sparkle
    HINTS /usr/local/Caskroom/sparkle/1.22.0
  )
  FIND_PATH(SPARKLE_INCLUDE_DIR Sparkle.h HINTS ${SPARKLE_FRAMEWORK}/Headers)

  if (SPARKLE_INCLUDE_DIR)
    include_directories(${SPARKLE_INCLUDE_DIR})
  endif()

  find_package_handle_standard_args(Sparkle DEFAULT_MSG SPARKLE_INCLUDE_DIR SPARKLE_FRAMEWORK)
  mark_as_advanced(SPARKLE_INCLUDE_DIR SPARKLE_FRAMEWORK)

  set(CCS1 mkdir -p ${CMAKE_BINARY_DIR}/visualboyadvance-m.app/Contents/Frameworks)
  set(CCS2 cp -R ${SPARKLE_FRAMEWORK} ${CMAKE_BINARY_DIR}/visualboyadvance-m.app/Contents/Frameworks/Sparkle.framework)

  add_custom_command(TARGET visualboyadvance-m POST_BUILD
    COMMAND ${CCS1}
    COMMAND ${CCS2}
  )
  message(WARNING ${CCS1})
  message(WARNING ${CCS2})

endif()

# https://github.com/patacrep/patagui/blob/master/cmake/CMakeLists-Mac.cmake
# http://mikedld.com/f/transmission/cmake/macosx/CMakeLists.txt
# https://github.com/nextcloud/desktop/blob/master/cmake/modules/FindSparkle.cmake
