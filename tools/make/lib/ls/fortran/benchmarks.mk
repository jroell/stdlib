#/
# @license Apache-2.0
#
# Copyright (c) 2017 The Stdlib Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#/

# VARIABLES #

# Define the command flags:
FIND_FORTRAN_BENCHMARKS_FLAGS ?= \
	-type f \
	-name "$(FORTRAN_BENCHMARKS_PATTERN)" \
	-path "$(ROOT_DIR)/**/$(BENCHMARKS_FOLDER)/**" \
	-regex "$(BENCHMARKS_FILTER)" \
	$(FIND_BENCHMARKS_EXCLUDE_FLAGS)


ifneq ($(OS), Darwin)
	FIND_FORTRAN_BENCHMARKS_FLAGS := -regextype posix-extended $(FIND_FORTRAN_BENCHMARKS_FLAGS)
endif

# Define a command to list benchmark files:
FIND_FORTRAN_BENCHMARKS_CMD ?= find $(find_kernel_prefix) $(ROOT_DIR) $(FIND_FORTRAN_BENCHMARKS_FLAGS)

# Define the list of benchmark files:
FORTRAN_BENCHMARKS ?= $(shell $(FIND_FORTRAN_BENCHMARKS_CMD))


# TARGETS #

# List Fortran benchmark files.
#
# This target prints a newline-delimited list of Fortran benchmark files.

list-benchmarks-fortran:
	$(QUIET) find $(find_kernel_prefix) $(ROOT_DIR) $(FIND_FORTRAN_BENCHMARKS_FLAGS) $(find_print_list)

.PHONY: list-benchmarks-fortran
