onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib Conv_2_Weight_Buf_opt

do {wave.do}

view wave
view structure
view signals

do {Conv_2_Weight_Buf.udo}

run -all

quit -force
