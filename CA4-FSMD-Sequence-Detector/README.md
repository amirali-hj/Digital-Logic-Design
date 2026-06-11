# Computer Assignment 4: FSMD-Based Sequence Detector and FPGA Synthesis Flow

## Project Overview
This project implements an efficient, area-optimized **FSMD (Finite State Machine with Datapath)** Sequence Detector using **SystemVerilog**, developed as part of the Digital Logic Design course instructed by **Dr. Navabi** at the **University of Tehran**. 

The architecture is designed to detect a specific serial bitstream: a `1` followed by exactly six `0`s, and a final `1` (Pattern: `10000001`) on the `J` input stream. Instead of implementing a massive, non-scalable 9-state FSM, the design integrates a compact Moore FSM coupled with a synchronous divide-by-6 counter to achieve a highly modular and optimized hardware footprint.

## Hardware Architecture & Integration
* **Controller (Moore FSM):** Coordinates the synchronization boundaries. It detects the initial header bit, triggers and monitors the datapath counter, and asserts a single-cycle valid high output pulse upon successful pattern matches.
* **Datapath (Divide-by-6 Counter):** Dynamically initialized and tracked by the FSM to count exactly six consecutive zeros, offloading state-explosion overhead from the main controller.
* **Single-Module Integration:** Both sequential blocks (FSM and Counter) are encapsulated within a single integrated module using cleanly segregated clocked `always` structures.

## FPGA Synthesis & Implementation Flow
The behavioral design was moved beyond software simulation into a complete physical implementation suite using **Intel Quartus Prime**:
* **Symbol Generation:** Created an RTL block symbol representation for structural hierarchical reusability.
* **Gate-Level Synthesis:** Generated post-synthesis netlists (`.vo`) and standard delay format files (`.sdo`) to capture precise routing and cell propagation metrics.
* **Physical Layout Analysis:** Analyzed the FPGA Technology Map, RTL View, and Chip Planner Floorplan to inspect hardware mappings, verifying resource utilization across logic array blocks (LABs) and identifying sequential flip-flops versus combinational Look-Up Tables (LUTs).

## Verification Suite
* **Pre-Synthesis Verification:** Behavioral testing in ModelSim to validate ideal functional compliance.
* **Post-Synthesis Timing Analysis:** Dual-instantiated comparative testbench to measure real physical routing propagation delays, evaluating setup/hold margins and race conditions.

## Tools Used
* **HDL Architecture:** SystemVerilog
* **Synthesis & FPGA Mapping:** Intel Quartus Prime
* **Simulation Suit:** ModelSim / QuestaSim
