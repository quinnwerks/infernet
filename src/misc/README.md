This directory contains a lot of files, so here is a quick description of what is in each directory.

```
misc
├── conv_2_weights // Fixed-point encoded weights used in the layer Conv 2. Loaded by Conv2_Weight_Buffer.sv.
├── convert_float_file_to_fixed.py // Simple script used during development for parsing parameters into a readmemb-compatible file
├── fc_weights // Fixed-point encoded weights used in the Fully Connected layer. Loaded by FC_Weight_Buffer.sv.
├── full_nn_params // The full MNIST solver parameters, in both text files and .npz format (can be loaded by numpy)
├── MNIST_solver_tb_data // Various files used with the MNIST solver testbench.
├── README.md // The file you're reading right now :)
└── XOR_NN // A simple neural net built during development to solve XOR, used for our midterm demo and initial integration work.
```
