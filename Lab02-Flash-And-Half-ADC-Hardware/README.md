# Lab 2: Design and Solderless Breadboard Implementation of a 2-Bit Flash-and-Half ADC

## Project Overview
This repository contains the physical hardware architecture, experimental test suits, and frequency response analysis for a **2-bit Flash-and-Half Analog-to-Digital Converter (ADC)**. The system was developed at the **Digital Logic Laboratory, University of Tehran** under the academic supervision of **Professor Z. Navabi**.

The primary objective is to investigate the mixed-signal boundaries between continuous analog signals and discrete binary data. The project covers structural resistive ladder quantization, active window comparator configuration, priority encoding matrix interfacing, and practical bandwidth limitations under high-frequency excitation.

## Architectural Design & Hardware Topography
The system transforms a variable analog voltage sourced from a $10\text{ k}\Omega$ potentiometer into a 2-bit synchronized digital format:
1. **Resistive Voltage Divider:** A symmetric ladder composed of five equal $1\text{ k}\Omega$ precision resistors connected across the supply rails ($V_{CC}$ to $GND$), establishing four evenly spaced reference threshold voltages.
2. **Analog Comparators Window:** Employs four concurrent comparators (utilizing **LM393** open-collector or **uA741** operational amplifier ICs) to evaluate the analog input $V_{in}$ against the ladder thresholds, generating a classic multi-level thermometer code.
3. **Priority Encoder Interfacing:** Maps the 4-line thermometer code into a structured 2-bit binary representation using a **74HC148 Priority Encoder IC**. Because the 74HC148 logic functions on active-low assertion profiles, a **7404 Hex Inverter IC** is integrated to patch the comparator output stages correctly.
4. **Visual Monitoring:** Dual low-current LEDs are tied to the encoder's output pins ($A_1$ as MSB, $A_0$ as LSB) to establish an instantaneous static state readout.

## Experimental Results & Parameter Metrics

### A. Static Quantization Profile
By tuning the input potentiometer, four distinct, deterministic quantization regions were mapped across a uniform step size (Least Significant Bit voltage step) of $\Delta V = \frac{V_{CC}}{4}$:
* **Region 0 (`00`):** Mini-scale input; both indicator LEDs remain completely suppressed.
* **Region 1 (`01`):** $V_{in}$ outpaces the first threshold step; LSB LED illuminates while MSB remains dark.
* **Region 2 (`10`):** Mid-scale transition; MSB LED transitions to high-intensity while LSB turns off.
* **Region 3 (`11`):** Maxi-scale input; both output indicators achieve fully saturated active states.

### B. Dynamic Frequency & Signal Integrity Analysis
To stress-test the tracking capability and settling boundaries of the active electronics, the mixed-signal network was driven under periodic wave configurations across several frequency steps monitored via a digital storage oscilloscope:
* **Low-Frequency Range (~64.9 kHz):** Delivered highly stable, clean rectangular output transitions. Waveforms exhibited minimal high-frequency distortions, proving the system operates well within its basic design margin.
* **Mid-Frequency Range (~173.2 kHz to 175.6 kHz):** Produced a well-balanced, nearly symmetric output square wave maintaining a stable ~50% duty cycle, confirming precise operational synchronization.
* **High-Frequency Cruising (~1.35 MHz):** Exposed significant physical non-idealities. Severe overshoot and high-frequency under-damped ringing appeared immediately following switching edges. 

### C. Root-Cause Analysis of High-Frequency Distortion
The signal degradation observed at **1.35 MHz** is systematically traced to two physical core vulnerabilities:
1. **Active Device Architecture limitations:** The intrinsic bandwidth limitations and finite **Slew Rate** caps of the uA741/LM393 op-amp structures prevent instantaneous output slewing during megahertz transitions.
2. **Parasitic Path Elements:** Solderless breadboards inject massive parasitic layout capacitances and unintended line inductances along the structural wiring tracks, transforming high-speed transitions into under-damped resonant loops.

## Apparatus & Physical Components Utilized
* **Semiconductor ICs:** 74HC148 (4-to-2 Priority Encoder), 7404 (Hex Inverter), LM393 / uA741 (Comparators).
* **Passive Elements:** 5x $1\text{ k}\Omega$ matching resistors, $10\text{ k}\Omega$ Potentiometer, High-efficiency LEDs.
* **Instrumentation Setup:** Regulated DC Bench Power Supply, Function/Signal Generator, Multi-Channel Digital Storage Oscilloscope, Solderless prototyping breadboard.
