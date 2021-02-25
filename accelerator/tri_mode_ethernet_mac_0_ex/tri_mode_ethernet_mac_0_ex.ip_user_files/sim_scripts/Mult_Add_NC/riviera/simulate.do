onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+Mult_Add_NC -L xil_defaultlib -L xpm -L xbip_utils_v3_0_9 -L xbip_pipe_v3_0_5 -L xbip_bram18k_v3_0_5 -L mult_gen_v12_0_14 -L xbip_dsp48_wrapper_v3_0_4 -L xbip_dsp48_addsub_v3_0_5 -L xbip_dsp48_multadd_v3_0_5 -L xbip_multadd_v3_0_13 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.Mult_Add_NC xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {Mult_Add_NC.udo}

run -all

endsim

quit -force
