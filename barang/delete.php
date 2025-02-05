<?php
include("../controllers/Barang.php");
include("../lib/functions.php");

$obj = new BarangController();
$id = isset($_GET["id"]) ? $_GET["id"] : null;
$msg = null;

// Jika form disubmit
if (isset($_POST["submitted"]) && $_SERVER["REQUEST_METHOD"] == "POST") {
    $id = $_POST['id'];
    $kode_barang = $_POST['kode_barang'];
    $nama_barang = $_POST['nama_barang'];
    $kategori = $_POST['kategori'];
    $harga = $_POST['harga'];
    $stok = $_POST['stok'];

    // Proses update barang
    $dat = $obj->updatebarang($id, $kode_barang, $nama_barang, $kategori, $harga, $stok);
    $msg = getJSON($dat);
}

// Ambil data barang berdasarkan ID
$rows = $obj->getBarang($id);
$theme = setTheme();
getHeader($theme);
?>

<?php 
// Menampilkan pesan sukses atau error
if ($msg === true) { 
    echo '<div class="alert alert-success" style="display: block" id="message_success">Update Data Berhasil</div>';
    echo '<meta http-equiv="refresh" content="2;url=' . base_url() . 'barang/">';
} elseif ($msg === false) {
    echo '<div class="alert alert-danger" style="display: block" id="message_error">Update Gagal</div>'; 
}
?>

<div class="header icon-and-heading">
    <i class="zmdi zmdi-view-dashboard zmdi-hc-4x custom-icon"></i>
    <h2><strong>Barang</strong> <small>Edit Data</small></h2>
</div>
<hr style="margin-bottom:-2px;"/>

<?php if ($rows): ?>
    <form name="formEdit" method="POST" action="">
        <input type="hidden" name="submitted" value="1"/>

        <?php foreach ($rows as $row): ?>
            <div class="form-group">
                <label>ID:</label>
                <input type="text" class="form-control" name="id" value="<?php echo $row['id']; ?>" readonly/>
            </div>

            <div class="form-group">
                <label>Kode Barang:</label>
                <input type="text" class="form-control" name="kode_barang" value="<?php echo $row['kode_barang']; ?>" />
            </div>

            <div class="form-group">
                <label>Nama Barang:</label>
                <input type="text" class="form-control" name="nama_barang" value="<?php echo $row['nama_barang']; ?>" />
            </div>

            <div class="form-group">
                <label>Kategori:</label>
                <select class="form-control" name="kategori">
                    <?php 
                    $kategori_enum = ["Perabotan", "Fashion", "Elektronik", "Buku", "Aksesoris", "Outdor"];
                    foreach ($kategori_enum as $kategori) {
                        $selected = ($row['kategori'] == $kategori) ? "selected" : "";
                        echo "<option value='$kategori' $selected>$kategori</option>";
                    }
                    ?>
                </select>
            </div>

            <div class="form-group">
                <label>Harga:</label>
                <input type="text" class="form-control" name="harga" value="<?php echo $row['harga']; ?>" />
            </div>

            <div class="form-group">
                <label>Stok:</label>
                <input type="text" class="form-control" name="stok" value="<?php echo $row['stok']; ?>" />
            </div>
        <?php endforeach; ?>

        <button class="save btn btn-large btn-info" type="submit">Save</button>
        <a href="http://localhost/tokobarang/barang/" class="btn btn-large btn-default">Cancel</a>


    </form>
<?php else: ?>
    <div class="alert alert-warning">Data tidak ditemukan.</div>
<?php endif; ?>

<?php
getFooter($theme, "<script src='../lib/forms.js'></script>");
?>
</body>
</html>
