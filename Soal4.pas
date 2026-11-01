program KelulusanMahasiswa;
uses crt;

const
    maks       = 5;
    komponen   = 4;
    batasLulus = 70;
    nama : array[1..komponen] of string = ('Tugas', 'Kuis', 'UTS', 'UAS');

var
    nilai : array[1..maks, 1..komponen] of integer;
    rata : array[1..maks] of real;
    n, i, j, k, kode, x, jumlah : integer;
    s : string;
    valid : boolean;

begin
    clrscr;
    writeln('=== PROGRAM KELULUSAN MAHASISWA ===');
    writeln;

  // jumlah mahasiswa: hanya karakter 0-9 yang diterima, lalu dicek rentangnya
    repeat
    write('Masukkan jumlah mahasiswa (1-5): ');
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
        writeln('Input tidak valid! Masukkan bilangan bulat 1 sampai 5.');
    until valid;

  // nilai tugas, kuis, UTS, dan UAS tiap mahasiswa: bilangan bulat 0-100
    for i := 1 to n do
    begin
    writeln;
    writeln('Masukkan nilai-nilai mahasiswa ke-', i, ':');
    for j := 1 to komponen do
    begin
        repeat
        write('  Nilai ', nama[j], ' (0-100): ');
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
            writeln('  Input tidak valid! Masukkan bilangan bulat 0 sampai 100.');
        until valid;
        nilai[i, j] := x;
    end;
    end;

  // rata-rata tiap mahasiswa (hasilnya selalu kelipatan 0.25 sehingga tepat di tipe real)
    for i := 1 to n do
    begin
    jumlah := 0;
    for j := 1 to komponen do
        jumlah := jumlah + nilai[i, j];
    rata[i] := jumlah / komponen;
    end;

    writeln;
    writeln('No  Tugas  Kuis   UTS   UAS  Rata-rata  Keterangan');
    writeln('--------------------------------------------------');
    for i := 1 to n do
    begin
    write(i:2, '  ', nilai[i, 1]:5, nilai[i, 2]:6, nilai[i, 3]:6, nilai[i, 4]:6,
            rata[i]:11:2, '  ');
    if rata[i] >= batasLulus then
        writeln('LULUS')
    else
        writeln('TIDAK LULUS');
    end;

    writeln;
    write('Tekan Enter untuk keluar...');
    readln;
end.