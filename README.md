# Parameterized Systolic Array Hardware Accelerator for Matrix Multiplication

A parameterized **RTL hardware accelerator** designed in **Verilog HDL** for high-performance matrix multiplication and deep learning workloads. The accelerator employs a scalable **2×2 systolic array architecture** composed of custom Processing Elements (PEs) with pipelined Multiply-Accumulate (MAC) units and configurable dataflow for efficient parallel computation.

![Hardware](https://img.shields.io/badge/Hardware-FPGA-blue)
![Language](https://img.shields.io/badge/Language-Verilog%20HDL-success)
![Design](https://img.shields.io/badge/Design-RTL-orange)
![Application](https://img.shields.io/badge/Application-DNN%20Accelerator-red)

---

##  Project Overview

This project focuses on designing a scalable hardware accelerator for matrix multiplication using a systolic array architecture. Matrix multiplication forms the computational backbone of many modern applications, including deep neural networks, signal processing, and scientific computing.

The accelerator is implemented entirely in Verilog HDL using a modular RTL design. It consists of a **2×2 systolic array** of Processing Elements (PEs), where each PE performs pipelined Multiply-Accumulate (MAC) operations while propagating operands and partial sums across neighboring PEs.

The design emphasizes modularity, scalability, and parallel computation, providing a foundation for future AI hardware accelerators.

---

##  Key Features

* Parameterized 2×2 Systolic Array Architecture
* Custom REDAS-inspired Processing Element (PE)
* Pipelined Multiply-Accumulate (MAC) Unit
* Parallel Matrix Multiplication
* Configurable Dataflow Between Processing Elements
* Modular RTL Design
* Scalable Architecture for Larger Arrays
* RTL Functional Verification using Custom Testbenches

---

##  System Architecture

### Processing Element (PE)

Each Processing Element consists of:

* 8-bit Multiplier
* 16-bit Accumulator
* Pipeline Registers
* Crossbar-based Data Routing
* Partial Sum Propagation Logic

---

### 2×2 Systolic Array

The accelerator contains four interconnected Processing Elements that perform matrix multiplication in a pipelined manner.

Features include:

* Operand Broadcasting
* Neighbor-to-Neighbor Data Propagation
* Parallel MAC Computation
* Partial Sum Accumulation
* Scalable PE Interconnection

---

##  Major Modules

* Processing Element (PE)
* Multiply-Accumulate (MAC) Unit
* Crossbar Switch
* Input Routing Logic
* Output Routing Logic
* Pipeline Registers
* Array Controller
* Top-Level 2×2 Systolic Array

---

##  Design Flow

1. RTL Design using Verilog HDL
2. Modular PE Development
3. MAC Unit Integration
4. Crossbar Routing Implementation
5. 2×2 PE Array Construction
6. RTL Simulation and Functional Verification
7. Performance Validation using Matrix Multiplication Test Cases

---

##  Features of the Accelerator

* High Parallelism
* Pipelined Computation
* Modular Architecture
* Scalable RTL Design
* Efficient Data Reuse
* Low-Latency Matrix Multiplication
* Suitable for AI and DNN Workloads

---

##  Verification

The accelerator was verified using custom Verilog testbenches with multiple matrix multiplication test cases.

Verification includes:

* Processing Element Validation
* MAC Unit Verification
* Crossbar Functionality
* Dataflow Verification
* 2×2 Matrix Multiplication
* Functional RTL Simulation

---

##  Tools Used

* Verilog HDL
* Xilinx Vivado
* RTL Simulation
* Digital Design Methodology

---


##  Documentation

The repository includes RTL source code, simulation testbenches, waveform results, and design documentation for the complete 2×2 systolic array accelerator.

---

##  Future Work

* Parameterize the architecture for NxN systolic arrays.
* FPGA implementation and timing analysis.
* Support configurable dataflows and precision formats.
* Optimize area, power, and throughput.
* Extend the design for convolution and transformer workloads.

---

##  Author

**Yashwanth Sri Sai Chitturi**

B.Tech Electrical Engineering

**Interests:** VLSI • RTL Design • FPGA • Computer Architecture • AI Hardware Accelerators
