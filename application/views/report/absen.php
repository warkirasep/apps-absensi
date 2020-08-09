<div class="row mb-2">
    <h4 class="col-xs-12 col-sm-6 mt-0">Detail Absen</h4>
    <div class="col-xs-12 col-sm-6 ml-auto text-right">
        <form action="" method="get">
            <div class="row">
                <div class="col">
                    <select name="bulan" id="bulan" class="form-control">
                        <option value="" disabled selected>-- Pilih Bulan --</option>
                        <?php foreach($all_bulan as $bn => $bt): ?>
                            <option value="<?= $bn ?>" <?= ($bn == $bulan) ? 'selected' : '' ?>><?= $bt ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
			        <div class="col ">
                    <select name="tahun" id="tahun" class="form-control">
                        <option value="" disabled selected>-- Pilih Tahun</option>
                        <?php for($i = date('Y'); $i >= (date('Y') - 5); $i--): ?>
                            <option value="<?= $i ?>" <?= ($i == $tahun) ? 'selected' : '' ?>><?= $i ?></option>
                        <?php endfor; ?>
                    </select>
                </div>
                <div class="col ">
                    <button type="submit" class="btn btn-primary btn-fill btn-block">Tampilkan</button>
                </div>
            </div>
        </form>
    </div>
</div>

<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header border-bottom">
                <div class="row">
                    <div class="col-xs-12 col-sm-6">
                        <h4>Keterangan</h4>
                        <table class="table table-bordered">
                            <tr>
                                <td>H = Hadir</td>
                                <td>L = Libur</td>
                                <td>A = Alpa</td>
                            </tr>
                        </table>
                    </div>
                    <div class="col-xs-12 col-sm-6 ml-auto text-right mb-2">
                        <a href="<?= base_url('absensi/report_pdf/' . $this->uri->segment(3) . "?bulan=$bulan&tahun=$tahun") ?>" class="btn btn-success" target="_blank"><i class="fa fa-file-pdf-o"></i> Print</a>
                    </div>
                </div>
            </div>            
            <div class="card-body">
                <h4 class="card-title mb-4">Absen Bulan : <?= bulan($bulan) . ' ' . $tahun ?></h4>
                <div class="table-responsive" style="overflow-x: auto;">
                    <table class="table table-striped table-bordered" style="white-space:nowrap;">
                        <thead>
                            <tr>
                                <th><strong>Nama</strong></th>
                                <?php foreach($hari as $i => $h): ?>
                                <th><strong><?= date('d', strtotime($h['tgl'])); ?></strong></th>
                                <?php endforeach; ?>
                                <th><strong>Total</strong></th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach($karyawan as $row): ?>
                            <tr>
                                <td><?php echo $row->nama; ?></td>
                                <?php 
                                    $hadir = 0;
                                    $libur = 0;
                                ?>
                                <?php foreach($hari as $i => $h): ?>
                                    <?php 
                                        $res = cek_hadir($row->id_user, $h['tgl'], $bulan, $tahun);
                                        if($res == 'H')
                                        {
                                            $hadir++;
                                            echo '<td style="background: green;">H</td>';
                                        }elseif($res == 'A'){
                                            echo '<td style="background: red;">A</td>';
                                        }else {
                                            echo '<td style="background: white;">L</td>';
                                        } 
                                    ?>
                                <?php endforeach; ?>
                                <td><?php echo $hadir; ?></td>
                            </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
