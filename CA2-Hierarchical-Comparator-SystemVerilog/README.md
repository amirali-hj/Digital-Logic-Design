# Computer Assignment 2: Hierarchical and Parametric Digital Comparators

## Project Overview
This project demonstrates the design of scalable and hierarchical digital magnitude comparators using **SystemVerilog**, developed under the instruction of **Dr. Navabi** at the **University of Tehran**. 

The core objective is to transition from basic gate-level designs to highly scalable, parameterized hardware structures. The project covers the implementation of fixed-width comparators (2-bit, 4-bit, and 16-bit) and culminates in a generic $N$-bit comparator utilizing hardware generation loops, with rigorous back-annotated timing and worst-case delay analysis.

## Architectural Breakthroughs
1. **2-Bit Base Comparator:** Formulated using continuous assignments (`assign`) with exact delay values back-annotated from transistor-level simulations. It produces Greater Than (GT) and Equal (EQ) flags.
2. **GEcascade Block:** Developed a dedicated cascading module to combine tracking flags from Most Significant Bits (MSB) and Least Significant Bits (LSB) segments.
3. **Hierarchical Tree Structure (16-Bit):** Built a 16-bit comparator using a balanced tree topology by instantiating 2-bit, 4-bit, and 8-bit blocks hierarchically.
4. **Parametric $N$-Bit Generation:** Implemented a fully customizable $N$-bit comparator ($N = 2^i, i > 1$) leveraging SystemVerilog `generate` statements for automatic hardware synthesis.

## Advanced Verification Methodology
The testbenches developed for this assignment employ advanced HDL verification techniques:
* **Automated Stimulus Generation:** Utilizing `$random` functions wrapped inside `repeat` blocks to dynamically generate hundreds of test vectors.
* **Arithmetic Test Patterns:** Injecting edge-case testing values using synchronized arithmetic offsets.
* **Worst-Case Delay Optimization:** Analyzing simulation waveforms to identify the critical path and longest propagation delay through the multi-layered tree structure.

## Tools & Environment
* **HDL:** SystemVerilog
* **Simulator:** ModelSim / QuestaSim
* **Synthesizer / Toolflow:** Back-annotated delay mapping

## How to Run
1. Load the project files in **ModelSim**.
2. Compile the design files in `src/` followed by the verification suits in `tb/`.
3. Simulate `tb_comp_nbit` to observe the parametric expansion and functional integrity of the generated comparator.
