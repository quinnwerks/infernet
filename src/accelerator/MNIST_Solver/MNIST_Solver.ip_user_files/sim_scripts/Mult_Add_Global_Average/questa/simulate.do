onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib Mult_Add_Global_Average_opt

do {wave.do}

view wave
view structure
view signals

do {Mult_Add_Global_Average.udo}

run -all

quit -force
