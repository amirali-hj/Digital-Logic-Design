# Computer Assignment 3: Logic Synthesis, Sequential Elements, and Clocked Feedback Systems

## Project Overview
This project explores the critical bridge between combinational logic and sequential hardware design using **SystemVerilog**, under the instruction of **Dr. [cite_start]Navabi** at the **University of Tehran**[cite: 85, 86]. 

[cite_start]The workload transitions from continuous dataflow abstractions to cell-level hardware synthesis using **Yosys**, primitive gate-level latch modeling with precise transistor-derived delays, and the architectural implementation of synchronous feedback systems via multi-mode counters[cite: 89, 100, 105, 111].

## Key Implementation Features

### 1. Logic Block Synthesis & Netlist Comparison
* [cite_start]**Design:** Developed an 8-bit multi-mode arithmetic/logic block capable of pass-through, conditional increment, conditional decrement, and parallel load operations controlled by a 2-bit mode selector[cite: 93, 94].
* **Synthesis:** Automated the gate-level translation using the **Yosys Open SYnthesis Suite** to map behavior onto a specified technology library, exporting a structural Verilog netlist[cite: 100].
* [cite_start]**Verification:** Built a dual-instantiated testbench verifying behavioral vs. structural functional equivalents under heavy pseudo-random stimulus streams (`$random` inside `repeat` loops)[cite: 101, 102].

### 2. Low-Level Memory Cell Modeling (Latches & Flip-Flops)
* [cite_start]**Clocked SR-Latch:** Designed an all-NAND switch-equivalent structural circuit annotated with explicit propagation delays derived from low-level NMOS (4 ns) and PMOS (6 ns) characteristics[cite: 103, 104, 105]. [cite_start]Simulated race conditions under simultaneous active assertions ($S=1, R=1$) to observe memory degradation[cite: 106].
* [cite_start]**Clocked D-Latch & Registers:** Constructed a glitch-resistant, resettable 8-bit latch register[cite: 107, 108, 109].
* **Master-Slave D-Flip-Flop (D-FF):** Coupled two D-latches to achieve edge-triggered behavior and implemented a parametric synchronous resetting register using `generate` statements[cite: 115, 116, 117].

### 3. Clocked Feedback & Multi-Mode Counters
* [cite_start]Implemented closed-loop feedback systems by routing output register bits back into the primary input ports of the 4-mode logic block[cite: 110, 120].
* [cite_start]Synthesized separate latch-based and flip-flop-based counter topologies to compare timing margins, structural synchronization boundaries, and setup/hold performance[cite: 114, 125].
* Extended the system scalability by cascading multiple units into a unified 16-bit wide multi-mode synchronous counter[cite: 126].

## Tools & Automation Flow
* [cite_start]**Logic Synthesis:** Yosys Open Synthesis Suite [cite: 100]
* [cite_start]**HDL Modeling:** SystemVerilog & Verilog Primitives [cite: 88, 104]
* **Simulation Suits:** ModelSim / QuestaSim [cite: 137]

## Execution Guide
1. Run the Yosys synthesis script to examine the cell mapping logs:
   ```bash
   yosys -s synthesis/yosys_script.ys
