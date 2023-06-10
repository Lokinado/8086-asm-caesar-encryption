<!--
+++
author = "Krzysztof Borowski"
title = "8086 ASM Caesar Encryption"
date = "2023-03-06"
description = "8086 ASM project that aims to provide encrypt functionality using caesar encryption."
summary = "8086 ASM project that aims to provide encrypt functionality using caesar encryption."
draft="false"
tags = [
    "asm", 
    "computer architecture",
]
categories = [
    "assignments",
]
+++
-->


<p align="center">
    <h1 align="center" style="border-bottom: none; margin-bottom: 0">
        <strong>
            8086 ASM Caesar Encryption
        </strong>
    </h1>

  <p align="center">
    Architecture of Computers assignment in 8086 ASM
    <br />
  </p>
</p>

<br><br>

# About The Project
8086 ASM project that aims to provide encrypt functionality using caesar encryption. Originally this was an assignment for architecture of computers course at Warsaw University of Life Sciences. 

Have Fun! 😄

<br>

## Build With
The most noteworthy frameworks and technologies.
* [DosBox](https://www.dosbox.com/)
* ASM

<br>

## Prerequisites
DosBox emulator and NASM compiler is required to run 16bit programs.

<br>

## Build & Run
1. Place source.ASM file in any DosBox directory. 
2. Run NASM compiler with source code file.
```sh
nasm -o source.com -f bin source.asm
```
3. Run source.com application.

<br>

# Usage
The UI is self explainatory. Every single operation is explained on the menu of the application.

![Image of application interface](https://raw.githubusercontent.com/Lokinado/8086-asm-caesar-encryption/main/Images/Img1.png "Interface!")

User is expected to input a number of operation and then afterwards input the operation argument.

Detailed explanation of every operation:
* 1. Input text to encrypt - User is expected to input a string of letters no matter big or small. Specials characters will not be encrypted.
* 2. Set Offset - User is expected to input a whole number.
* 3. Encrypt - This operation does not use any arguments. Runs main functionality.
* 4. Exit - Ends execution of application.

<br>

# Roadmap
No updates are planned in the near future.

<br>

# Licence
Distributed under the MIT License. See `LICENSE` for more information.

<br>

# Contact
Made with love by Krzysztof Borowski - krzysztofborowski02@gmail.com
<br>
Project Link: https://github.com/Lokinado/8086-asm-caesar-encryption
