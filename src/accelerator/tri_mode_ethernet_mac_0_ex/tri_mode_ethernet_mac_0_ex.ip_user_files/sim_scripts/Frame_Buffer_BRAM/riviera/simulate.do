onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+Frame_Buffer_BRAM -L xil_defaultlib -L xpm -L blk_mem_gen_v8_4_2 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.Frame_Buffer_BRAM xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {Frame_Buffer_BRAM.udo}

run -all

endsim

quit -force
