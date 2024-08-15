# -------------------------- Setup_file -------------------------- # 

# ----------- Search_path
set search_path "/home/user24/Student_PDK/LIB"

#set search_path "/mnt/ext/synopsys/pdks/14nm/install/edu/stdcell_rvt/db_nldm"; # User_48

#set search_path "/mnt/ext/saed14nm/stdcell_rvt/db_nldm /mnt/ext/saed14nm/stdcell_lvt/db_nldm" ; # User_5 

# ----------- Link and Target library 
#set_app_var link_library "* NangateOpenCellLibrary_ss0p95vn40c.db"
#set_app_var target_library "NangateOpenCellLibrary_ss0p95vn40c.db"

set_app_var link_library "* saed90nm_max_lth.db" 

set_app_var target_library "saed90nm_max_lth.db"

#List_Valid = { saed14rvt_tt0p6v125c ,  saed14rvt_ss0p72vm40c , } 
# ---------- Work_dir
sh rm -rf work
sh mkdir -p work
define_design_lib work -path ./work

# ---------- Assign Top module in Variable design 
set design UART_TX_TOP



# -------------------- Read_file -----------------#
analyze -library work -format verilog ../RTL/${design}.v
elaborate $design -lib work

# --------------- Define_Current_Top_Design --------------- #  
current_design  $design

# --------------- linking  --------------- # 
link

# --------------- Checking  --------------- # 
check_design

# ------- Constarints_file ---------- #
source ../Cons/cons.tcl  


# -------------- Compiling ----------------- #   
compile -map_effort medium ; #Mappig and oPtimization 
# --------------- Outputs ----------------- #
# -------- Launch_GUI 
start_gui
# ---------- Gate Level Netlist {.v , .ddc } (direct design compiler) 
write -hierarchy -format verilog -output ../output/${design}.v 
write -f ddc -hierarchy -output ../output/${design}.ddc   

# ---------- SDC(Synopsys Design Constraints) File
write_sdc  ../output/${design}.sdc 
 
# ---------- SDF(Standard Delay Format) File
write_sdf Johnson.sdf

# ----------- Reports ----------- #  
report_area > ../report/synth_area.rpt
report_cell > ../report/synth_cells.rpt
report_qor  > ../report/synth_qor.rpt
report_resources > ../report/synth_resources.rpt
report_timing -max_paths 10 > ../report/synth_timing.rpt 



exit
