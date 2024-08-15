# Run this when you are on PNR/Scripts


# put the search path directory of the technology 

set_app_var search_path /home/user24/Student_PDK/LIB

set TECH_FILE astroTechFile.tf 

# put the directory of your ndm created from the library manager

set reference_library /home/user24/mostafa_masoud/dc/Johnson/pnr/ndm/saed90nm_max_lth.ndm

#create design library from technology file & ndm

create_lib -technology $TECH_FILE -ref_libs $reference_library ALU.dlib

#read gate level netlist output from synthesis
read_verilog -top ALU /home/user24/mostafa_masoud/dc/ALU/results/ALU_dft_compiled.v



link_block

#set Tech /mnt/ext/synopsys/pdks/32nm/install/edu/SAED32_EDK/tech/milkyway
read_parasitic_tech -layermap tech2itf.map -tlup saed90nm_1p9m_1t_Cmax.tluplus  -name maxTLU

read_parasitic_tech -layermap tech2itf.map -tlup saed90nm_1p9m_1t_Cmin.tluplus  -name minTLU

#put the sdc file output from synthesis
read_sdc /home/user24/mostafa_masoud/dc/ALU/output/ALU.sdc
get_site_defs

set_attribute [get_site_defs unit] symmetry y

set_attribute [get_layers {M1 M3 M5 M7 M9} ] routing_direction horizontal

set_attribute [get_layers {M2 M4 M6 M8 } ] routing_direction vertical

get_attribute [get_layers M7] routing_direction

report_ignored_layers

set_ignored_layers -max_routing_layer M8

report_ignored_layers

save_block

start_gui 

