# Infernet
## Contributors

- [James Liu](https://github.com/diesisfox)
- [Quinn Smith](https://github.com/quinnwerks)
- [Andrew Uderian](https://github.com/auderian)

## Project Description

Infernet is a MNIST inference accelerator service. The system is composed of 3 major modules:
- A hardware inference accelerator implemented on an FPGA
- A load balancer implemented using a soft processor on an FPGA
- A GUI client written in python for use on conventional computers

## How to Use
### Prerequisites
#### Accelerator and Load Balancer
- A correctly configured router (the address of the accelerator board must be the same as the one cached by the router)
- Vivado 2018.3.1
- Vivado SDK 2018.3.1
- Xilinx licences that are not included:
  - Tri Mode Ethernet Mac
  - AXI Ethernet Lite
#### The client
- Python 3.x.x (<-- fixme)

### Bring Up Procedure
1. Setup the accelerator
    1. Open the `tri_mode_ethernet_mac` project
    2. In `accelerator.sv` set the `OUR_MAC_ADDRESS`, `OUR_IP_ADDRESS` to the appropriate values based on your networking setup.
    3. Compile the `accelerator.sv` through to bitstream generation. Insert debug logic after synthesis.
    4. Use the Vivado hardware manager to load the bitstream and the `debug_nets.ltx` file onto the board.
    5. Open a dashboard for the vios. Toggle the signal `glbl_reset` from 1 to 0.
2. Setup the load balancer
3. Run the client
    * GUI Mode: ``
    * CLI Mode: ``



