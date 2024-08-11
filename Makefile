TMPDIR=./out
PROJECT_ROOT=.
GMOCK_PATH=D:/qigao/googletest
GMOCK_LIB=$(PROJECT_ROOT)/libgmock.a $(PROJECT_ROOT)/libgmock_main.a $(PROJECT_ROOT)/libgtest.a
# GMOCK_INCLUDE=-I$(GMOCK_PATH)/include -I$(GMOCK_PATH)/gtest/include -I$(PROJECT_ROOT)
GMOCK_INCLUDE=-I$(GMOCK_PATH)/googlemock/include -I$(GMOCK_PATH)/googletest/include -I$(PROJECT_ROOT)
CPP11_FLAGS=-g -O0 -std=c++14 -fno-inline -falign-functions=32
SRC=$(wildcard *.cpp)
TARGETS=$(patsubst %.cpp, %, $(SRC))
TARGETS_PATH=$(patsubst %.cpp, $(TMPDIR)/%.exe, $(SRC))
RECENT=hello_world
RECENT_PATH=$(patsubst %, $(TMPDIR)/%.exe, $(RECENT))
# All
%: %.cpp
	g++ $(CPP11_FLAGS) $^ $(GMOCK_INCLUDE) $(GMOCK_LIB) -o $(TMPDIR)/$@.exe
# Default
all: $(TARGETS)
# Recent
recent: $(RECENT)
# Test
test: all
	echo $(TARGETS_PATH) | tr " " "\n" | while read test; do echo "Test: $$test"; $$test; done
# Recent test
recent-test: recent
	$(RECENT_PATH)
