# Lab 4: Digital Modulation System (ASK/FSK) utilizing DDS and PWM-Based DAC

## Project Overview
This repository features the complete hardware architecture and verification suite for a full-scale **Digital Modulation System**, developed at the **Digital Logic Laboratory, University of Tehran** under the supervision of **Professor Z. Navabi**.

The project implements Frequency Shift Keying (FSK) and Amplitude Shift Keying (ASK) transmission topologies natively on an FPGA. It effectively processes discrete baseband messages (Morse code sequences) and modulates a dynamically synthesized high-frequency sinusoidal carrier. Furthermore, it incorporates a hardware-efficient Digital-to-Analog Converter (DAC) using Pulse Width Modulation (PWM) and an external analog filter.

## System Architecture & Core Modules
The datapath is strictly modular, combining advanced digital signal processing techniques:

1. **Direct Digital Synthesis (DDS) Core:** * Generates a highly stable and phase-continuous sinusoidal carrier wave.
   * **Memory Optimization:** Instead of storing a full wave, it leverages a $64\times8$-bit ROM (`sine.mif`) containing only the first quadrant ($0$ to $\pi/2$). A custom state-machine-driven **Phase Accumulator** utilizes quadrant symmetry (address inversion and 2's complement amplitude inversion) to reconstruct the full $360^\circ$ continuous wave, drastically reducing required FPGA logic elements.
2. **Frequency Divider Network:**
   * Generates discrete clock rates from the main system clock to establish the distinct *Mark* and *Space* frequencies required for FSK modulation. 
3. **Message Processor:**
   * Takes a 5-bit parallel input and serializes it into standard Morse code sequences (dots and dashes), appending a hardcoded `0101` synchronization tag to initiate the transmission packet.
4. **PWM-Based DAC & Analog Reconstruction:**
   * Replaces expensive dedicated DAC chips by comparing the 8-bit instantaneous amplitude of the synthesized sine wave against a high-speed free-running counter.
   * The resulting variable-duty-cycle PWM bitstream is passed through a physical **external RC Low-Pass Filter** ($1\text{ k}\Omega$ resistor, $10\text{ nF}$ capacitor) to smoothly extract the average voltage and reconstruct the analog modulated sine wave.

## Implementation Flow
* **HDL Modeling:** Entirely described using SystemVerilog, emphasizing parameterized configurations and structural logic block instantiations.
* **Top-Level Integration:** The subsystems were successfully encapsulated into modular symbols and integrated using the **Intel Quartus Prime Schematic Block Diagram File (`.bdf`)** flow.
* **Simulation & Validation:** ModelSim wave verification explicitly demonstrates continuous phase transitioning during FSK frequency hops and precise amplitude blanking during ASK operation.

## Execution Guide
1. Synthesize the project in **Quartus Prime**, ensuring the `sine.mif` is linked to the M9K memory blocks using `(* romstyle="M9K" *)` attributes.
2. Run the provided `tb_modulation.sv` to observe the FSK frequency shifts across Morse code transitions and analyze the PWM density variations representing the sinusoidal peaks.
