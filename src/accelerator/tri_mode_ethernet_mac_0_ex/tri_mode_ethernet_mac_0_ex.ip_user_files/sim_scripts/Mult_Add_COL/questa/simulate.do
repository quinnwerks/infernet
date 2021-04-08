onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib Mult_Add_COL_opt

do {wave.do}

view wave
view structure
view signals

do {Mult_Add_COL.udo}

run -all

quit -force
