.PHONY: all run clean rebuild debug release help

BUILD_DIR      := build
CONFIG_DIR     := $(BUILD_DIR)
SOURCE_DIR     := .
GENERATOR      ?= Visual Studio 17 2022
BUILD_TYPE     ?= Release
CMAKE_FLAGS    ?=

CMAKE := cmake

all: configure
	$(CMAKE) --build $(BUILD_DIR) --config $(BUILD_TYPE)

configure:
	$(CMAKE) -S $(SOURCE_DIR) -B $(CONFIG_DIR) -G "$(GENERATOR)" -DCMAKE_BUILD_TYPE=$(BUILD_TYPE) $(CMAKE_FLAGS)

run: all
	$(CMAKE) --install $(BUILD_DIR) --config $(BUILD_TYPE) --prefix $(BUILD_DIR)/install 2>NUL || true
	$(BUILD_DIR)/$(BUILD_TYPE)/AlloyDE.exe 2>NUL || $(BUILD_DIR)/AlloyDE.exe 2>NUL || echo "Could not locate AlloyDE.exe"

clean:
	$(CMAKE) --build $(BUILD_DIR) --config $(BUILD_TYPE) --target clean 2>NUL || true
	$(CMAKE) --build $(BUILD_DIR) --config Debug --target clean 2>NUL || true
	$(CMAKE) --build $(BUILD_DIR) --config Release --target clean 2>NUL || true

rebuild: clean all

debug: BUILD_TYPE := Debug
debug: all

release: BUILD_TYPE := Release
release: all

help:
	@echo "Alloy-DE Makefile"
	@echo ""
	@echo "Targets:"
	@echo "  all       - Configure and build (default)"
	@echo "  run       - Build and execute AlloyDE"
	@echo "  clean     - Remove build artifacts"
	@echo "  rebuild   - Clean and rebuild"
	@echo "  debug     - Build in Debug mode"
	@echo "  release   - Build in Release mode (default)"
	@echo ""
	@echo "Variables:"
	@echo "  GENERATOR   - CMake generator (default: Visual Studio 17 2022)"
	@echo "  BUILD_TYPE  - Build configuration (default: Release)"
	@echo "  CMAKE_FLAGS - Extra CMake flags"
	@echo ""
	@echo "Examples:"
	@echo "  make                    - Release build"
	@echo "  make debug GENERATOR=\"Ninja\" - Debug with Ninja"
	@echo "  make run BUILD_TYPE=Debug - Build and run debug"
