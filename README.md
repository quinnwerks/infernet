# Infernet
![](doc/images/infernet.png?raw=true)
## Contributors

- [James Liu](https://github.com/diesisfox)
- [Quinn Smith](https://github.com/quinnwerks)
- [Andrew Uderian](https://github.com/auderian)

## Project Description

Infernet is a MNIST inference accelerator service. The system is composed of 3 major modules:
- A hardware inference accelerator implemented on an FPGA
- A load balancer implemented using a soft processor on an FPGA
- A GUI client written in python for use on conventional computers
![](doc/images/system_diagram.jpg?raw=true)

## Directory Structure

```
infernet
├── doc // Project documentation
│   ├── images // Images used in the README
│   ├── reports // The reports written throughout the course
│   └── slides // Slideware that was presented throughout the course
├── README.md // What you're reading right now.
└── src // The project source files
    ├── accelerator // Accelerator source and Vivado project.
    │   ├── MNIST_Solver // MNIST neural net source files
    │   ├── rtl // Networking module source files
    │   └── tri_mode_ethernet_mac_0_ex // Top level and Xilinx source files. The directory of the accelerator project.
    ├── bitstreams // Bitstreams for the various DESL machines. The folder names corresponds to the 3rd octet of the boards IP address.
    ├── lb // Load balancer project and source files
    ├── misc // Various files used to configure neural net
    ├── python // Python client source code.
    └── util // Generic RTL. Used only in the tri_mode_ethernet_mac_0_ex project.
```

## How to Use
### Prerequisites
#### Accelerator and Load Balancer
- A correctly configured router (the address of the accelerator board must be the same as the one cached by the router)
- Vivado 2018.3.1
- Vivado SDK 2018.3.1
- Xilinx licences that might not be included in your Vivado install:
  - Tri Mode Ethernet Mac
  - AXI Ethernet Lite
#### The client
- Python 3.x.x (<-- fixme)

### Bring Up Procedure
1. Setup the accelerator
    1. Open the project in `src/accelerator/tri_mode_ethernet_mac_0_ex`.
    2. TODO: Fix neural net paths 
    3. In `accelerator.sv` set the `OUR_MAC_ADDRESS`, `OUR_IP_ADDRESS` to the appropriate values based on your networking setup.
    4. Compile the `accelerator.sv` through to bitstream generation. Insert debug logic after synthesis.
    5. Use the Vivado hardware manager to load the bitstream and the `debug_nets.ltx` file onto the board.
    6. Open a dashboard for the vios. Toggle the signal `glbl_reset` from 1 to 0.
    7. To test that the accelerator send a request using the CLI Client (See )
    8. Perform steps `1.i` to `1.vi` for as many accelerators as you want to have running.
2. Setup the load balancer
### Running The client
The client can be run in two ways:
#### GUI Mode
#### CLI Mode



