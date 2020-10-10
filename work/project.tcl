set projDir "C:/Users/hhzhe/Documents/alchitry/testadder/work/vivado"
set projName "testadder"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/hhzhe/Documents/alchitry/testadder/work/verilog/au_top_0.v" "C:/Users/hhzhe/Documents/alchitry/testadder/work/verilog/reset_conditioner_1.v" "C:/Users/hhzhe/Documents/alchitry/testadder/work/verilog/button_conditioner_2.v" "C:/Users/hhzhe/Documents/alchitry/testadder/work/verilog/edge_detector_3.v" "C:/Users/hhzhe/Documents/alchitry/testadder/work/verilog/addertester_4.v" "C:/Users/hhzhe/Documents/alchitry/testadder/work/verilog/decoder_5.v" "C:/Users/hhzhe/Documents/alchitry/testadder/work/verilog/full_adder_6.v" "C:/Users/hhzhe/Documents/alchitry/testadder/work/verilog/pipeline_7.v" "C:/Users/hhzhe/Documents/alchitry/testadder/work/verilog/display7seg_8.v" "C:/Users/hhzhe/Documents/alchitry/testadder/work/verilog/checker_9.v" "C:/Users/hhzhe/Documents/alchitry/testadder/work/verilog/testctrl_10.v" "C:/Users/hhzhe/Documents/alchitry/testadder/work/verilog/multi_seven_seg_11.v" "C:/Users/hhzhe/Documents/alchitry/testadder/work/verilog/seven_seg_12.v" "C:/Users/hhzhe/Documents/alchitry/testadder/work/verilog/testtable_13.v" "C:/Users/hhzhe/Documents/alchitry/testadder/work/verilog/counter_14.v" "C:/Users/hhzhe/Documents/alchitry/testadder/work/verilog/counter_15.v" "C:/Users/hhzhe/Documents/alchitry/testadder/work/verilog/decoder_16.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/hhzhe/Documents/alchitry/testadder/work/constraint/alchitry.xdc" "C:/Users/hhzhe/Documents/alchitry/testadder/work/constraint/io.xdc" "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
