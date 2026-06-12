# Lab 3: Robust UART Serial Receiver Design Using Orthogonal FSMD Architecture

## Project Overview
This repository hosts the hardware architecture, multi-rate verification suites, and system-level integration for a universal asynchronous receiver transmitter (**UART Serial Receiver**). The system was developed at the **Digital Logic Laboratory, University of Tehran** under the academic supervision of **Professor Z. Navabi**.

The primary objective is to resolve timing retrieval over an asynchronous serial boundary where the transmitter and receiver do not share a common clock line. The solution deploys an **Orthogonal FSMD (Finite State Machine with Datapath)** architecture executing mid-bit oversampling to reliably capture and reconstruct serial bitstreams into parallel 8-bit words without data corruption.

## Architectural Design & Topography
The complete communication link consists of three highly integrated blocks operating across distinct clock domains:
1. **One-Pulse Generator (`OnePulser.sv`):** A clean anti-bounce interface that maps mechanical button presses into single-cycle validation pulses, protecting the transmitter from multi-trigger state degradation.
2. **Asynchronous Transmitter (TX):** Runs on a slow external analog clock generated via an **LM555 timer**, converting parallel input data into a 10-bit serial frame (1 Start bit, 8 Data bits, 1 Stop bit).
3. **Orthogonal Receiver (RX Subsystem):** Operates on the high-speed **50 MHz FPGA clock domain**. It captures the incoming stream through strict physical separation of control and datapath lines.

### Controller Logic (FSM)
The receiver's controller is implemented as a state-isolated FSM tracking three primary operation boundaries:
* **`IDLE`:** Continuous monitoring of the serial line; waits for a falling edge transition (`1` to `0`) and dampens line noise.
* **`COUNT`:** Activates the structural datapath counters to establish oversampling window grids and asserts shift-enable pulses.
* **`DONE`:** Validates frame boundaries, fires the `ready` handshake flag, transfers the parallel byte, and returns gracefully to `IDLE`.

### Datapath Components (`rx_datapath.sv`)
The physical data accumulation layout uses orthogonal hardware segments:
* **Half-Bit Counter:** Triggers upon start-bit assertion, counting exactly **10 FPGA clock cycles** to reach the absolute center-mass of the start bit, executing start-bit verification to filter glitches.
* **Full-Bit Counter:** Establishes bit-period intervals by tracking exactly **20 FPGA clock cycles** (`clksPerBit = 20`) to step sequentially from the center of one bit to the next.
* **Data Counter:** A 3-bit tracking matrix that limits the data frame to exactly **8 received bits**.
* **8-Bit Shift Register (`shiftreg_1bit_to_8bit`):** A serial-in, parallel-out register that samples the input line near the center of each bit period to avoid edge jitter and accurately reconstructs the byte.

## Timing Parameters & Ratio Mapping
* **FPGA Clock:** $50\text{ MHz}$
* **Oversampling Formula Boundary:** $\text{clksPerBit} = \frac{\text{Clock}_{\text{Fast}}}{\text{Baud Rate}} = 20 \text{ cycles}$
* **Mid-Bit Sample Point:** $\text{half} = \frac{\text{clksPerBit}}{2} = 10 \text{ cycles}$

## Hardware Verification
* **Simulation Suits:** ModelSim / QuestaSim behavioral testing verifies flawless timing alignment between the slow LM555 domain and the 50 MHz FPGA receiver grid under heavy random data vectors.
* **FPGA Deployment:** The final structural implementation was compiled, routed, and validated on-board, with hardware operations recorded and verified via structural logic diagnostics.

## Tools & Environment
* **HDL Architecture:** SystemVerilog
* **Simulation Engine:** ModelSim / QuestaSim
* **Target Hardware:** FPGA Development Board / LM555 Analog Timer
