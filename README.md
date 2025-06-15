

# 🖥️ Assembly Programs Repository

This repository showcases a variety of **x86 Assembly Language** programs — ideal for students, hobbyists, and engineers exploring **low-level programming** and **processor-level control**.

---

## 📁 Repository Structure

```
Assembly_Programs/
├── BCD to HEXA.asm
├── Basic Left and Right Shift.asm
├── Basic_Arithmetic_Operations.asm
├── DOS_BIOS.asm
├── Factorial.asm
├── minimum and maximum.asm
├── String using macro.asm
├── text color.asm
├── LICENSE
└── README.md
```

---

## 💡 Programs Overview

### 🔢 BCD to HEXA Conversion

Converts Binary Coded Decimal input into hexadecimal format using bitwise operations.

### ➡️ Basic Left and Right Shift

Demonstrates **logical** and **arithmetic shifting**, bit manipulation at the instruction level.

### ➕ Basic Arithmetic Operations

Performs basic arithmetic: addition, subtraction, multiplication, and division using registers.

### 💾 DOS\_BIOS

Uses **BIOS interrupts** to handle keyboard input/output and basic system-level tasks.

### ♾️ Factorial

Calculates the factorial of a number using iterative or recursive logic in Assembly.

### 🔻 Minimum and Maximum

Takes input of multiple numbers and finds the **smallest** and **largest** among them.

### 🧵 String Handling with Macros

Demonstrates how to declare, manipulate, and display strings using macro definitions.

### 🎨 Text Color Demo

Changes the text color in a DOS/BIOS environment using **interrupts** and **attributes**.

---

## 🛠 Requirements

* **Assembler**: `MASM`, `TASM`, or `NASM`
* **Emulator**: DOSBox (for `.asm` files using interrupts)
* **Operating System**: Windows/Linux with support for legacy execution tools

---

## 🚀 Running the Programs

```bash
# For NASM (Linux / MacOS)
nasm -f elf program.asm -o program.o
ld program.o -o program
./program

# For TASM/MASM (Windows/DOSBox)
tasm program.asm
tlink program.obj
program.exe
```

Make sure to adapt commands based on your assembler and OS.

---

## 🤝 Contributions

Want to add a new Assembly snippet or improve documentation?
Just follow these steps:

```bash
git fork https://github.com/amanantuley/Assembly_Programs.git
git checkout -b feature/new-feature
# Make your changes
git commit -m "Added new ASM program"
git push origin feature/new-feature
```

Then open a **Pull Request** and we’ll review it!

---

## 📄 License

This repository is licensed under the [MIT License](./LICENSE).

---

## 📬 Contact

* **GitHub**: [amanantuley](https://github.com/amanantuley)
* **Email**: [amanantuley@gmail.com](mailto:amanantuley@gmail.com)
* **LinkedIn**: [linkedin.com/in/amanantuley](https://linkedin.com/in/amanantuley)
