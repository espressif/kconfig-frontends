include_directories(.)
add_library(expand-env expand_env.c)

set(expand-env_INCLUDE_DIRS
  "${CMAKE_CURRENT_SOURCE_DIR}"
  CACHE INTERNAL ""
)
