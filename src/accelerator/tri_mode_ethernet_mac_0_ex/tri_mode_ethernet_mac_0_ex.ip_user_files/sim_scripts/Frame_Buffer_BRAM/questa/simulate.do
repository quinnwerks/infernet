onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib Frame_Buffer_BRAM_opt

do {wave.do}

view wave
view structure
view signals

do {Frame_Buffer_BRAM.udo}

run -all

quit -force
