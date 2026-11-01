program UrutNilaiUAS;
uses crt;

const
    maks = 10;

var
    nilai : array[1..maks] of integer;
    n, i, j, k, kode, x, temp : integer;
    s : string;
    valid, tukar : boolean;

begin
    clrscr;
    writeln('=== PROGRAM URUT NILAI UAS ===');
    writeln;

  // jumlah mahasiswa: hanya karakter 0-9 yang diterima, lalu dicek rentangnya
    repeat
    write('Masukkan jumlah mahasiswa (1-10): ');
    readln(s);
    valid := length(s) > 0;
    for k := 1 to length(s) do
        if not (s[k] in ['0'..'9']) then
        valid := false;
    if valid then
    begin
        val(s, n, kode);
        valid := (kode = 0) and (n >= 1) and (n <= maks);
    end;
    if not valid then
        writeln('Input tidak valid! Masukkan bilangan bulat 1 sampai 10.');
    until valid;

  // nilai UAS: bilangan bulat 0-100
    for i := 1 to n do
    begin
    repeat
        write('Masukkan nilai UAS mahasiswa ke-', i, ': ');
        readln(s);
        valid := length(s) > 0;
        for k := 1 to length(s) do
        if not (s[k] in ['0'..'9']) then
            valid := false;
        if valid then
        begin
        val(s, x, kode);
        valid := (kode = 0) and (x >= 0) and (x <= 100);
        end;
        if not valid then
        writeln('Input tidak valid! Masukkan bilangan bulat 0 sampai 100.');
    until valid;
    nilai[i] := x;
    end;

    writeln;
    writeln('Nilai sebelum diurutkan:');
    for i := 1 to n do
    writeln(i:2, '. ', nilai[i]);

  // bubble sort ascending, berhenti lebih awal jika sudah terurut
    i := 1;
    repeat
    tukar := false;
    for j := 1 to n - i do
        if nilai[j] > nilai[j + 1] then
        begin
        temp := nilai[j];
        nilai[j] := nilai[j + 1];
        nilai[j + 1] := temp;
        tukar := true;
        end;
    i := i + 1;
    until (not tukar) or (i > n - 1);

    writeln;
    writeln('Nilai setelah diurutkan (terendah ke tertinggi):');
    for i := 1 to n do
    writeln(i:2, '. ', nilai[i]);

    writeln;
    write('Tekan Enter untuk keluar...');
    readln;
end.