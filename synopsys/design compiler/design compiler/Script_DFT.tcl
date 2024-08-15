# ---------------------------  Setup --------------------------- #
set search_path "/home/user24/Student_PDK/LIB"

set link_library "* saed90nm_max_lth.db" 

set target_library "saed90nm_max_lth.db"

#. If you want to replace the entire design module that consists of leaf cells, you 
# should use the remove_design command to remove the module and then read the Verilog netlist description of that module into memor
remove_design -all
# ----- Change mode for testing   
set test_default_scan_style


# --------------------------- Read_Design --------------------------- #
# -----Netlist 
#read_verilog ../output/johnson_dft.v
read_ddc ../output/UART_TX_TOP.ddc
# -----Constraits 
read_sdc ../output/UART_TX_TOP.sdc

# --------------------------- Test_prtocol --------------------------- #

# depend on number of scan chains 
# ----- Create_Ports_for_Testability
for {set i 0} {$i < 8 } { incr i } {
 create_port -direction in Scan_In[$i]
 set_dft_signal -type ScanDataIn -view spec -port Scan_In[$i] 
}

for {set j 0 } {$j < 8 } {incr j } { 
 create_port -direction out Scan_Out[$j]
 set_dft_signal -type ScanDataOut -view spec -port Scan_Out[$j]
}

create_port -direction in { Scan_En  } 


# ----- Test_prtocol 
#For signal already connected in design (view exist)
set_dft_signal -view exist -type ScanMasterClock -timing {45 55} -port clk
set_dft_signal -view exist -type Reset -active 1 -port Reset

#For signal not connected in design (view spec)
#set_dft_signal -view spec -type ScanDataIn -port Scan_In
#set_dft_signal -view spec -type ScanDataOut -port Scan_Out
set_dft_signal -view spec -type ScanEnable -active 1 -port Scan_En

#Determined number of scan chin 
set_scan_configuration -chain_count 8

# -------Simple_Constaints 
create_clock clk -period 1000
set_input_delay 250 Scan_In -clock clk
set_input_delay 150 Scan_En -clock clk


# ------- Report All Signals 
report_dft_signal -view exist
report_dft_signal -view spec

# -------Create_Test_protocol 
create_test_protocol
# ------------------- Drc_checking ------------------- #
dft_drc


#read_test_protocol ../results/johnson_dft.spf
# To prevent uniquification of your design, enter the command:
set_dft_insertion_configuration -preserve_design_name true


# ------------------- Replaced Flip-Flops ------------------- #
#Used it in case you used HDL Verilog design not netist 
compile -scan -incremental 

# ---- Preview  
preview_dft

# ------ Scan_stitching 
insert_dft

# --- Report_scan_chains 
report_scan_path 
 
# -------Coverage_estimate
dft_drc -coverage_estimate 
# ------------------- Outputs ------------------- #

# --------SPF_File (STIL Protcol File) 
write_test_protocol -out ../results/UART_TX_TOP_dft.spf

# ------- Coverage Estimation 
dft_drc -coverage_estimate > ../results/rpt.dft.drc_coverage
# -------- Reports 
report_area > ../results/rpt.dft.area.report
report_timing > ../results/rpt.dft.timing.report
report_qor > ../results/rpt.dft.qor.report

# --------- Netlist output (.v and .ddc )
write -format ddc -h  -o ../results/UART_TX_TOP_dft_compiled.ddc
write -format verilog -h  -o ../results/UART_TX_TOP_dft_compiled.v

write_sdf  ../results/UART_TX_TOP_dft.sdf

exit

