<?php
include("../controllers/Barang.php");
include("../lib/functions.php");
$obj = new BarangController();
if(isset($_GET["id"])){
    $id=$_GET["id"];
}

$msg=null;
if (isset($_POST["submitted"])==1 && $_SERVER["REQUEST_METHOD"] == "POST") {
    // Form was submitted, process the update here
    $id = $_POST['id'];
    $kode_barang = $_POST['kode_barang'];
    $nama_barang = $_POST['nama_barang'];
    $kategori = $_POST['kategori'];
    $harga = $_POST['harga'];
    $stok = $_POST['stok'];
    // Update the database record using your controller's method
$dat = $obj->updatebarang($id, $kode_barang, $nama_barang, $kategori, $harga, $stok);
$msg = getJSON($dat);
}
$rows = $obj->getBarang($id);
$theme=setTheme();
getHeader($theme);
?>

    <?php 
    if($msg===true){ 
        echo '<div class="alert alert-success" style="display: block" id="message_success">Update Data Berhasil</div>';
        echo '<meta http-equiv="refresh" content="2;url='.base_url().'barang/">';
    } elseif($msg===false) {
        echo '<div class="alert alert-danger" style="display: block" id="message_error">Update Gagal</div>'; 
    } else {

    }
    
    ?>
        <div class="header icon-and-heading">
        <i class="zmdi zmdi-view-dashboard zmdi-hc-4x custom-icon"></i>
        <h2><strong>Barang</strong> <small>Edit Data</small> </h2>
        </div>
        <hr style="margin-bottom:-2px;"/>
        <form name="formEdit" method="POST" action="">
            <input type="hidden" class="form-control" name="submitted" value="1"/>
            <?php foreach ($rows as $row): ?>
            
                    <div class="form-group">
                        <label>ID:</label>
                        <input type="text" class="form-control" id="id" name="id" 
                            value="<?php echo $row['id']; ?>" readonly/>
                    </div>
                
                    <div class="form-group">
                        <label>Kode Barang:</label>
                        <input type="text" class="form-control" id="kode_barang" name="kode_barang" 
                            value="<?php echo $row['kode_barang']; ?>" />
                    </div>
                
                    <div class="form-group">
                        <label>Nama Barang:</label>
                        <input type="text" class="form-control" id="nama_barang" name="nama_barang" 
                            value="<?php echo $row['nama_barang']; ?>" />
                    </div>
                
                    <div class="form-group">
                        <label>Kategori:</label>
                        <select class="form-control" name="kategori">
                            <option value="Perabotan">Perabotan</option>
                            <option value="Fashion">Fashion</option>
                            <option value="Elektronik">Elektronik</option>
                            <option value="Buku">Buku</option>
                            <option value="Aksesoris">Aksesoris</option>
                            <option value="Outdor">Outdor</option>
                        </select>
                    </div>

                
                    <div class="form-group">
                        <label>Harga:</label>
                        <input type="text" class="form-control" id="harga" name="harga" 
                            value="<?php echo $row['harga']; ?>" />
                    </div>
                
                    <div class="form-group">
                        <label>Stok:</label>
                        <input type="text" class="form-control" id="stok" name="stok" 
                            value="<?php echo $row['stok']; ?>" />
                    </div>
                
            
            <?php endforeach; ?>
            <button class="save btn btn-large btn-info" type="submit">Save</button>
            <a href="#index" class="btn btn-large btn-default">Cancel</a>
        </form>
                                        
<?php
getFooter($theme,"<script src='../lib/forms.js'></script>");
?>
</body>
</html>
