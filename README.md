# Asynchronous FIFO - Verilog Implementation

This project implements a basic **asynchronous FIFO (First-In-First-Out)** buffer in Verilog using separate write and read clocks.

## 📁 Files

- `async_fifo.v` – Verilog design module
- `async_fifo_tb.v` – Testbench for simulation
- `waveform.png` – Simulation waveform from Vivado

## ⚙️ Features

- Separate `wr_clk` and `rd_clk` domains
- FIFO status flags: `full`, `empty`
- 8-bit data input/output: `din[7:0]`, `dout[7:0]`
- Simulated in Vivado 2025.1

## 🧪 Simulation

1. Open the project in **Vivado 2025.1**
2. Add both files to the simulation sources.
3. Run **Behavioral Simulation**
4. Check the waveform – you’ll see data being written and read from the FIFO.

## 📷 Sample Output

![Waveform](waveform.png)

## 🔧 Tools Used

- Vivado 2025.1
- Verilog HDL

---

✅ This is a beginner-friendly hardware project to demonstrate basic FIFO behavior and asynchronous communication between two clock domains.
