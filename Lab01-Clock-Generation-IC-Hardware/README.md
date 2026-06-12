# Lab 1: Clock and Periodic Signal Generation (Hardware Implementation)

## Project Overview
This project presents the physical hardware implementation and experimental analysis of clock generation and periodic signaling methodologies, developed at the **Digital Logic Laboratory, University of Tehran** under the academic supervision of **Professor Z. Navabi**.

The core objective is to evaluate hardware-level propagation delays, design highly stable analog/digital relaxation oscillators using discrete integrated circuits, and implement modular synchronous frequency division techniques to achieve precise output periods.

## Experimental Phases & Technical Deep-Dive

### 1. Ring Oscillator & Propagation Delay Measurement
* **Hardware Setup:** Constructed using a cascaded chain of 5 discrete inverters from the **74HCT04 Hex Inverter IC**.
* **Experimental Metrics:** The baseline free-running ring oscillator successfully toggled at an observed frequency of **8.98 MHz**, yielding an aggregate feedback period of $T = 111.35\text{ ns}$.
* **Mathematical Extraction:** Based on the loop equation $T = 2N \cdot T_{\text{inv}}$ (where $N=5$), the hardware propagation delay of a solitary inverter cell was mathematically extracted to be **$11.135\text{ ns}$**.
* **RC Network Loading:** Introduced a lumped RC network ($470\text{ pF}$ capacitor and series resistors) inside the feedback loop to damp the internal phase delays, systematically dropping the switching boundaries.

### 2. LM555 Timer in Astable Mode
* Developed an analog clock generator utilizing an **LM555 Timer IC** configured for continuous astable multi-vibrator operations.
* Monitored the charging path via $R_1 + R_2$ and the active discharging transition via $R_2$ across an external $10\text{ nF}$ timing capacitor.
* Evaluated resource parameters across varying $R_2$ loads to observe duty cycle shifting:
  * **$R_2 = 1\text{ k}\Omega$:** Produced an experimental **65% Duty Cycle** (Matching theoretical calculations perfectly).
  * **$R_2 = 10\text{ k}\Omega$:** Shifted the execution matrix to a **51.6% Duty Cycle**.
  * **$R_2 = 100\text{ k}\Omega$:** Pushed performance parameters asymptotically close to a clean square-wave boundary at a **49.7% Duty Cycle**.

### 3. Synchronous Counter as a Frequency Divider & T-FF Shaping
* **The Problem:** Direct low-frequency clock generation often suffers from severe jitter and high 1-2% baseline timing deviations.
* **The Architecture:** Routed the high-frequency $9\text{ MHz}$ ring oscillator output into the clock entry pins of two cascaded **74HC193 Synchronous 4-Bit Up/Down Counters**.
* **Modulus Generation:** Configured a Modulus-200 division configuration. Utilizing the formula $\text{Initial Value} = \text{Maximum Value} - \text{Modulus}$, the parallel load gates were driven with an injected binary preset of **56** (`8'b00111000`).
* **Feedback Loop:** A **74HC08 AND gate** combined the terminal MSB carry-out pulse with the active-low loading pins to trigger automatic phase resets.
* **Duty Cycle Shaping:** Fed the resulting $50.8\text{ kHz}$ counter overflow pulse into a **74HC74 Dual D-Type Flip-Flop** configured as a T-FF ($D = \neg Q$) to divide the frequency by 2, delivering a symmetrical output waveform with a nearly **perfect 50% duty cycle**.

## Instrumentation & Laboratory Apparatus
* **Active Hardware:** 74HCT04 (Hex Inverter), LM555 (Timer), 74HC193 (4-Bit Counter), 74HC08 (Quad AND), 74HC74 (Dual D-FF).
* **Test Benches:** Digital Oscilloscope (Waveform & Duty Cycle Extraction), Regulated DC Power Supply, Breadboard implementation with minimal wire paths to limit parasitic inductance/capacitance.
