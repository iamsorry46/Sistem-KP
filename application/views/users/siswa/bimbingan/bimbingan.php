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
          <h6 class="panel-title"><i class="icon-book3"></i> Data Bimbingan <b><?php echo ucwords($user->row()->nama_lengkap); ?></b> <a class="heading-elements-toggle"><i class="icon-more"></i></a></h6>
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
                <a href="<?=base_url('users/buat_bimbingan/t')?>" class="btn btn-success btn-sm">Bimbingan</a>
                <br>
                History Bimbingan
                <table class="table table-bordered datatable-basic" width="100%">
                 <tbody>
                   <tr>
                     <td>Mahasiswa Mengirimkan Progres Laporan</td>
                     <td style="width: 10%;"></td>
                   </tr>
                   <tr>
                     <td style="width: 10%;"></td>
                     <td>Catatan Dosen Pembimbing</td>
                   </tr>
                 </tbody>
                </table>


          </div>
        </div>
      </div>

      <!-- /basic datatable -->
    </div>
    <!-- /dashboard content -->
