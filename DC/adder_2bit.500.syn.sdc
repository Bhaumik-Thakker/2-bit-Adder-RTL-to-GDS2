###################################################################

# Created by write_sdc on Sun Mar 30 18:42:45 2025

###################################################################
set sdc_version 2.1

set_units -time ps -resistance kOhm -capacitance fF -voltage V -current mA
set_wire_load_mode segmented
set_max_fanout 16 [current_design]
set_driving_cell -lib_cell INVx3_ASAP7_75t_R [get_ports clk]
set_driving_cell -lib_cell INVx3_ASAP7_75t_R [get_ports {a[1]}]
set_driving_cell -lib_cell INVx3_ASAP7_75t_R [get_ports {a[0]}]
set_driving_cell -lib_cell INVx3_ASAP7_75t_R [get_ports {b[1]}]
set_driving_cell -lib_cell INVx3_ASAP7_75t_R [get_ports {b[0]}]
set_load -pin_load 0.01 [get_ports {sum[1]}]
set_load -pin_load 0.01 [get_ports {sum[0]}]
set_load -pin_load 0.01 [get_ports cout]
create_clock [get_ports clk]  -period 500  -waveform {0 250}
set_clock_uncertainty 0.01  [get_clocks clk]
set_clock_transition -max -rise 0.1 [get_clocks clk]
set_clock_transition -max -fall 0.1 [get_clocks clk]
set_clock_transition -min -rise 0.1 [get_clocks clk]
set_clock_transition -min -fall 0.1 [get_clocks clk]
set_input_delay -clock clk  0.1  [get_ports {a[1]}]
set_input_delay -clock clk  0.1  [get_ports {a[0]}]
set_input_delay -clock clk  0.1  [get_ports {b[1]}]
set_input_delay -clock clk  0.1  [get_ports {b[0]}]
set_output_delay -clock clk  0.1  [get_ports {sum[1]}]
set_output_delay -clock clk  0.1  [get_ports {sum[0]}]
set_output_delay -clock clk  0.1  [get_ports cout]
