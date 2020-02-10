# NoC-MPSoC WIKI

A Network on Chip (NoC) is a network based communications subsystem on an Integrated Circuit (IC), between modules in a System on a Chip (SoC). The modules on the IC are IP cores schematizing functions of the system, and are designed to be modular in the sense of network science. A NoC is a router based packet switching network between SoC modules.


## Instruction INPUTS/OUTPUTS AMBA3 AHB-Lite Bus

| Port         |  Size  | Direction | Description                                           |
| -------------| ------ | --------- | ----------------------------------------------------- |
| `HRESETn`    |    1   |   Input   | Asynchronous active low reset                         |
| `HCLK`       |    1   |   Input   | System clock input                                    |
|              |        |           |                                                       |
| `IHSEL`      |    1   |   Output  | Provided for AHB-Lite compatibility – tied high ('1') |
| `IHADDR`     | `PLEN` |   Output  | Instruction address                                   |
| `IHRDATA`    | `XLEN` |   Input   | Instruction read data                                 |
| `IHWDATA`    | `XLEN` |   Output  | Instruction write data                                |
| `IHWRITE`    |    1   |   Output  | Instruction write                                     |
| `IHSIZE`     |    3   |   Output  | Transfer size                                         |
| `IHBURST`    |    3   |   Output  | Transfer burst size                                   |
| `IHPROT`     |    4   |   Output  | Transfer protection level                             |
| `IHTRANS`    |    2   |   Output  | Transfer type                                         |
| `IHMASTLOCK` |    1   |   Output  | Transfer master lock                                  |
| `IHREADY`    |    1   |   Input   | Slave Ready Indicator                                 |
| `IHRESP`     |    1   |   Input   | Instruction Transfer Response                         |


## Instruction INPUTS/OUTPUTS Wishbone Bus

| Port    |  Size  | Direction | Description                     |
| --------| ------ | --------- | ------------------------------- |
| `rst`   |    1   |   Input   | Synchronous, active high        |
| `clk`   |    1   |   Input   | Master clock                    |
|         |        |           |                                 |
| `iadr`  | `PLEN` |   Input   | Lower address bits              |
| `idati` | `XLEN` |   Input   | Data towards the core           |
| `idato` | `XLEN` |   Output  | Data from the core              |
| `isel`  |    4   |   Input   | Byte select signals             |
| `iwe`   |    1   |   Input   | Write enable input              |
| `istb`  |    1   |   Input   | Strobe signal/Core select input |
| `icyc`  |    1   |   Input   | Valid bus cycle input           |
| `iack`  |    1   |   Output  | Bus cycle acknowledge output    |
| `ierr`  |    1   |   Output  | Bus cycle error output          |
| `iint`  |    1   |   Output  | Interrupt signal output         |


## Data INPUTS/OUTPUTS AMBA3 AHB-Lite Bus

| Port         |  Size  | Direction | Description                                           |
| -------------| ------ | --------- | ----------------------------------------------------- |
| `HRESETn`    |    1   |   Input   | Asynchronous active low reset                         |
| `HCLK`       |    1   |   Input   | System clock input                                    |
|              |        |           |                                                       |
| `DHSEL`      |    1   |   Output  | Provided for AHB-Lite compatibility – tied high ('1') |
| `DHADDR`     | `PLEN` |   Output  | Data address                                          |
| `DHRDATA`    | `XLEN` |   Input   | Data read data                                        |
| `DHWDATA`    | `XLEN` |   Output  | Data write data                                       |
| `DHWRITE`    |    1   |   Output  | Data write                                            |
| `DHSIZE`     |    3   |   Output  | Transfer size                                         |
| `DHBURST`    |    3   |   Output  | Transfer burst size                                   |
| `DHPROT`     |    4   |   Output  | Transfer protection level                             |
| `DHTRANS`    |    2   |   Output  | Transfer type                                         |
| `DHMASTLOCK` |    1   |   Output  | Transfer master lock                                  |
| `DHREADY`    |    1   |   Input   | Slave Ready Indicator                                 |
| `DHRESP`     |    1   |   Input   | Data Transfer Response                                |


## Data INPUTS/OUTPUTS Wishbone Bus

| Port    |  Size  | Direction | Description                     |
| --------| ------ | --------- | ------------------------------- |
| `rst`   |    1   |   Input   | Synchronous, active high        |
| `clk`   |    1   |   Input   | Master clock                    |
|         |        |           |                                 |
| `dadr`  | `PLEN` |   Input   | Lower address bits              |
| `ddati` | `XLEN` |   Input   | Data towards the core           |
| `ddato` | `XLEN` |   Output  | Data from the core              |
| `dsel`  |    4   |   Input   | Byte select signals             |
| `dwe`   |    1   |   Input   | Write enable input              |
| `dstb`  |    1   |   Input   | Strobe signal/Core select input |
| `dcyc`  |    1   |   Input   | Valid bus cycle input           |
| `dack`  |    1   |   Output  | Bus cycle acknowledge output    |
| `derr`  |    1   |   Output  | Bus cycle error output          |
| `dint`  |    1   |   Output  | Interrupt signal output         |                                |


## Data INPUTS/OUTPUTS Wishbone Bus

|Language              | files | blank | comment | code |
| ---------------------| ----- | ----- | ------- | ---- |
|VHDL                  |    13 |   332 |     835 | 1602 |
|Verilog-SystemVerilog |    12 |   215 |     784 | 1027 |


## Hardware Description Language

noc
├── bench
│   ├── verilog
│   │   └── regression
│   │       └── mpsoc_noc_testbench.sv
│   └── vhdl
│       └── regression
│           └── mpsoc_noc_testbench.vhd
├── doc
│   └── WIKI-NoC-MPSoC.md
├── rtl
│   ├── verilog
│   │   ├── core
│   │   │   ├── mpsoc_noc_arb_rr.sv
│   │   │   ├── mpsoc_noc_buffer.sv
│   │   │   ├── mpsoc_noc_demux.sv
│   │   │   ├── mpsoc_noc_mux.sv
│   │   │   └── mpsoc_noc_vchannel_mux.sv
│   │   ├── router
│   │   │   ├── mpsoc_noc_router_input.sv
│   │   │   ├── mpsoc_noc_router_lookup_slice.sv
│   │   │   ├── mpsoc_noc_router_lookup.sv
│   │   │   ├── mpsoc_noc_router_output.sv
│   │   │   └── mpsoc_noc_router.sv
│   │   └── topology
│   │       └── mpsoc_noc_mesh.sv
│   └── vhdl
│       ├── core
│       │   ├── mpsoc_noc_arb_rr.vhd
│       │   ├── mpsoc_noc_buffer.vhd
│       │   ├── mpsoc_noc_demux.vhd
│       │   ├── mpsoc_noc_mux.vhd
│       │   └── mpsoc_noc_vchannel_mux.vhd
│       ├── pkg
│       │   └── mpsoc_noc_pkg.vhd
│       ├── router
│       │   ├── mpsoc_noc_router_input.vhd
│       │   ├── mpsoc_noc_router_lookup_slice.vhd
│       │   ├── mpsoc_noc_router_lookup.vhd
│       │   ├── mpsoc_noc_router_output.vhd
│       │   └── mpsoc_noc_router.vhd
│       └── topology
│           └── mpsoc_noc_mesh.vhd
├── sim
│   ├── mixed
│   │   └── regression
│   │       └── bin
│   │           ├── Makefile
│   │           ├── mpsoc_noc_verilog.vc
│   │           ├── mpsoc_noc_vhdl.vc
│   │           ├── run.do
│   │           └── transcript
│   ├── verilog
│   │   └── regression
│   │       └── bin
│   │           ├── Makefile
│   │           ├── mpsoc_noc.vc
│   │           ├── run.do
│   │           └── transcript
│   └── vhdl
│       └── regression
│           └── bin
│               ├── Makefile
│               ├── mpsoc_noc.vc
│               ├── run.do
│               └── transcript
├── system.vtor
├── system.qf
├── system.ys
├── README.md
├── CLEAN-IT
├── DELETE-IT
├── EXECUTE-IT
├── SIMULATE-MIXED-MS-IT
├── SIMULATE-VHDL-GHDL-IT
├── SIMULATE-VHDL-MS-IT
├── SIMULATE-VLOG-IV-IT
├── SIMULATE-VLOG-MS-IT
├── SIMULATE-VLOG-VTOR-NoC-IT
├── SYNTHESIZE-VLOG-YS-IT
├── TRANSLATE-IT
└── UPLOAD-IT