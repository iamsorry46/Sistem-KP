<?php
$sub_menu3 = strtolower($this->uri->segment(3)); ?>
<!-- Main content -->
<div class="content-wrapper">
  <!-- Content area -->
  <div class="content">
    <!-- Dashboard content -->
    <div class="row">
      <!-- Basic datatable -->
      <div class="panel panel-flat">
        <div class="panel-heading">
          <h6 class="panel-title"><i class="icon-link2"></i> Data Penempatan <a class="heading-elements-toggle"><i class="icon-more"></i></a></h6>
          <div class="heading-elements">
            <ul class="icons-list">
                <li><a data-action="collapse"></a></li>
                <li><a data-action="close"></a></li>
            </ul>
           </div>
        </div>

        <div class="panel-body">
                <?php
                echo $this->session->flashdata('msg');
                ?>

                <table class="table datatable-basic" width="100%">
                  <thead>
                    <tr>
                      <th width="30px;">No.</th>
                      <th>NIS</th>
                      <th>Nama Siswa</th>
                      <th>Nama Pembimbing</th>
                      <th>Nama Industri</th>
                      <th>Tahun</th>
                      <th>Status</th>
                      <th class="text-center" width="380">Aksi</th>
                    </tr>
                  </thead>
                  <tbody>
                      <?php
                      error_reporting(0);
                      $no = 1;
                      foreach ($v_penempatan->result() as $baris) {
                        $nama_siswa = $this->db->get_where('tbl_siswa', "nis='$baris->nis'")->row()->nama_lengkap;
                        if ($nama_siswa == '') {
                            $nama_siswa = '-';
                        }
                        $nama_pembimbing = $this->db->get_where('tbl_pemb', "kdpemb='$baris->kdpemb'")->row()->nama_lengkap;
                        if ($nama_pembimbing == '') {
                            $nama_pembimbing = '-';
                        }
                        $nama_industri = $this->db->get_where('tbl_penempatan', "kdpenempatan='$baris->kdpenempatan'")->row()->nama_industri;
                        if ($nama_industri == '') {
                            $nama_industri = '-';
                        }
                      ?>
                        <tr>
                          <td><?php echo $no.'.'; ?></td>
                          <td><?php echo $baris->nis; ?></td>
                          <td><?php echo $nama_siswa; ?></td>
                          <td><?php echo $nama_pembimbing; ?></td>
                          <td><?php echo $nama_industri; ?></td>
                          <td><?php echo $baris->tahun; ?></td>
                          <td>
                            <?php
                            if ($baris->status == 'proses') {?>
                                <label class="label label-warning">Proses</label>
                            <?php
                            }elseif ($baris->status == 'ditolak') {?>
                                  <label class="label label-danger">Ditolak</label>
                              <?php
                            }elseif ($baris->status == 'diterima') {?>
                                <label class="label label-success">Diterima</label>
                            <?php
                            }else{
                                echo "-";
                            }
                            ?>
                          </td>
                          <td>
                            
                            <a <?php if ($baris->status != 'ditolak') {?>href="#" data-toggle="modal" data-target=".modal_tolak_<?php echo $no;?>"<?php }else{ ?>href="users/penempatan/tolak/<?php echo $baris->kdpenempatan; ?>"<?php } ?> class="btn btn-warning btn-xs">
                              <?php if ($baris->status == 'ditolak') {
                                        echo "Batal";
                                    }else {
                                        echo "Tolak";
                                    }
                              ?>
                            </a>
                            <a href="users/penempatan/setujui/<?php echo $baris->kdpenempatan; ?>" class="btn btn-success btn-xs" onclick="return confirm('Anda yakin?')">
                              <?php if ($baris->status == 'diterima') {
                                        echo "Batal";
                                    }else {
                                        echo "Setujui";
                                    }
                              ?>
                            </a>
                            <a href="users/penempatan/d/<?php echo $baris->kdpenempatan; ?>" class="btn btn-info btn-xs"><i class="icon-eye"></i></a>
                            <a href="users/penempatan/h/<?php echo $baris->kdpenempatan; ?>" class="btn btn-danger btn-xs" onclick="return confirm('Anda yakin?')"><i class="icon-trash"></i></a>
                            <?php if($baris->status=='diterima'): ?>
                            <button type="button" onclick="setPembimbing(<?=$baris->nis?>)" class="btn btn-success"><i class="fa fa-user"></i>Pembimbing</button>
                            <?php endif; ?>
                          </td>
                        </tr>

                        <div class="modal fade modal_tolak_<?php echo $no;?>" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                          <div class="modal-dialog modal-md">
                            <div class="modal-content">
                              <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                <h4 class="modal-title">Alasan ditolak</h4>
                              </div>
                              <hr>
                              <form action="" method="post">
                                <div class="modal-body">
                                  <input type="hidden" name="kdpenempatan_<?php echo $no;?>" value="<?php echo $baris->kdpenempatan; ?>">
                                  <textarea name="pesan_<?php echo $no;?>" class="form-control" rows="2" cols="80" placeholder="Alasan ditolak?" required></textarea>
                                </div>
                                <div class="modal-footer">
                                  <button type="button" class="btn btn-default" data-dismiss="modal">Tutup</button>
                                  <button type="submit" name="btntolak_<?php echo $no;?>" class="btn btn-primary" onclick="return confirm('Anda yakin?')">Kirim</button>
                                </div>
                              </form>
                            </div>
                          </div>
                        </div>
                      <?php
                      $no++;
                      } ?>
                  </tbody>
                </table>


          </div>
        </div>
      </div>

      <!-- /basic datatable -->
    </div>
    <!-- /dashboard content -->
<!-- Modal -->

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

  <div id="id01" class="w3-modal">
    <div class="w3-modal-content w3-card-4">
      <form action="<?=base_url('costume/simpanPembimbing')?>" method="post">
      <header class="w3-container w3-teal"> 
        <span onclick="document.getElementById('id01').style.display='none'" 
        class="w3-button w3-display-topright">&times;</span>
        <h2>Beri Pembimbing</h2>
      </header>
      <div class="w3-container">
      <input type="text"  name="nis" class="nis">
       <div class="form-group">
         <label for="">Pilih Pembimbing</label>
         <select name="kdpemb" id="kdpemb" class="form-control">
           <option value=""></option>
         </select>
         <small id="helpId" class="text-muted">Pilih Pembimbing</small>
       </div>
      </div>
      <footer class="w3-container">
        <button type="submit" class="btn btn-success btn-xs">Simpan </button>
      </footer>
      </form>
    </div>
  </div>
</div>

<script>
  function setPembimbing(nis) { 
    $.ajax({
      type: "POST",
      url: "<?=base_url('Costume/getPembimbing')?>",
      dataType: "JSON",
      success: function (response) {
        let html=""
        response.forEach(element => {
          html+=`<option value="${element.kdpemb}">${element.nama_lengkap}</option>`;
        });
        $("#kdpemb").html(html)
    $(".nis").val(nis)
    $(".nis").hide()
    $("#id01").attr('style','display:block');
      }
    });
   }

</script>