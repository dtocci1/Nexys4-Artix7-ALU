# Nexys 4 DDR Artix-7 ALU
Physical ALU developed for Nexys 4 DDR Artix-7 board

## Features
* 8-bit binary operations including:
	* Addition
	* Subtraction
	* Multiplication
	* Division
* User input from 16 switches on board
* ALU OPCODE generation through 5 buttons on board
* User input and resultant displayed on 7-segment display
## ALU Operations
### ALU Addition
![Image of ALU Addition](https://i.imgur.com/jTu4KGt.jpg)\
0x08 + 0x02 = 0x000A

### ALU Subtraction
![Image of ALU Subtraction](https://i.imgur.com/6IDk9kD.jpg)\
0x08 - 0x02 = 0x0006

### ALU Multiplication
![Image of ALU Multiplication](https://i.imgur.com/OjtCYxJ.jpg)\
0x08 * 0x02 = 0x0010

### ALU Division
![Image of ALU Division](https://i.imgur.com/R87ep5e.jpg)\
0x08 / 0x02 = 0x0004

### ALU Modulation
![Image of ALU Modulation](https://i.imgur.com/CixGoaa.jpg)\
0x3c % 0x018 = 0x000C

## RTL Schematic
![Image of RTL Schematic for ALU](https://i.imgur.com/5pscpKk.png)

## Known Issues
* Subtraction of a larger number from a smaller one results in an overflow
* Division automatically floors the resultant

## Future Plan
* Add in exponential operations
* Add in trigonometric functions
* Add in logarithmic functions
* Add support for signed numbers
* Possibly add decimals for division
* Add reset line in case of errors
