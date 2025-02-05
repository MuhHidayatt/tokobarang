<?php
require_once __DIR__ . '/../vendor/autoload.php';

include("../controllers/Transaksi.php");
include("../controllers/Detailtransaksi.php");
include("../lib/functions.php");

$obj = new TransaksiController();
$detail = new DetailtransaksiController();

$search = isset($_GET['search']) ? $_GET['search'] : '';
$periode = isset($_GET['periode']) ? $_GET['periode'] : '';

list($tahun, $bulan) = $periode ? explode('-', $periode) : [null, null];

$rows = $obj->getTransaksiList($search, $bulan, $tahun);

$mpdf = new \Mpdf\Mpdf();

$html = '
<html>
<head>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; color: #333; }
        .header { text-align: center; margin-bottom: 20px; }
        .header img { width: 70px; height: auto; margin-bottom: 15px; }
        .title { font-size: 22px; font-weight: bold; margin-bottom: 5px; }
        .sub-title { font-size: 14px; color: #555; margin-bottom: 5px; }

        .table-container { width: 100%; border-radius: 8px; overflow: hidden; }
        table { width: 100%; border-collapse: collapse; background: #fff; }
        th, td { padding: 12px 10px; text-align: center; font-size: 10px; border: 1px solid #bbb; }

        /* Header */
        th { 
            background-color: #007BFF; 
            color: white; 
            text-transform: uppercase; 
            font-weight: bold; 
        }

        /* Baris ganjil dan genap */
        tr:nth-child(even) { background-color: #f9f9f9; }
        tr:nth-child(odd) { background-color: #ffffff; }
        
        /* Menambahkan hover effect */
        tr:hover { background-color: #eaf2ff; transition: 0.3s; }

        /* Lebar kolom yang berbeda */
        th:nth-child(1) { width: 6%; }  /* No */
        th:nth-child(2) { width: 12%; } /* Kode Transaksi */
        th:nth-child(3) { width: 13%; } /* Kode Pelanggan */
        th:nth-child(4) { width: 15%; } /* Nama Pelanggan */
        th:nth-child(5) { width: 23%; } /* Nama Barang */
        th:nth-child(6) { width: 11.8%; } /* Tanggal Transaksi */
        th:nth-child(7) { width: 9%; }  /* Jumlah */
        th:nth-child(8) { width: 11%; } /* Total Harga */

        /* Footer */
        .footer { text-align: right; font-size: 10px; color: #666; margin-top: 30px; }
    </style>
</head>
<body>

<div class="header">
    <img src="../themes/fobia/assets/images/tokobarang2.png" alt="Logo" style="width: 70px; height: auto; margin-bottom: 15px;">
    <div class="title">Laporan Penjualan</div>
    <div class="sub-title">
        Periode: ' . ($periode ? date("F Y", mktime(0, 0, 0, $bulan, 1)) : 'Semua Periode') . '<br>
        Search: ' . ($search ? "Kode Transaksi / Nama Pelanggan: " . htmlspecialchars($search) : 'Semua Data') . '
    </div>
</div>

<div class="table-container">
<table>
    <thead>
        <tr>
            <th>No</th>
            <th>Kode Transaksi</th>
            <th>Kode Pelanggan</th>
            <th>Nama Pelanggan</th>
            <th>Nama Barang</th>
            <th>Tanggal Transaksi</th>
            <th>Jumlah</th>
            <th>Total Harga</th>
        </tr>
    </thead>
    <tbody>';

$no = 1;  // Mulai nomor urut dari 1
foreach ($rows as $row) {
    $dibeli = $detail->countDetailtransaksi($row['id']);
    $total_harga = $detail->getTotalHarga($row['id']);

    $detailTransaksi = $detail->getDetailTransaksiList($row['id']);
    $nama_barang_list = [];
    foreach ($detailTransaksi as $detailRow) {
        $nama_barang_list[] = $detailRow['nama_barang'];
    }
    $nama_barang_str = implode(", ", $nama_barang_list);

    $html .= "
        <tr>
            <td>{$no}</td>  <!-- Menampilkan nomor urut -->
            <td>{$row['kode_transaksi']}</td>
            <td>{$row['kode_pelanggan']}</td>
            <td>{$row['nama']}</td>
            <td>{$nama_barang_str}</td>
            <td>{$row['tanggal_transaksi']}</td>
            <td>{$dibeli}</td>
            <td>" . number_format($total_harga, 0, ',', '.') . "</td>
        </tr>
    ";
    $no++;  // Increment nomor urut
}

$html .= '
    </tbody>
</table>
</div>

<div class="footer">
    Dicetak pada: ' . date("d-m-Y H:i:s") . '
</div>

</body>
</html>
';

$mpdf->WriteHTML($html);
$mpdf->Output('laporan_penjualan.pdf', 'I');
exit;
?>
