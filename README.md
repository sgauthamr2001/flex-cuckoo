# Flex-Cuckoo Hash Page Tables

This repository contains artifacts of the project on "Evaluation of Techniques for Page-Walk Acceleration".

The artifact consists of following files. 
1. Experiments on virtual memory traces to show memory fragmentation (Figure 4 and 6 from the report). Trace file is required to run the experiments. Since the trace files generated are large, a sample trace has been provided [here](https://drive.google.com/file/d/1mVjP6ARcCd_0aPk9u3Hzec2UiP_NuDOv/view?usp=share_link) for experimentation. 
Available in `Page_Table/`
2. Verilog codes for timing analysis between Elastic Cuckoo Hashing and Flex-Cuckoo Hashing. The RTL codes are synthesised using Xilinx Vivado. 
Available in `RTL/`
3. The applications used to generate memory trace files using the pin-tool on GUPS, XSBench, Seq-List and BTree programs from [Mosaic](https://dl.acm.org/doi/10.1145/3582016.3582021).
Available in `Trace_Codes/`


