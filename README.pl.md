<!--
+++
author = "Krzysztof Borowski"
title = "8086 ASM Caesar Encryption"
date = "2023-03-06"
description = "8086 ASM project ma na celu zaimplementowanie funkcjonalności szyfrowania korzystając z algorytmu Cezara."
summary = "8086 ASM project ma na celu zaimplementowanie funkcjonalności szyfrowania korzystając z algorytmu Cezara."
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
    Zadanie na Architekturę Komputerów w ASM 8086
    <br />
  </p>
</p>

<br><br>

# O Projekcie
8086 ASM Caesar Encryption projekt ma na celu zaimplementowanie funkcjonalności szyfrowania korzystając z algorytmu Cezara. Oryginalnie było to zadanie na kurs z Architektury Komputerów na studiach informatycznych trzeciego semestru Szkoły Głównej Gospodarstwa Wiejskiego. 

[Github Repo](https://github.com/Lokinado/CheckersOnline)

<br>

## Stworzono Przy Użyciu
Frameworki i technologie warte wspomnienia.
* [DosBox](https://www.dosbox.com/)
* ASM

<br>

##  Wymagania wstępne
Emulator DosBox i kompilator NASM są wymagane aby odpalić ten 16 bitowy program.

<br>

## Budowanie i uruchamianie
1. Załaduj source.ASM do dowolnego katalogu w emulatorze DosBox. 
2. Uruchom kompilator NASM z plikiem źródłowym projektu.
```sh
nasm -o source.com -f bin source.asm
```
3. Uruchom utworzony przez kompilator plik source.com.

<br>

# Użytkowanie
Interfejs użytkownika jest stworzony z myślą o prostej obsłudze. Każda z dostępnych funkcj jest wyjaśniona w menu aplikacji.

![Image of application interface](https://raw.githubusercontent.com/Lokinado/8086-asm-caesar-encryption/main/Images/Img1.png "Interface!")

Oczekuje się od użytkownika aby podał numer operacji z której chce skorzystać, a potem aby podał argument. 

Dokładne wyjaśnienie każdej operacji:
* 1. Input text to encrypt - Operacja przyjmuje ciąg znaków dużych lub małych i dokonuje szyfrowania. Znaki specjalne nie będą szyfrowane.
* 2. Set Offset - Operacja przyjmuje wartość liczbową odpowiadająca przesunięciu liter cyklicznie w kolejności alfabetycznej.
* 3. Encrypt - Ta operacja nie przyjmuje żadnych argumentów. Jej wykonanie szyfruje tekst i zwraca wynik.
* 4. Exit - Wyjście z aplikacji.

<br>

# Ścieżka rozwoju
Nie ma zaplanowanych uaktualnień w najbliższej przyszłości.

<br>

# Licencja
Dystrybuowane pod Licencją MIT. Zobacz `LICENSE` po więcej informacji.

<br>

# Kontakt
Stworzone przez Krzysztof Borowski - krzysztofborowski02@gmail.com
<br>
Link do projektu: https://github.com/Lokinado/8086-asm-caesar-encryption
