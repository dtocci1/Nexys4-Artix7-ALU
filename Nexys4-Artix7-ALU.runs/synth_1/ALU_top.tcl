# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir /home/dylan/Documents/Nexys4-Artix7-ALU/Nexys4-Artix7-ALU.cache/wt [current_project]
set_property parent.project_path /home/dylan/Documents/Nexys4-Artix7-ALU/Nexys4-Artix7-ALU.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo /home/dylan/Documents/Nexys4-Artix7-ALU/Nexys4-Artix7-ALU.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib -sv {
  /home/dylan/Documents/Nexys4-Artix7-ALU/Nexys4-Artix7-ALU.srcs/sources_1/imports/new/ALU.sv
  /home/dylan/Documents/Nexys4-Artix7-ALU/Nexys4-Artix7-ALU.srcs/sources_1/imports/new/But_opcode.sv
  /home/dylan/Documents/Nexys4-Artix7-ALU/Nexys4-Artix7-ALU.srcs/sources_1/imports/new/Counter.sv
  /home/dylan/Documents/Nexys4-Artix7-ALU/Nexys4-Artix7-ALU.srcs/sources_1/imports/new/Counter_3bit.sv
  /home/dylan/Documents/Nexys4-Artix7-ALU/Nexys4-Artix7-ALU.srcs/sources_1/imports/new/anode_MUX.sv
  /home/dylan/Documents/Nexys4-Artix7-ALU/Nexys4-Artix7-ALU.srcs/sources_1/imports/new/cathode_MUX.sv
  /home/dylan/Documents/Nexys4-Artix7-ALU/Nexys4-Artix7-ALU.srcs/sources_1/imports/new/encoder.sv
  /home/dylan/Documents/Nexys4-Artix7-ALU/Nexys4-Artix7-ALU.srcs/sources_1/imports/new/ALU_top.sv
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc /home/dylan/Documents/Nexys4-Artix7-ALU/Nexys4-Artix7-ALU.srcs/constrs_1/imports/Downloads/Nexys-A7-100T-Master.xdc
set_property used_in_implementation false [get_files /home/dylan/Documents/Nexys4-Artix7-ALU/Nexys4-Artix7-ALU.srcs/constrs_1/imports/Downloads/Nexys-A7-100T-Master.xdc]


synth_design -top ALU_top -part xc7a100tcsg324-1


write_checkpoint -force -noxdef ALU_top.dcp

catch { report_utilization -file ALU_top_utilization_synth.rpt -pb ALU_top_utilization_synth.pb }
