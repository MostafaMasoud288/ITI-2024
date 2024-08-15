# PT script

pt_shell


#assign search path  
set_app_var search_path "/home/user24/Student_PDK/LIB"

#assign target & Link  library 
set_app_var target_library "saed90nm_max_lth.db"

set_app_var link_library "* $target_library"

# Netlist Reading from ICC2
#read_verilog /home/user41/Elgammal/j3/Johnson_V2/outputs/johnson.v
read_verilog /home/user24/mostafa_masoud/icc2/ALU/output/Routing_netlist.v
link_design

# Reading parasitics & constrains
read_parasitics  /home/user24/mostafa_masoud/icc2/ALU/output/ALU_Routing_Spef.spef.maxTLU_-40.spef
#read_sdc /home/user41/Elgammal/j3/Johnson_V2/pnr/output/johnson_Routing_SDC.sdc
read_sdc  /home/user24/mostafa_masoud/icc2/ALU/output/ALU_Routing_SDC.sdc
update_timing

# Checks 

report_timing > /home/user24/mostafa_masoud/icc2/ALU/pnr/prime_time/report_timing.rpt
report_analysis_coverage > /home/user24/mostafa_masoud/icc2/ALU/pnr/prime_time/report_analysis_coverage.rpt
report_global_timing > /home/user24/mostafa_masoud/icc2/ALU/pnr/prime_time/report_global_timing.rpt
report_clocks > /home/user24/mostafa_masoud/icc2/ALU/pnr/prime_time/report_clocks.rpt

report_constraint -all_violators -significant_digits 4 > /home/user24/mostafa_masoud/icc2/ALU/pnr/prime_time/report_constraint.rpt
report_timing -delay_type max -nworst 40 -significant_digits 4 > /home/user24/mostafa_masoud/icc2/ALU/pnr/prime_time/report_timing.rpt

write_sdf /home/user24/mostafa_masoud/icc2/ALU/pnr/prime_time/ALU.sdf
