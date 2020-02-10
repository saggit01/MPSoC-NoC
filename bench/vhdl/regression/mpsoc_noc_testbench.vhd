-- Converted from bench/verilog/regression/mpsoc_noc_testbench.sv
-- by verilog2vhdl - QueenField

--//////////////////////////////////////////////////////////////////////////////
--                                            __ _      _     _               //
--                                           / _(_)    | |   | |              //
--                __ _ _   _  ___  ___ _ __ | |_ _  ___| | __| |              //
--               / _` | | | |/ _ \/ _ \ '_ \|  _| |/ _ \ |/ _` |              //
--              | (_| | |_| |  __/  __/ | | | | | |  __/ | (_| |              //
--               \__, |\__,_|\___|\___|_| |_|_| |_|\___|_|\__,_|              //
--                  | |                                                       //
--                  |_|                                                       //
--                                                                            //
--                                                                            //
--              MPSoC-RISCV CPU                                               //
--              Network on Chip                                               //
--              AMBA3 AHB-Lite Bus Interface                                  //
--              WishBone Bus Interface                                        //
--                                                                            //
--//////////////////////////////////////////////////////////////////////////////

-- Copyright (c) 2018-2019 by the author(s)
-- *
-- * Permission is hereby granted, free of charge, to any person obtaining a copy
-- * of this software and associated documentation files (the "Software"), to deal
-- * in the Software without restriction, including without limitation the rights
-- * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- * copies of the Software, and to permit persons to whom the Software is
-- * furnished to do so, subject to the following conditions:
-- *
-- * The above copyright notice and this permission notice shall be included in
-- * all copies or substantial portions of the Software.
-- *
-- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- * THE SOFTWARE.
-- *
-- * =============================================================================
-- * Author(s):
-- *   Francisco Javier Reina Campo <frareicam@gmail.com>
-- */

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.mpsoc_noc_pkg.all;

entity mpsoc_noc_testbench is
end mpsoc_noc_testbench;

architecture RTL of mpsoc_noc_testbench is
  component mpsoc_noc_mesh
    generic (
      FLIT_WIDTH       : integer := 34;
      VCHANNELS        : integer := 7;
      CHANNELS         : integer := 7;
      OUTPUTS          : integer := 7;
      ENABLE_VCHANNELS : integer := 1;
      X                : integer := 2;
      Y                : integer := 2;
      Z                : integer := 2;
      NODES            : integer := 8;
      BUFFER_SIZE_IN   : integer := 4;
      BUFFER_SIZE_OUT  : integer := 4
    );
    port (
      clk : in std_logic;
      rst : in std_logic;

      in_flit  : in  M_NODES_CHANNELS_FLIT_WIDTH;
      in_last  : in  M_NODES_CHANNELS;
      in_valid : in  M_NODES_CHANNELS;
      in_ready : out M_NODES_CHANNELS;

      out_flit  : out M_NODES_CHANNELS_FLIT_WIDTH;
      out_last  : out M_NODES_CHANNELS;
      out_valid : out M_NODES_CHANNELS;
      out_ready : in  M_NODES_CHANNELS
    );
  end component;

  --////////////////////////////////////////////////////////////////
  --
  -- Constants
  --
  constant FLIT_WIDTH       : integer := 34;
  constant VCHANNELS        : integer := 7;
  constant CHANNELS         : integer := 7;
  constant OUTPUTS          : integer := 7;
  constant ENABLE_VCHANNELS : integer := 1;
  constant X                : integer := 2;
  constant Y                : integer := 2;
  constant Z                : integer := 2;
  constant NODES            : integer := 8;
  constant BUFFER_SIZE_IN   : integer := 4;
  constant BUFFER_SIZE_OUT  : integer := 4;

  --////////////////////////////////////////////////////////////////
  --
  -- Variables
  --
  signal clk : std_logic;
  signal rst : std_logic;

  signal mpsoc_noc_out_flit  : M_NODES_CHANNELS_FLIT_WIDTH;
  signal mpsoc_noc_out_last  : M_NODES_CHANNELS;
  signal mpsoc_noc_out_valid : M_NODES_CHANNELS;
  signal mpsoc_noc_out_ready : M_NODES_CHANNELS;

  signal mpsoc_noc_in_flit  : M_NODES_CHANNELS_FLIT_WIDTH;
  signal mpsoc_noc_in_last  : M_NODES_CHANNELS;
  signal mpsoc_noc_in_valid : M_NODES_CHANNELS;
  signal mpsoc_noc_in_ready : M_NODES_CHANNELS;

begin
  --////////////////////////////////////////////////////////////////
  --
  -- Module Body
  --

  --DUT
  u_mesh : mpsoc_noc_mesh
  generic map (
    FLIT_WIDTH       => FLIT_WIDTH,
    VCHANNELS        => VCHANNELS,
    CHANNELS         => CHANNELS,
    OUTPUTS          => OUTPUTS,
    ENABLE_VCHANNELS => ENABLE_VCHANNELS,
    X                => X,
    Y                => Y,
    Z                => Z,
    NODES            => NODES,
    BUFFER_SIZE_IN   => BUFFER_SIZE_IN,
    BUFFER_SIZE_OUT  => BUFFER_SIZE_OUT
  )
  port map (
    rst => rst,
    clk => clk,

    in_flit  => mpsoc_noc_in_flit,
    in_last  => mpsoc_noc_in_last,
    in_valid => mpsoc_noc_in_valid,
    in_ready => mpsoc_noc_in_ready,

    out_flit  => mpsoc_noc_out_flit,
    out_last  => mpsoc_noc_out_last,
    out_valid => mpsoc_noc_out_valid,
    out_ready => mpsoc_noc_out_ready
  );
end RTL;