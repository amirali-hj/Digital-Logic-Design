# Computer Assignment 1: Switch and Gate Structures in SystemVerilog

## Project Overview
This project focuses on the low-level modeling of digital structures using **SystemVerilog**, developed as part of the Digital Logic Design course instructed by **Dr. Navabi** at the **University of Tehran**. 

The main objective is to design, simulate, and compare three different modeling abstractions of a 3-input **OAI (OR-AND-INVERT)** gate ($w = \sim((a | b) \& c)$) and analyze their precise propagation delays ($\text{T}_{\text{pLH}}$ and $\text{T}_{\text{pHL}}$) under worst-case scenarios.

## Implementation Phases
1. **Switch-Level Modeling:** Implemented the OAI gate using PMOS and NMOS transistors with detailed rise/fall delay modeling (`#(rise, fall, turn-off)`).
2. **Gate-Level Modeling:** Reconstructed the OAI gate using discrete primitive gates (NOR, etc.) to analyze the effect of structural delays.
3. **Dataflow Modeling:** Described the same logic using Continuous Assignment (`assign` statements) with worst-case delay parameters.
4. **Timing Verification & Comparative Analysis:** Developed a comprehensive testbench to monitor functional and timing responses, evaluating race conditions and incomplete propagation effects.
5. **Hierarchical System Design:** Utilized the developed OAI gates to construct a complex Boolean function $g(A, B)$ analyzing it as a multi-bit magnitude comparator.

## Tools Used
* **HDL:** SystemVerilog
* **Simulation & Verification:** ModelSim / QuestaSim
* **Documentation:** LaTeX / Markdown

## How to Run the Simulation
1. Open **ModelSim**.
2. Create a new project and add all files from the `src/` and `tb/` directories.
3. Compile all SystemVerilog files.
4. Run the simulation for `tb_compare` to observe timing differences between switch, gate, and dataflow modeling.
