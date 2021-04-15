# Infernet
![](doc/images/infernet.png?raw=true)

## Contributors

- [James Liu](https://github.com/diesisfox)
- [Quinn Smith](https://github.com/quinnwerks)
- [Andrew Uderian](https://github.com/auderian)

## Video
[Available on YouTube](https://youtu.be/tGFEsRELrLE)

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
    │   ├── MNIST_Solver // MNIST neural net source files.
    │   ├── rtl // Networking module source files.
    │   └── tri_mode_ethernet_mac_0_ex // The directory of the accelerator project.
    │      └── imports // Top level and Xilinx verilog files for the accelerator. 
    ├── bitstreams // Bitstreams for the various DESL machines. The folder names corresponds to the 3rd octet of the boards IP address.
    ├── lb // Load balancer files
    │   └── project // Load balancer Vivado project
    │       ├── project.sdk // Load balancer Vivado SDK workspace
    │       │   ├── nortos_udp_lb // Load balancer Vivado SDK project
    │       │   ├── nortos_udp_lb_bsp // generated board support package for the Load balancer project
    │       │   └── design_1_wrapper_hw_platform_0 // generated hardware description for the Load balancer project
    │       └── * // other components of the Load balancer Vivado project
    ├── misc // MNIST solver weights, biases, and testbench test data. Also contains the XOR neural net used during development of this project.
    ├── python // Python client source code.
    │   ├── networking532.py // common utilities and constants shared by most of our python code
    │   ├── client.py // module implementing client functionality
    │   ├── lb.py // module modelling LB functionality
    │   ├── gui.py // prototype GUI
    │   ├── gui_v2.py // final GUI as seen in demo
    │   ├── btn/ and num/ // GUI assets
    │   └── RUNME.bat // double click to run UI
    └── util // Generic RTL. Used only in the tri_mode_ethernet_mac_0_ex project.
```

## How to Use
### Prerequisites
#### In General
- An ethernet LAN configured the same way as the social distancing setup in Winter 2020-2021, with Nexys DDR boards in address range `1.1.1.2` to `1.1.12.2` with MAC addresses `00:0a:35:00:00:01` to `00:0a:35:00:00:12`, and Windows workstations in IP address range `1.1.x.1`.
#### Accelerator and Load Balancer
- Vivado 2018.3.1
- Vivado SDK 2018.3.1
- Xilinx licences that might not be included in your Vivado install:
  - Tri Mode Ethernet Mac
  - AXI Ethernet Lite
- In the case of the accelerator, the ethernet switch the accelerator board is plugged in to must already have cached the correct MAC/IP tuple for the board
#### The client
- Python ≥3.7.2
- Appropriate Pip version for the Python above

### Bring Up Procedure
1. Setup the accelerator
    1. Open the project in `src/accelerator/tri_mode_ethernet_mac_0_ex`.
    2. In `Conv2_Weight_Buffer.sv` and `FC_Weight_Buffer.sv` change the weight file paths to match your local copy of the Git repo.
    3. In `accelerator.sv` set the `OUR_MAC_ADDRESS`, `OUR_IP_ADDRESS` to the appropriate values based on your networking setup.
    4. Compile the `accelerator.sv` through to bitstream generation. Insert debug logic after synthesis.
        * Note: the design is marginal with regards to timing closure. If timing fails, don't panic, and try again with a different high-effort Implementation strategy.
    5. Use the Vivado hardware manager to load the bitstream and the `debug_nets.ltx` file onto the board.
    6. Open a dashboard for the vios. Toggle the signal `glbl_reset` from 1 to 0.
    7. To test that the accelerator send a request using the CLI Client (See )
    8. Perform steps `1.i` to `1.vi` for as many accelerators as you want to have running.
2. Setup the load balancer
    1. Open the project in `src/lb/project/project.sdk/`
        * Note: it is recommended to use Vivado SDK to directly open the folder as an Eclipse workspace. Going through the Vivado project at `src/lb/project/` first can lead to unwanted updates to the hardware description used by the SDK.
        * Note: the eclipse projects of interest are `nortos_udp_lb`, `nortos_udp_lb_bsp`, and `design_1_wrapper_hw_platform_0`.
    2. In eclipse project `nortos_udp_lb`, edit the define in `src/echo.h` line `26` to be the board number of the board the lb will be programmed on to.
    3. Build `nortos_udp_lb`
    4. Double check that the run configuration has both "Program FPGA" enabled and the right binary selected.
        * Note: if Vivado SDK loses the run configuration somehow, just make a new one. There's nothing special in the one we used.
    5. Run the run configuration. The LB will scan for FPGAs on the network upon startup, so make sure it is brought up after the IAs.
    6. You are done! The LB prints out diag messages to the SDK terminal at 9600 baud.


### Running The client
The client can be run in two ways:
#### GUI Mode
1. Try this first:
   1. Navigate to `src/python`.
   2. Double click `RUNME.bat`.
       * Note: I promise it's not a virus, I just wanted the name to stand out in this busy folder. Feel free to read over the script in your editor, it's not long.
   3. Wait for it to automatically set up your Python environment correctly.
   4. If the GUI shows up, you're done! Go to [§Using the GUI](#using-the-gui).
2. If you're here, the batch file did not work or you're not on Windows. Try the following steps:
   1. Perform [§CLI Mode](#cli-mode) steps `1` through `3` as listed in the section below.
       * Note: note the note in [§CLI Mode](#cli-mode) step 3.
   2. `pipenv run python gui_v2.py`
   3. If the GUI shows up, you're done! Go to [§Using the GUI](#using-the-gui).
3.  If you're here, the GUI has failed for reasons I did not anticipate in this document. If you are familiar with the tools, feel free to debug it yourself, else go to [§CLI Mode](#cli-mode) for a more pared down but still functional experience.
#### CLI Mode
1. Open up a terminal and cd to `src/python`.
2. `pip install pipenv`
3. `pipenv install`
    * Note: if `pipenv install` is broken, just run the code as described and install missing packages the code complains about using `pipenv run pip install <missing_module>` as you go.
4. Invoke `pipenv run python client.py ia <IA IP addr> <image file>` to send an inference request to the specified accelerator with the specified input image, print the result, and exit.

### Using the GUI
1. Upon startup, the UI will automatically detect the correct network interface and scan for the LB on that interface. If LB acquisition was successful, it will automatically request an IA from the LB.
   * Note: Upon startup, if none of your accessible network interfaces are hooked up to a LAN as described in the [§prerequistes](#in-general), there will be a dialogue in the command prompt from which you launched the GUI, asking you to specify your desired network interface.
       * Note note: even after you specify that interface, the whole thing is unlikely to work because of what addresses the application logic expects the LB to have.
   * Note: LB and IA acquisition can also be semi-automatically done via the buttons, or manually done via the entry fields.
     * Before you read all the below points, this is just listed for clarification in case of confusion, but it should all be pretty intuitive from the start.
     * The LB Address field can be freely edited before an IA has been requested
     * The LB Address field cannot be edited after IA acquisition until the IA is returned.
     * The IA Address field can be freely edited before an IA has been requested
     * The IA Address field cannot be edited after IA acquisition until the IA is returned.
     * The IA Request button is disabled until a valid IP address on the LAN is in the LB Address field.
     * The IA Request button turns into the IA Return button on IA acquisition
     * The START button is disabled until until a valid IP address on the LAN is in the IA Address field.
2. Press the Browse button in section 1 of the UI and browse for a folder with input images.
   * Note: They all need to be at the root of the folder, but do not have to all be greyscale and 28x28px. The UI will automatically squash and process the images for you.
3. Press the START button to start the batch inference job.
4. As the inference runs, statuses will start to populate the piecemap. Yellow means correct, red means incorrect, and black means timeout. You can hover over each piece to see the input image and output classification of that particular inference. Even before the inference starts, you can mouse over to preview the inputs.
5. As the inference runs, the stats in section 3 of the UI will also procedurally populate.
6. Let the batch finish, or press STOP to stop it at any time. After stopping, the job needs to be restarted from the first input.
7. After you are done inspecting the results, load in another dataset per step 2, and repeat!
