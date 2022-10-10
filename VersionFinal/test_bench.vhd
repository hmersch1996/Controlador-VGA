--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:40:49 06/14/2021
-- Design Name:   
-- Module Name:   C:/Users/Hans-PC/Desktop/VersionFinal/test_bench.vhd
-- Project Name:  VersionFinal
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Driver_VGA
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_bench IS
END test_bench;
 
ARCHITECTURE behavior OF test_bench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Driver_VGA
    PORT(
         CLK : IN  std_logic;
         REINICIO : IN  std_logic;
         HSYNC : OUT  std_logic;
         VSYNC : OUT  std_logic;
         SELECTOR : IN  std_logic;
         Red : OUT  std_logic_vector(2 downto 0);
         Green : OUT  std_logic_vector(2 downto 0);
         Blue : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal REINICIO : std_logic := '0';
   signal SELECTOR : std_logic := '0';

 	--Outputs
   signal HSYNC : std_logic;
   signal VSYNC : std_logic;
   signal Red : std_logic_vector(2 downto 0);
   signal Green : std_logic_vector(2 downto 0);
   signal Blue : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: Driver_VGA PORT MAP (
          CLK => CLK,
          REINICIO => REINICIO,
          HSYNC => HSYNC,
          VSYNC => VSYNC,
          SELECTOR => SELECTOR,
          Red => Red,
          Green => Green,
          Blue => Blue
        );
   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		REINICIO <='0';
		SELECTOR <='0';
		
		wait for 100 ns;	
		REINICIO <='0';
		SELECTOR <='1';
		
		wait for 100 ns;	
		REINICIO <='1';
		SELECTOR <='0';
		
		wait for 100 ns;	
		REINICIO <='1';
		SELECTOR <='1';
      -- insert stimulus here 

      wait;
   end process;

END;
