copy_block -from_block UART.dlib:PowerPlanning.design -to_block Placement1.design

current_block Placement1.design

report_qor -summary
report_design -summary
report_utilization

check_design -checks pre_placement_stage

report_lib saed90nm_max_lth

set_voltage 1.08

set_parasitic_parameters -early_spec maxTLU -late_spec minTLU


# Run 5 stages of placement : .coarse placement  .initial_drc-HFS .running initial optimization .final_place
#  . final_optomization

# place_opt

man place_opt


#These  stages  are:  initial_place,  initial_drc,  initial_opto,
             # final_place, and final_opto.
#This option cannot be used with the -from or -to options.


place_opt -from initial_place -to initial_place

check_pg_drc

place_opt -from initial_place -to initial_drc

check_pg_drc


place_opt -from initial_drc -to initial_opto

check_pg_drc

place_opt -from initial_opto -to final_place  ///no overlap

check_pg_drc

place_opt -from final_place -to final_opto

check_pg_drc



#View congestion map
#report_congestion -rerun_global_router

# check legalizaation of all cells [no overlapping cells ....]

check_legality -verbose > /home/user24/mostafa_masoud/icc2/UART/pnr/placement/Placement_legalization.rpt

report_utilization > /home/user24/mostafa_masoud/icc2/UART/pnr/placement/Placement_legalization.rpt


# save_block

save_block -as Placement1 UART.dlib:Placement1.design

# Save Netlist

write_verilog   /home/user24/mostafa_masoud/icc2/UART/pnr/placement/Placement_netlist.v


# Export Reports 


report_cell > /home/user24/mostafa_masoud/icc2/UART/pnr/placement/Placement_cells.rpt

report_qor  > /home/user24/mostafa_masoud/icc2/UART/pnr/placement/Placement_qor.rpt

report_timing -max_paths 10 > /home/user24/mostafa_masoud/icc2/UART/pnr/placement/Placement_timing.rpt

report_timing -delay min -max_paths 10 > /home/user24/mostafa_masoud/icc2/UART/pnr/placement/Placement_timing_hold.rpt


