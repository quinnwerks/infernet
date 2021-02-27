onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+accelerator_controls -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.accelerator_controls xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {accelerator_controls.udo}

run -all

endsim

quit -force
