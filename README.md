# README - Arhitectura Sistemelor de Calcul - Tema Laborator 2023

## 2 Formularea temei

Conway’s Game of Life este un zero-player game bidimensional, inventat de matematicianul John
Horton Conway in anul 1970. Scopul acestui joc este de a observa evolutia unui sistem de celule,
pornind de la o configuratie initiala, introducand reguli referitoare la moartea, respectiv crearea unei
noi celule in sistem. Acest sistem evolutiv este Turing-complete.

Starea unui sistem este descrisa de starea cumulata a celulelor componente, iar pentru acestea
avem urmatoarele reguli:

1. Subpopulare. Fiecare celula (care este in viata in generatia curenta) cu mai putin de doi
vecini in viata, moare in generatia urmatoare.
2. Continuitate celule vii. Fiecare celula (care este in viata in generatia curenta), cu doi sau
trei vecini in viata, va exista si in generatia urmatoare.
3. Ultrapopulare. Fiecare celula (care este in viata in generatia curenta), care are mai mult de
trei vecini in viata, moare in generatia urmatoare.
4. Creare. O celula moarta care are exact trei vecini in viata, va fi creata in generatia urmatoare.
5. Continuitate celule moarte. Orice alta celula moarta, care nu se incadreaza in regula de
creare, ramane o celula moarta.

Vecinii unei celule se considera urmatorii 8, intr-o matrice bidimensionala:

a00 a01 a02
a10 celula curenta a12
a20 a21 a22

Definim starea unui sistem la generatia n ca fiind o matrice Sn ∈ Mm×n({0, 1}) (m - numarul de
linii, respectiv n - numarul de coloane), unde elementul 0 reprezinta o celula moarta, respectiv 1
reprezinta o celula in viata (in generatia curenta).

Definim o k-evolutie (k ≥ 0) a sistemului o iteratie S0 → S1 → · · · → Sk, unde fiecare Si+1 se
obtine din Si, aplicand cele cinci reguli enuntate mai sus.

Observatie. Pentru celulele aflate pe prima linie, prima coloana, ultima linie, respectiv ultima
coloana, se considera extinderea la 8 vecini, prin considerarea celor care nu se afla in matrice ca
fiind celule moarte.

### Schema de criptare simetrica

Definim o cheie de criptare (pornind de la o configuratie initiala S0 si o k-evolutie) ca fiind operatia < S0, k >, care reprezinta tabloul unidimensional de
date (inteles ca sir de biti) obtinut in urma concatenarii liniilor din matrice din matricea extinsa
obtinuta, Sk.

De exemplu, pornind de la configuratia anterioara S0, si aplicand doar o 1-evolutie, se obtine
matricea extinsa S1 descrisa anterior, care va avea ca efect al aplicarii operatiei < S0, 1 > obtinerea
urmatorului tablou unidimensional (inteles ca sir de biti):

000000001000000010000000000000

### 3 Cerinte

In cadrul acestei teme aveti trei cerinte - o cerinta pentru 5p, una pentru 2.5p, respectiv o cerinta
pentru alte 2.5p.

**Important!** NU dati inputul manual la fiecare retestare a programului! Sunt inputuri lungi,
care va vor costa timp. Creati-va un fisier, de exemplu input.txt, in care scrieti inputul dorit, iar
dupa ce aveti un executabil, de exemplu task00, pe care in mod normal l-ati fi rulat cu ./task00,
rulati comanda ./task00 < input.txt. Astfel, continutul din fisier va fi redirectat la STDIN,
exact ca atunci cand ati fi introdus manual valorile. Folositi aceasta informatie si pentru a va testa
mai multe inputuri, creandu-va fisiere input0.txt, input1.txt etc., si testandu-le cu ./task00 <
input0.txt, ./task00 < input1.txt etc.

**Important!** Toate sirurile de caractere (utilizate pentru afisare) pe care le definiti in sectiunea
.data vor avea, la final, caracterul \n!

### 3.1 Cerinta 0x00 - 5p

Se citesc de la tastatura (STDIN) numarul de linii m, numarul de coloane n, numarul de celule vii
p, pozitiile celulelor vii din matrice, respectiv un numar intreg k. 
Se cere, la acest pas, afisarea la STDOUT a configuratiei sistemului dupa o k-evolutie.

### 3.2 Cerinta 0x01 - 2.5p

Se citesc de la tastatura (STDIN) numarul de linii m, numarul de coloane n, numarul de celule vii
p, pozitiile celulelor vii din matrice, un numar intreg k, un intreg o care poate fi 0 sau 1 (0 pentru
criptare, 1 pentru decriptare), respectiv un mesaj m care poate fi in clar, pentru criptare (un sir de
forma 0x..., pentru decriptare). Se cere criptarea/decriptarea mesajului primit, conform cheii care
trebuie calculate, conform specificatiilor din formularea temei.

### 3.3 Cerinta 0x02 - 2.5p

Sa se refaca, intr-un fisier sursa separat (denumit conform sectiunii 1.4.), cerinta 0x00, astfel incat
inputul sa fie citit dintr-un fisier in.txt, iar outputul sa fie scris intr-un fisier out.txt, utilizand
functii din limbajul C.

