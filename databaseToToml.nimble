# Package

version       = "0.1.1"
author        = "Vindaar"
description   = "Tool to extract MHB data from DB"
license       = "MIT"
bin           = @["databaseToToml"]


# Dependencies

requires "nim >= 1.4.0"
requires "cligen"
requires "datamancer >= 0.2.1"
# depend on my own branch for `parsetoml` until
# https://github.com/NimParsers/parsetoml/pull/54
# is merged (now done)
# and we have found a solution for
# https://github.com/NimParsers/parsetoml/issues/55
requires "https://github.com/Vindaar/parsetoml#mhbTestBranch"

task muslBuild, "Builds a static binary using musl":
  exec "nim musl -d:release -d:mariadb -d:ssl -f databaseToToml.nim"
