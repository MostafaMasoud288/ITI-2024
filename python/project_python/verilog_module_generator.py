##############identifier validation######################
import re

# List of Verilog HDL keywords
verilog_keywords = [
    "always", "and", "assign", "automatic", "begin", "buf", "bufif0", "bufif1",
    "case", "casex", "casez", "cell", "cmos", "config", "deassign", "default",
    "defparam", "design", "disable", "edge", "else", "end", "endcase", "endconfig",
    "endfunction", "endmodule", "endprimitive", "endspecify", "endtable", "endtask",
    "event", "for", "force", "forever", "fork", "function", "generate", "genvar",
    "highz0", "highz1", "if", "ifnone", "incdir", "include", "initial", "inout",
    "input", "instance", "integer", "join", "large", "liblist", "library", "localparam",
    "macromodule", "medium", "module", "nand", "negedge", "nmos", "nor", "noshowcancelled",
    "not", "notif0", "notif1", "or", "output", "parameter", "pmos", "posedge", "primitive",
    "pull0", "pull1", "pulldown", "pullup", "pulsestyle_onevent", "pulsestyle_ondetect",
    "rcmos", "real", "realtime", "reg", "release", "repeat", "rnmos", "rpmos", "rtran",
    "rtranif0", "rtranif1", "scalared", "showcancelled", "signed", "small", "specify",
    "specparam", "strong0", "strong1", "supply0", "supply1", "table", "task", "time",
    "tran", "tranif0", "tranif1", "tri", "tri0", "tri1", "triand", "trior", "trireg",
    "unsigned", "use", "vectored", "wait", "wand", "weak0", "weak1", "while", "wire",
    "wor", "xnor", "xor"
]

def is_invalid_verilog_identifier(word):
    # Check if word is a Verilog keyword
    if word in verilog_keywords:
        return 1
    # Verilog identifiers must start with a letter or underscore, followed by any number of letters, digits, or underscores
    identifier_pattern = re.compile(r'^[a-zA-Z_][a-zA-Z0-9_]*$')
    
    if identifier_pattern.match(word):
        return 0
    else :
        return 1

    


##############main code######################
#############################################
#############################################
mydict={}
input_dict={}
output_dict={}
param=[]
#module name
print("welcome to our module")
module_name=input("what is the name of the module : ")
non_validation=is_invalid_verilog_identifier(module_name)
while non_validation==1 :
    print("invalid module name")
    module_name=input("what is the name of the module : ")
    non_validation=is_invalid_verilog_identifier(module_name)
verilog_keywords.append(module_name)
print("parametrized? 1 for yes/0 for no") 
paramaterized=int(input())
while paramaterized >1:
      paramaterized=int(input("enter right choice 1 or 0\n"))
########################################
if paramaterized == 1:
   print("how many parameters :") 
   numberofparameters=int(input())
   for i in range( numberofparameters  ):
       print("parameter %d name :"%(i+1)) 
       p=input()
       non_validation=is_invalid_verilog_identifier(p)
       while non_validation==1 :
           print("invalid parameter name")
           print("parameter %d name :"%(i+1)) 
           p=input()
           non_validation=is_invalid_verilog_identifier(p)
       print("parameter width :") 
       n=int(input())
       param.append(p)
       verilog_keywords.append(p)
       mydict.update({p:n})  
       print(mydict)
       print(param)
#####################################
print("do you need sequential logic ? 0 for no / 1 for yes")
sequential=int(input())
while  sequential >1:
      sequential=int(input("enter right choice 1 or 0\n"))
if sequential==1:
 print("input clk name :")
 in_put=input()      
 input_dict.update({in_put:1})
 print("input reset name :")
 in_put_rst=input()      
 input_dict.update({in_put_rst:1})
 


########################################
print("how many inputs :") 
numberofinputs=int(input())
for i in range(numberofinputs):
    print("parametrized? 1 for yes/0 for no") 
    paramaterized_input=int(input())
    while  paramaterized_input >1:
          paramaterized_input=int(input("enter right choice 1 or 0\n"))
    if paramaterized_input==1:
        print("input %d name :"%(i+1) )
        in_put=input()
        non_validation=is_invalid_verilog_identifier(in_put)
        while non_validation==1 :
            print("invalid input name")
            print("input %d name :"%(i+1)) 
            in_put=input()
            non_validation=is_invalid_verilog_identifier(in_put)
        verilog_keywords.append(in_put)
        print("which parameter :") 
        paramaterized_input_name=input()
        if paramaterized_input_name in param:
            print("valid")
        else:
            print("choose from given parameters %s"%param)
            paramaterized_input_name=input()
        input_dict.update({in_put:paramaterized_input_name})  
    else:
       print("input %d name :"%(i+1) )
       in_put=input()
       non_validation=is_invalid_verilog_identifier(in_put)
       while non_validation==1 :
           print("invalid input name")
           print("input %d name :"%(i+1)) 
           in_put=input()
           non_validation=is_invalid_verilog_identifier(in_put)
       verilog_keywords.append(in_put)
       print("width :") 
       width=input()
       input_dict.update({in_put:width})  

############################################
print("how many outputs :") 
numberofoutputs=int(input())
for i in range(numberofoutputs):
    print("parametrized? 1 for yes/0 for no") 
    paramaterized_output=int(input())
    while  paramaterized_output >1:
          paramaterized_output=int(input("enter right choice 1 or 0\n"))
    if paramaterized_output==1:
        print("output %d name :"%(i+1)) 
        out_put=input()
        non_validation=is_invalid_verilog_identifier(out_put)
        while non_validation==1 :
            print("invalid output name")
            print("output %d name :"%(i+1)) 
            out_put=input()
            non_validation=is_invalid_verilog_identifier(out_put)
        verilog_keywords.append(out_put)
        print("reg / wire :") 
        kind=input()
        print("which parameter :") 
        paramaterized_output_name=input()
        if paramaterized_output_name in param:
            print("valid")
        else:
            print("choose from given parameters %s"%param)
            paramaterized_output_name=input()
        output_dict.update({out_put:[paramaterized_output_name,kind]})  
    else:
        print("output %d name :"%(i+1)) 
        out_put=input()
        non_validation=is_invalid_verilog_identifier(out_put)
        while non_validation==1 :
            print("invalid output name")
            print("output %d name :"%(i+1)) 
            out_put=input()
            non_validation=is_invalid_verilog_identifier(out_put)
        verilog_keywords.append(out_put)
        print("reg / wire :") 
        kind=input()
        print("width :") 
        width2=int(input())
        output_dict.update({out_put:[width2,kind]})  
print(output_dict)

#########################################################file handling
###################parameters############################
f =open("C:/Users/DELL/%s.v"%module_name,'w')
f.write("module %s #(" %module_name)
x=list(mydict.keys())
y=list(mydict.values())
for i in range(numberofparameters) :
     if i==(numberofparameters-1) :
       f.write("parameter %s = %d)" %(x[i],y[i])) 
       break
     f.write("parameter %s = %d," %(x[i],y[i]))
f.write(" (")
################inputs####################
x1=list(input_dict.keys())
y1=list(input_dict.values())

for i in range(len(x1)) :
       f.write("\n input [%s-1:0] %s ," %(y1[i],x1[i]))
#################outputs#######################       
x2=list(output_dict.keys())
y2=list(output_dict.values())  
print(y2)    

for i in range(numberofoutputs) :
    if i==(numberofoutputs-1) :
      f.write("\n output %s [%s-1:0] %s );" %(y2[i][1],y2[i][0],x2[i]))
      break
    f.write("\n output %s [%s-1:0] %s ," %(y2[i][1],y2[i][0],x2[i]))
f.write("\n ////internal wires") 
f.write("\n ////combinational logic")

if sequential==1:
    f.write("\n ////sequential logic")
    print("synchronos or asynchronos ? 0 for synch / 1 for asynch")
    s_as=int(input())
    while  s_as >1:
          s_as=int(input("enter right choice 1 or 0\n"))
    if s_as ==1:
        print("clk is posedge or negedge ? 0 for pos /1 for neg")
        pos_neg=int(input())
        while  pos_neg >1:
              pos_neg=int(input("enter right choice 1 or 0\n"))
        print("rst is posedge or negedge ? 0 for pos /1 for neg")
        pos_neg_rst=int(input())
        while  pos_neg_rst >1:
              pos_neg_rst=int(input("enter right choice 1 or 0\n"))
        if (pos_neg==1) & (pos_neg_rst==1):
            f.write("\n always@(negedge %s,negedge %s)"%(x1[0],x1[1]))
            f.write("\n begin")
            f.write("\n ")
            f.write("\n if(%s)"%x1[1])
            f.write("\n begin")
            f.write("\n ")
            f.write("\n end")
            f.write("\n else")
            f.write("\n begin")
            f.write("\n ")
            f.write("\n end")
            f.write("\n ")
            f.write("\n end")
            
        elif (pos_neg==1) & (pos_neg_rst==0):
            f.write("\n always@(negedge %s,posedge %s)"%(x1[0],x1[1]))
            f.write("\n begin")
            f.write("\n ")
            f.write("\n if(%s)"%x1[1])
            f.write("\n begin")
            f.write("\n ")
            f.write("\n end")
            f.write("\n else")
            f.write("\n begin")
            f.write("\n ")
            f.write("\n end")
            f.write("\n ")
            f.write("\n end")
        elif (pos_neg==0) & (pos_neg_rst==1):
                f.write("\n always@(posedge %s,negedge %s)"%(x1[0],x1[1]))
                f.write("\n begin")
                f.write("\n ")
                f.write("\n if(%s)"%x1[1])
                f.write("\n begin")
                f.write("\n ")
                f.write("\n end")
                f.write("\n else")
                f.write("\n begin")
                f.write("\n ")
                f.write("\n end")
                f.write("\n ")
                f.write("\n end")
        else :
                 f.write("\n always@(posedge %s,posedge %s)"%(x1[0],x1[1]))
                 f.write("\n begin")
                 f.write("\n ")
                 f.write("\n if(%s)"%(x1[1]))
                 f.write("\n begin")
                 f.write("\n ")
                 f.write("\n end")
                 f.write("\n else")
                 f.write("\n begin")
                 f.write("\n ")
                 f.write("\n end")
                 f.write("\n ")
                 f.write("\n end")
    else:
        print("clk is posedge or negedge ? 0 for pos /1 for neg")
        pos_neg=int(input())
        if pos_neg==0:
         f.write("\n always@(posedge %s)"%(x1[0]))
         f.write("\n begin")
         f.write("\n end")
        else:
            f.write("\n always@(negedge %s)"%(x1[0]))
            f.write("\n begin")
            f.write("\n end")
        
f.write("\n endmodule")    
f.close()

#################testbench#########################
g =open("C:/Users/DELL/%s_tb.v"%module_name,'w')
g.write("module %s_tb ();" %module_name)

###################parameters############################
g.write("\n////parameters")
for i in range(numberofparameters) :
     g.write("\n parameter %s = %d;" %(x[i],y[i]))
g.write("\n ")

#########################inputs_tb##########################
g.write("\n////inputs")
for i in range(len(x1)) :
       g.write("\n reg [%s-1:0] %s_tb ;" %(y1[i],x1[i]))
g.write("\n ")
       
#########################outputs_tb##########################
g.write("\n////outputs")
for i in range(numberofoutputs) :
    g.write("\n wire [%s-1:0] %s_tb ;" %(y2[i][0],x2[i]))
g.write("\n ")

#########################instantiation##########################
g.write("\n////instantiation")
g.write("\n %s #( "%module_name)

for i in range(numberofparameters) :
    if i==(numberofparameters-1) :
      g.write(".%s(%s) )" %(x[i],x[i]))
      break
    g.write(".%s(%s) ," %(x[i],x[i]))
    
g.write(" dut(")

for i in range (len(x1)):
       g.write(".%s(%s_tb) ," %(x1[i],x1[i]))
       
for i in range(numberofoutputs) :
    if i==(numberofoutputs-1) :
      g.write(".%s(%s_tb) );" %(x2[i],x2[i]))
      break
    g.write(".%s(%s_tb) ," %(x2[i],x2[i]))
g.write("\n ")
if sequential==1:
     g.write("localparam T = 20 ;")
     g.write("\n////clock generation")
     g.write("\n always")
     g.write("\n begin")
     g.write("\n clk_tb <= 0;")
     g.write("\n #T ;")
     g.write("\n clk_tb <= 1;")
     g.write("\n #T ;")
     g.write("\n end")
g.write("\n////stimulas generation")
g.write("\n ")
g.write("\n initial")
g.write("\n begin")
g.write("\n ")
g.write("\n end")     
g.write("\n ") 
g.write("\n endmodule") 
    
g.close()
