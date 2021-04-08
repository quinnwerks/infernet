onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib Conv_1_BRAM_opt

do {wave.do}

view wave
view structure
view signals

do {Conv_1_BRAM.udo}

run -all

quit -force
