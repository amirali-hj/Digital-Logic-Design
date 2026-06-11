# Computer Assignment 5: Hierarchical Serial Transmitter with Abort Detection and LPM Integration

## Project Overview
This project marks the capstone implementation of the Digital Logic Design suite instructed by **Dr. Navabi** at the **University of Tehran**. It implements a complete, highly synchronized **Serial Communication Transmitter Subsystem** using **SystemVerilog** and **Intel Quartus Prime**.

The device state-machine governs continuous monitoring of a serial line (`rcIn`), handles framed window multi-cycle packet transmission via custom datapath counters, and deploys concurrent sequence monitoring to trigger instant hardware line-aborts upon encountering corrupted/malicious bitstreams.

## System Architecture & Sub-Modules
The top-level system cleanly integrates three primary functional blocks:
1. **Start Sequence Detector (From CA4):** Reused to monitor the serial stream for the specific `01111110` packet header. Upon detection, it flags the primary controller to wake up the transmitter.
2. **Transmitter Controller & Data Framing Window:** * Maintained at an idle state transmitting continuous `1`s on `txOut`.
   * Once triggered, it establishes a tight `97-clock-cycle` data framing window, driving the `txValid` signal high and transparently passing `rcIn` straight to `txOut`.
   * Built utilizing Intel Altera **LPM (Library of Parameterized Modules)** for optimal, hardware-agnostic counter structures.
3. **Abort Sequence Detector:** Monitors the active line concurrently for the complement stream (`10000001`). If an abort signature hits during active transmission, it instantly terminates data pass-through, drops `txValid`, fires a high-assertion `txAbort` pulse, and forces the subsystem back to its baseline search state.

## Industrial Quartus Workflow & FPGA Physical Mapping
* **IP-Driven Pre-Synthesis:** Leveraged structural design rules in Quartus by wiring architectural building blocks through native LPM cells, utilizing positive-edge clock triggers and absolute asynchronous resets.
* **Hierarchical Block Symbols:** Compiled individual modules into reusable schematics block symbols to compose the full system top-level schematic diagram.
* **Post-Synthesis Physical Auditing:** Analyzed the exported `.vo` netlists and `.sdo` delay documents. Audited the FPGA Technology Map, RTL viewer, and Chip Planner Floorplan to break down the logic element (LE) distribution, classifying memory register blocks from combinational lookup matrices.

## Verification Scenarios
* **Scenario A (Standard Framing):** Validates a successful header detection followed by unbroken 97 cycles of valid data transmission, resetting back to the idle search.
* **Scenario B (Line Abort Interruption):** Forces an abort sequence midway through the transmission window to evaluate the immediate breakdown of the frame and transient response times of the `txAbort` pulse.

## Tools Used
* **HDL Modeling:** SystemVerilog & Altera LPM IPs
* **Synthesis Suite:** Intel Quartus Prime
* **Simulation Engine:** ModelSim / QuestaSim
