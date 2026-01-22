# 2-bit Adder (RTL → Synthesis → P&R → Layout Evidence)

This repository contains artifacts for a small digital design flow centered on a **2-bit adder with registered outputs**.

## Repository structure

- **RTL/** — Verilog RTL for the design (plus an RTL simulation screenshot / optional VCD)
- **DC/** — Synopsys Design Compiler (DC) inputs/outputs
  - `example.dc.tcl` (synthesis script; update paths for your environment)
  - synthesized netlist / SDC / SDF and reports (area, power, timing, constraints)
- **Innovus/** — Cadence Innovus place-and-route outputs
  - P&R netlist (`*.apr.v`), parasitics (`*.spef`), and timing back-annotation (`*.sdf`)
- **Innovus_Reports/** — P&R reports (connectivity, geometry, timing corners, etc.)
- **Virtuoso_layout/** — DRC/LVS clean screenshots and final layout screenshot
- **Verify/** — screenshots of simulation/waveforms for synthesized and P&R netlists
- **APR_Layout/** — final Innovus layout screenshot
- **Documents/** — supporting documentation (e.g., datasheet PDF)

## Design summary

- Module: `adder_2bit`
- Inputs: `clk`, `a[1:0]`, `b[1:0]`
- Outputs (registered): `sum[1:0]`, `cout`

RTL implementation computes `{cout, sum} = a + b` on the rising edge of `clk`.

## Evidence screenshots (quick links)

- RTL waveform: ![RTL waveform](<RTL/Screenshot of waveforms after running the testbench.jpg>)
- Synthesized netlist waveform: ![Synth waveform](<Verify/Screenshot of waveforms after running the testbench on synthesized gate netlist.jpg>)
- P&R netlist waveform: ![P&R waveform](<Verify/Screenshot of waveform after running the testbench on placed and routed netlist.jpg>)
- Innovus final layout: ![Innovus layout](<APR_Layout/Screenshot of final layout in Innovus.png>)
- Virtuoso final layout: ![Virtuoso layout](<Virtuoso_layout/Screenshot of final Layout in virtuoso .jpg>)

## Tool notes

- The Innovus netlist header indicates generation with **Cadence Innovus 17.12-s095_1** (per the file header in `Innovus/*.apr.v`).
- The DC script (`DC/example.dc.tcl`) references ASAP7 libraries and lab-specific paths; you must update those for your environment.

## Re-running the flow (high level)

Tool commands vary by lab environment and license availability. The included scripts are **examples** and contain **environment-specific paths**.

1. **Simulate RTL (Questa/ModelSim example)**
   - Compile `RTL/adder_2bit.v` with your testbench, or open your `.mpf` project (if used).

2. **Synthesis (Design Compiler)**
   - Update `DC/example.dc.tcl`:
     - `search_path`, `target_library`, `link_library`
     - `netlist_search_path`, `netlist_name`, and `clk_period`
   - Run:
     - `dc_shell -f example.dc.tcl`

3. **Place & Route (Innovus)**
   - Use the lab-provided Innovus setup and the `DC/innovus.cmd` (or your flow scripts) to generate the final netlist / SPEF / SDF.
