CC ?= gcc

SRC_GPU=gpu.c
SRC_CPU=cpu.c
OUT_GPU=gpu
OUT_CPU=cpu

UNAME := $(shell uname)

ifeq ($(UNAME), Linux)
    OPENCL_OPT ?= -lOpenCL
else ifeq ($(UNAME), Darwin)
    OPENCL_OPT ?= -framework opencl
else ifndef OPENCL_OPT
    $(error Please contribute a rule for $(UNAME) or set OPENCL_OPT)
endif

all: clean gpu cpu

gpu:
	$(CC) $(SRC_GPU) -o $(OUT_GPU) $(OPENCL_OPT)

cpu:
	$(CC) $(SRC_CPU) -o $(OUT_CPU)

clean:
	rm -f $(OUT_GPU) $(OUT_CPU)

